import wollok.game.game
import enemies.Enemy.Enemy
import enemies.EnemyAlias.EnemyAlias
import directions.down
import extras.calc
import extras.dev
import kamikazeMover.kamikazeMover
import HeroShip.WithCollideWithHeroShip
import config.settings.settings

class Kamikaze inherits WithCollideWithHeroShip and Enemy(award = 40, life = 2) {

  var property onBanzai = false
  var banzaiPosition = null
  var shootsDone = 0
  var currentImage = "kamikaze.png"
  var flickIter = true

  override method image() = currentImage  

  override method position() = if (onBanzai) banzaiPosition else super()
  
  method scheduleBanzai(){
  	dev.cLog("Cuidado que se tira" )
  	self.activateFlicker()
    game.schedule(5000, {
      self.banzai()
      self.deactivateFlicker()
    })
  }
  
  method activateFlicker() {
  	game.onTick(200, "KAMIKAZE_FLICKER" + self.identity().toString(), {
  		self.flick()
  	})
  }
  
  method flick() {
  	flickIter = not flickIter
  	if (flickIter) {
  		currentImage = "kamikaze.png"
  	} else {
  		currentImage = "kamikazeOnBanzai.png"
  	}
  }
  
  method deactivateFlicker() {
  	game.removeTickEvent("KAMIKAZE_FLICKER" + self.identity().toString())
  	currentImage = "kamikazeOnBanzai.png"
  }
  
  method banzai() {
    banzaiPosition = self.position()
    onBanzai = true
    life = 1
    award = 90
  }

  method move() {
    down.nextPosition(self)
    if(not(self.isInsideLimit())){
      dev.cLog(self.toString() + ": debo morir")
      self.remove()
    }
  }

  override method remove() {
    super()
    k.removeInstance(self)
  }
  
  override method collideWithHeroShip(heroship){heroship.die()}
  
  override method activateRecursiveAttack() {
  	super()
  	shootsDone += 1
  }
  
  override method recursiveAttack() {
  	if (not onBanzai) {
  		super()
  	}
  }
  
  override method attackType() {
  	if (shootsDone < 2) self.shoot() else self.randomAttack()
  }
  
  method randomAttack() {
  	const chances = calc.randomInRange(1,settings.BANZAI_PROBABILITY()).roundUp()
  	dev.cLog("Probabilidad de Banzai: salió un " + chances.toString())
  	if (chances == settings.BANZAI_PROBABILITY()) self.scheduleBanzai() else self.shoot() 
  }
}


object k inherits EnemyAlias{
  const kamikazes = #{}
  override method newInstance(rowIndex, itemIndex){
    const kamikazeShip = new Kamikaze(
      xOffset=itemIndex*xOffsetSize,
      yOffset=-1*rowIndex*yOffsetSize,
      flickIter=true
    )
    kamikazes.add(kamikazeShip)
    return kamikazeShip
  }
  method banzayers() = kamikazes.filter({kamikaze=> kamikaze.onBanzai()})
  method moveBanzayers(){
    self.banzayers().forEach({banzayer=>
      banzayer.move()
    })
  }
  method removeInstance(instance){ kamikazes.remove(instance) }
  method resetBanzayers() { kamikazes.clear() }
}
