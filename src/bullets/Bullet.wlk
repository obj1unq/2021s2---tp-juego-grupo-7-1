import wollok.game.game
import visuals.Visual
import bullets.bulletsPool.bulletsPool

class Bullet inherits Visual {
  const direction
  method image() = "bullet.png"

  override method remove() {
    super()
    bulletsPool.remove(self)
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