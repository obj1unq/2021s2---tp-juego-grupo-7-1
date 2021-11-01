import wollok.game.*
import Visual.Visual
import gameManager.gameManager
import directions.down
import extras.tickCalculator

class BulletFactory{
  const property bullets = #{}
  method create(_position)  
}
object heroBulletFactory inherits BulletFactory{
  override method create(_position){
    const newBullet = new HeroBullet(position=_position)
    bullets.add(newBullet)
    return newBullet
  }
}

object bulletsMover{
  const speed = 20.0
  const bulletsFactory = #{heroBulletFactory}
  
  method activate(){
    game.onTick(
      tickCalculator.speedBasedTick(speed),
      "BULLET_MOVER", 
      { self.moveBullets() }
    ) 
  }
  method moveBullets(){
    bulletsFactory.forEach({bulletFactory=>
      bulletFactory.bullets().forEach({bullet=>
        bullet.move()
      })      
    })
  }
}

class Bullet inherits Visual {
  const direction = down
  method image() = "bullet.png"

  method remove() {
    game.removeVisual(self)
    bulletFactory.bullets().remove(self)
  }

  method move() {
    direction.nextPosition(self)
//    if (self.limit()) { // reveer el area
//    } else {
//      self.remove()
//    }
  }
  
//  method limit() {
//  	return if (goesUp) {
//  	  self.position().y() < game.height() - 4
//  	} else {
//  	  self.position().y() > 0
//  	}
//  }

  method shoot() {
    self.add()
//    game.onTick(50, "BULLET_MOVEMENT" + self.identity().toString(), { self.move()})
  }
  override method add(){
    super()
    self.setupCollisions()
  }
  method setupCollisions(){
//    game.onCollideDo(self, { target =>
//      self.receiveHit(target.goesUp())
//      target.receiveHit(goesUp)
//    })
  }
//  method receiveHit(direction) {
//  	if (direction != goesUp) {
//    	self.remove()
//    }
//  }
}

class EnemyBullet inherits Bullet {

  const award = 10

  override method image() = "asparagus.png" // agregar imagen de tiro enemigo ".png" 

  override method receiveHit(direction) {
// podriamos agregar un validar disparo que compruebe si el disparo le tendria q hacer danio, remover o nada.
// con darle una orientacion a la bala (arriba y abajo) segun quien dispare si hero o enemy?
// si tiene la misma orientacion no tendria que eliminarse (?)
    if (direction != goesUp) {
    	gameManager.increaseScore(award) 
    	self.remove()	
    }
  }
}