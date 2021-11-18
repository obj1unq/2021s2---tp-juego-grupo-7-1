import wollok.game.game
import enemies.Enemy.Enemy
import directions.down
import extras.calc
import HeroShip.WithCollideWithHeroShip

class Kamikaze inherits WithCollideWithHeroShip and Enemy(award = 2, life = 2) {

  var onBanzai = false
  var banzaiPosition = null

  override method image() = "mcdonalds.png" // agregar imagen enemiga

  override method add(){
    super()
    self.scheduleBanzai()
  }
  override method position() = if (onBanzai) banzaiPosition else super()
  
  method scheduleBanzai(){
    game.schedule(calc.randomInRange(5000, 30000), {self.banzai()})
  }
  method banzai() {
    banzaiPosition = self.position()
    onBanzai = true
    life = 1
    // TODO: esto se podría mover con un solo mover tal como las balas
    // algo asi como un kamikazeMover, o incluso se podría armar un mover genérico.
    game.onTick(50, "BANZAI" + self.identity().toString(), {self.move()})
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
    game.removeTickEvent("BANZAI" + self.identity().toString())
  }
  
  override method collideWithHeroShip(heroship){ heroship.die() }
}
