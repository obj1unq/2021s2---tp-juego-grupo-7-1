import wollok.game.*
import config.settings.*
import visuals.CompositeVisual.CompositeVisual
import extras.Anchor
import extras.calc
import directions.*
import positions.*
import gameManager.gameManager
import bullets.BulletsPool.WithBulletsPool

class HeroShip inherits WithBulletsPool and CompositeVisual(
  width=3, height=2,
  position=new DynamicPosition(x=3, y=3),
  limit=new Limit(right=game.width()-3, up=game.height()-2),
  anchorImage="heroShip.png",
  assetPrefix = "px-void"
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
  	self.bulletsPool().shootHeroBullet(self)
  	gameManager.currentMoment().bulletShooted()
  }

  /** -------------------------------------------------------------------------
   * Private Methods
   */
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
        game.onCollideDo(pixel, { foreign => foreign.collideWithHeroShip(self)})
      })
    }
//    game.onTick(50, "check_collisions", {
//      self.composition().forEach({pixel=>
//        collisioner.onCollideDo(pixel, {
//          foreign => foreign.collideWithHeroShip(self)
//        })      
//      })      
//    })
  }

  method getShot() {
    console.println("HeroShip: receiveHit")
    gameManager.looseLife()  
  }  
}
mixin WithCollideWithHeroShip {
  /**
   * Usar este mixin aunque se vaya a sobre escribir tiene una función similar
   * al template method. Asegura que todos los objetos que puedan colisionar con
   * la HeroShip estén enlazados y se implementen de la misma forma. 
   */
  method collideWithHeroShip(heroship){}
}

//  method endGame() {
//    game.schedule(2000, { game.stop()}) // podria ir a la pantalla de inicio
//  }  