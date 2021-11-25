import wollok.game.game
import enemies.Enemy.Enemy
import enemies.EnemyAlias.EnemyAlias
import directions.down
import extras.calc
import kamikazeMover.kamikazeMover
import HeroShip.WithCollideWithHeroShip


class Kamikaze inherits WithCollideWithHeroShip and Enemy(award = 40, life = 2) {

  var property onBanzai = false
  var banzaiPosition = null
  var shootsDone = 0

  override method image() = "kamikaze.png" // agregar imagen enemiga

  override method position() = if (onBanzai) banzaiPosition else super()
  
  method scheduleBanzai(){
    game.schedule(calc.randomInRange(5000, 30000), {self.banzai()})
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
      console.println(self.toString() + ": debo morir")
      self.remove()
    }
  }

  override method remove() {
    super()
    k.removeInstance(self)
  }
  
  override method collideWithHeroShip(heroship){ heroship.die() }
  
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
  	const chances = calc.randomInRange(1,5).roundUp()
  	console.println(chances.toString())
  	if (chances == 5) self.scheduleBanzai() else self.shoot() 
  }
}


object k inherits EnemyAlias{
  const kamikazes = #{}
  override method newInstance(rowIndex, itemIndex){
    const kamikazeShip = new Kamikaze(
      xOffset=itemIndex*xOffsetSize,
      yOffset=-1*rowIndex*yOffsetSize
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
}
