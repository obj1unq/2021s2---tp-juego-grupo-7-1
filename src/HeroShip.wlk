import wollok.game.*
import config.settings.*
import visuals.CompositeVisual
import extras.Anchor
import extras.tickCalculator
import directions.*
import positions.*
import bullets.bulletsFactory.bulletsFactory

class HeroShip inherits CompositeVisual(
  width=3, height=2,
  position=new DynamicPosition(x=3, y=3),
  limit=new Limit(right=game.width()-3, up=game.height()-2),
  anchorImage="heroShip.png"
){

  var property life = 3
  var property speed = 50.0
  var property energy = 100
  var direction = neutral

  override method add() {
    super()
    self.activateMovement()
    self.setupCollisions()
  }
  

  method turn(_direction){ direction = _direction }

  method move(){ direction.nextPositionLimited(self) }
  

  

  method shoot() {
    const bullet = bulletsFactory.createHeroBullet(self.position().translatedNew(1, 2))
    bullet.shoot()
  }

//  method receiveHit() {
//    console.println("HeroShip: receiveHit")
//    energy = 0.max(energy - 10)
//    if (self.itsDead()) {
//      // imagen de nave destruida
//      self.lose()
//    }
//  }
  
//  method die() {
//    game.stop()
//  }
  
//  method itsDead() {
//    return energy == 0
//  }

//  method lose() {
//    if (life > 1) {
//      game.say(self, "Perdiste una vida")
//      life -= 1
//    } else {
//      game.say(self, "Perdiste una vida")
//      self.endGame()
//    // self.die()
//    }
//  }

//  method endGame() {
//    game.schedule(2000, { game.stop()}) // podria ir a la pantalla de inicio
//  }
  
  /** PRIVATES -------------------------------------------------------------- */
  
  method activateMovement() {
    game.onTick(
      tickCalculator.speedBasedTick(speed),
      "MOVEMENT" + self.identity().toString(),
      { self.move()}
    )
  }
//  method setupAreaLimiting() {
//    self.position().xMin(xMin)
//    self.position().xMax(xMax)
//    self.position().yMin(yMin)
//    self.position().yMax(yMax)
//  }
  method setupCollisions() {
    if(settings.ACTIVATE_COLLISIONS()){
      self.composition().forEach({pixel=>
  //      game.whenCollideDo(pixel, { foreign => self.receiveHit()})
      })
      
    }
  }
}

