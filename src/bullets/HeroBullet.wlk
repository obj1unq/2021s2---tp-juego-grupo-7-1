import wollok.game.game
import bullets.Bullet.Bullet
import directions.up
import config.settings.settings
import gameManager.gameManager
import HeroShip.WithCollideWithHeroShip

class HeroBullet inherits WithGetHeroBullet and WithCollideWithHeroShip and Bullet(direction=up) {
				 	
  override method image() = "heroBullet.png"
  override method sound() = game.sound("sounds/heroShoot.mp3")
  override method add(){
    super()
    self.setupCollisions()
   	self.sound().play()
  }
  method decirNombre() {
    console.println(self.identity().toString())
  }
  method setupCollisions() {
    if(settings.ACTIVATE_COLLISIONS()){
    	game.onCollideDo(self, {target =>
    	  target.getHeroBullet()
  		  self.remove()
    	})      
    }
  }
  
  method hit(target) {
  	target.receiveHit()
  }
}

mixin WithGetHeroBullet{
  method getHeroBullet(){}
}