import wollok.game.*
import visuals.CompositeVisual
import extras.Anchor
import extras.tickCalculator
import bullets.*
import directions.*
import positions.*

object heroShipFactory{
  var lastCreated = null
  method create(){
    lastCreated = new HeroShip()
    return lastCreated
  }
  method lastCreated() = lastCreated
}

class HeroShip inherits CompositeVisual(
  width=3,
  height=2,
  assetPrefix = "px-void",
  position=new DynamicPosition(x=3, y=3),
  anchorImage="heroShip.png"
){
  var property life = 3
  var property speed = 50.0
  var property energy = 100

  const xMin = 2
  const xMax = game.width() - 2
  const yMin = 2
  const yMax = game.height() - 2
  
  var direction = neutral
  
  override method add() {
    super()
    self.activateMovement()
    self.setupAreaLimiting() 
    self.setupCollisions()
  }
  
  method setupCollisions() {
  	self.composition().forEach({
      fila => fila.forEach({pixel=>
        game.whenCollideDo(pixel, {foreign => pixel.receiveHit() })
      })
    })
  }
  
  method turn(_direction){
    direction = _direction
  }
  method move(){
    direction.nextPosition(anchor)
  }
  
  method activateMovement(){
    game.onTick(
      tickCalculator.speedBasedTick(speed),
      "MOVEMENT" + self.identity().toString(),
      { self.move() }
    ) 
  }
  method setupAreaLimiting(){
    self.position().xMin(xMin)
    self.position().xMax(xMax)
    self.position().yMin(yMin)
    self.position().yMax(yMax)
  }
  

  
  method die() { 
    game.stop()
  }
  
  method shoot() {
    const bullet = bulletsFactory.createHeroBullet(self.position().translated(1,1)) 
    bullet.shoot()
  }
  
  //  method receiveHit() {
//    self.lifeDecrease()
//  }
//
//  method lifeDecrease() {
//    if (life > 1) {
//      life -= 1
//    } else {
//      self.die()
//    }
//  }
   method receiveHit() {
		energy = 0.max(energy - 10)
		
		if (self.itsDead()) {
			// imagen de nave destruida
			self.lose()
		}
	}
	method itsDead(){
		return energy == 0
	}
	
	method lose() {
		if(life > 1){
			 game.say(self, "Perdiste una vida")
			 life -= 1
		} else { game.say(self, "Perdiste una vida") 
				 self.endGame()
				// self.die()
		}
	}
	method endGame() {
		game.schedule(2000, { game.stop()}) // podria ir a la pantalla de inicio
	}
}

