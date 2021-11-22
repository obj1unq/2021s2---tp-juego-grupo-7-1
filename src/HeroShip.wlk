import wollok.game.*
import config.settings.*
import visuals.CompositeVisual
import extras.Anchor
import extras.calc
import directions.*
import positions.*
import bullets.bulletsFactory.bulletsFactory


class HeroShip inherits CompositeVisual(
  width=3, height=2,
  position=new DynamicPosition(x=3, y=3),
  limit=new Limit(right=game.width()-3, up=game.height()-2),
  anchorImage="heroShip.png",
  assetPrefix = "px-green"
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
    // TODO: esto habría que optimizarlo con template method
    const bullet = bulletsFactory.createHeroBullet(self.position().translatedNew(1, 2))
    bullet.shoot()
  }
  /** PRIVATES -------------------------------------------------------------- */
  
  method activateMovement() {
    game.onTick(
      calc.speedBasedTick(speed),
      "MOVEMENT" + self.identity().toString(),
      { self.move()}
    )
  }
  method setupCollisions() {
    if(settings.ACTIVATE_COLLISIONS()){
      self.composition().forEach({pixel=>
        game.whenCollideDo(pixel, { foreign => foreign.collideWithHeroShip(self)})
      })
      
    }
  }
//  method collide(foreign){
////    console.println("heroship colliding")
//    if(foreign.toString() == "a EnemyBullet"){
//      self.getShot()
//      foreign.remove()
//    }else if(foreign.toString() == "a Kamikaze"){
//      self.die()
//    }
//  }
  method getShot() {
    energy = 0.max(energy - 10)
    console.println("HeroShip: receiveHit")
//    if (self.itsDead()) {
//      // imagen de nave destruida
//      self.lose()
//    }
  }
  
  method die() {
    game.stop()
  }
  
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
}
mixin WithCollideWithHeroShip {
  /**
   * Usar este mixin aunque se vaya a sobre escribir tiene una función similar
   * al template method. Asegura que todos los objetos que puedan colisionar con
   * la HeroShip estén enlazados y se implementen de la misma forma. 
   */
  method collideWithHeroShip(heroship){}
}

