import wollok.game.*
import config.settings.*
import visuals.CompositeVisual.CompositeVisual
import extras.Anchor
import extras.calc
import extras.dev
import directions.*
import positions.*
import gameManager.gameManager
import bullets.BulletsPool.WithBulletsPool
import SoundPool.*
import Explosion.WithShowExplosion

class HeroShip inherits
  WithBulletsPool
  and WithShowExplosion
  and CompositeVisual
(
  width=3, height=2,
  position=new DynamicPosition(x=3, y=3),
  limit=new Limit(right=game.width()-3, up=game.height()-2),
  anchorImage="heroShip.png",
  assetPrefix = "px-void"
){
  var property life = 3
  var property speed = 50.0
  var property energy = 100
  var property cannon = false
  var direction = neutral

  override method add() {
    super()
    self.activateMovement()
    self.setupCollisions()
  }

  method turn(_direction){ direction = _direction }
  method move(){ direction.nextPositionLimited(self) }

  method shoot() {
  	if(self.canShoot()) {
  	  self.bulletsPool().shootHeroBullet(self)
  	  gameManager.currentMoment().bulletShooted()
  	}
  }
  
  method canShoot() {
  	return(
  	  not gameManager.currentMoment().noMoreBullets()
  		and not self.bulletsPool().heroLimitReached()
    )
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
        game.onCollideDo(pixel, {foreign => 
          foreign.collideWithHeroShip(self) 							    						  
        })
      })
    }
  }

  method getShot() {
    dev.cLog("HeroShip: receiveHit")
    self.showExplosion()
    heroSounds.playCollision()
    gameManager.looseLife()
  }  
  method die() {
  	dev.cLog("HeroShip: fatalHit")
  	heroSounds.playCollision()
  	gameManager.fatalHit()
  }
  
  method switchCannon() {
  	cannon = not cannon
  }
  override method explosionPosition(){
    return self.position().translatedNew(0, 0)
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
