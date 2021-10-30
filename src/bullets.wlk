import wollok.game.*
import Visual.Visual
import gameManager.gameManager
import bulletFactory.*

class Bullet inherits Visual {
	
  const property goesUp 

  method image() = "asparagus.png"

  method remove() {
    game.removeVisual(self)
    bulletFactory.bullets().remove(self)
  }

  method move() {
    if (self.limit()) { // reveer el area
      self.nextPosition()
    } else {
      self.remove()
    }
  }
  
  method limit() {
  	return if (goesUp) {
  	  self.position().y() < game.height() - 4
  	} else {
  	  self.position().y() > 0
  	}
  }
  
  method nextPosition() {
  	if (goesUp) {
  	  self.position( self.position().up(1) )
  	} else {
  	  self.position( self.position().down(1) )
  	}
  }

  method shoot() {
    console.println("disparo")
    self.add()
//    game.onTick(50, "BULLET_MOVEMENT" + self.identity().toString(), { self.move()})
    game.onCollideDo(self, { target =>
      self.receiveHit(target.goesUp())
      target.receiveHit(goesUp)
    })
  }

  method receiveHit(direction) {
  	if (direction != goesUp) {
    	self.remove()
    }
  }
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



