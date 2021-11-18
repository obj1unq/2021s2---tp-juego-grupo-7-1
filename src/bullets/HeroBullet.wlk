import bullets.Bullet.Bullet
import directions.up


class HeroBullet inherits Bullet(direction=up) {
  override method image() = "heroBullet.png"
  
//  override method add(){
//    super()
//    self.setupCollisions()
//  }
  
//  method setupCollisions() {
//  	game.onCollideDo(self, {target =>
//  	  self.hit(target)
//		  self.remove()
//  	})
//  }
  
  method hit(target) {
  	target.receiveHit()
  }
}