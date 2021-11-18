import wollok.game.game
import visuals.Visual
import bullets.bulletsFactory.bulletsFactory

class Bullet inherits Visual {
  const direction
  method image() = "bullet.png"

  override method remove() {
    super()
    bulletsFactory.bullets().remove(self)
  }

  method move() {
    direction.nextPosition(self)
  	if(not(self.isInsideLimit())){
      console.println(self.toString() + ": debo morir")
  	  self.remove()
  	}
  }

  method shoot(){ self.add() }
    
  method receiveHit(){ self.remove() }
}