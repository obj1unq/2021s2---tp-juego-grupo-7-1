import wollok.game.game
import gameManager.gameManager
import visuals.Visual
import bullets.BulletsPool.WithBulletsPool

class Bullet inherits WithBulletsPool and Visual {
  const direction
  method image() = "bullet.png"

  override method remove() {
    super()
    self.bulletsPool().remove(self)
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