import wollok.game.game
import enemies.Enemy.Enemy
import directions.down
import extras.calc
import HeroShip.WithCollideWithHeroShip
import kamikazeMover.kamikazeMover

class Kamikaze inherits Enemy(award = 2, life = 2) {

  var onBanzai = false
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
    kamikazeMover.remove(self)
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
