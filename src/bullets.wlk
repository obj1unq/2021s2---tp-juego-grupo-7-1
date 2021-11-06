import wollok.game.*
import visuals.Visual
import gameManager.gameManager
import directions.*
import extras.tickCalculator
import positions.gameDimensions


object bulletsFactory{
  const property bullets = #{}
   
  method createHeroBullet(_position){
    const newBullet = new HeroBullet(position=_position)
    bullets.add(newBullet)
    return newBullet
  }
  method createEnemyBullet(_position){
    const newBullet = new EnemyBullet(position=_position)
    bullets.add(newBullet)
    return newBullet
  }
}

object bulletsMover{
  const speed = 20.0
  
  method activate(){
    game.onTick(
      tickCalculator.speedBasedTick(speed),
      "BULLET_MOVER", 
      { self.moveBullets() }
    ) 
  }
  method moveBullets(){
    bulletsFactory.bullets().forEach({
      bullet => bullet.move()
    })
  }
}

class Bullet inherits Visual {
  const direction = down
  method image() = "bullet.png"

  method remove() {
    game.removeVisual(self)
    bulletsFactory.bullets().remove(self)
  }
  
  method isInsideSafeArea()

  method move() {
  	if (self.isInsideSafeArea()) {
      direction.nextPosition(self)
    } else {
    	self.remove()
    }
  }
  
  method limit() {}

  method shoot() {
    self.add()
  }
    
  method receiveHit() {
  	self.remove()
  }
}
class HeroBullet inherits Bullet(direction=up) {

  override method image() = "heroBullet.png"
  
  override method isInsideSafeArea() {
  	return self.position().y() <= gameDimensions.safeArea().yMax()
  }
  
  override method add(){
    super()
    self.setupCollisions()
  }
  
  method setupCollisions() {
  	game.onCollideDo(self, 
  		{ 
			target => self.hit(target)
					  self.remove()
  		}
  	)
  }
  
  method hit(target) {
  	target.receiveHit()
  }
}
class EnemyBullet inherits Bullet {
  const property award = 10

  override method image() = "enemyBullet.png" 
  
  override method isInsideSafeArea() {
  	return self.position().y() >= gameDimensions.safeArea().yMin()
  }
  
  
}