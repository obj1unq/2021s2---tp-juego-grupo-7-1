import wollok.game.game
import gameManager.gameManager
import visuals.Visual.Visual
import bullets.BulletsPool.WithBulletsPool
import SoundPool.*
import extras.dev


class Bullet inherits WithBulletsPool and Visual {
  const direction
  method image() = "bullet.png"
  method sound() = "shoot.wav"

  override method remove() {
    super()
    self.bulletsPool().remove(self) 	
  }

  method move() {
    direction.nextPosition(self)
  	if(not(self.isInsideLimit())){
      dev.cLog(self.toString() + ": debo morir")
  	  self.remove()
  	}
  }

  method shoot(){ 
  	self.add() 	
  }
  
  method receiveHit(){ self.remove() }
}