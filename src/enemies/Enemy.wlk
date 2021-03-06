import wollok.game.game
import config.settings.settings
import visuals.Visual.Visual
import bullets.BulletsPool.WithBulletsPool
import bullets.HeroBullet.WithGetHeroBullet
import gameManager.gameManager
import extras.calc
import extras.dev
import extras.ItemCount1
import HeroShip.WithCollideWithHeroShip
import Explosion.WithShowExplosion
import SoundPool.*


class Enemy inherits
  WithBulletsPool
  and ItemCount1
  and WithCollideWithHeroShip
  and WithGetHeroBullet
  and WithShowExplosion
  and Visual
{
  var property award = null
  var property life = null
  var property anchor = null
  var property xOffset
  var property yOffset

  method image()
	
  

  override method position(){
    position.x(anchor.position().x()+xOffset)
    position.y(anchor.position().y()+yOffset)
    return position
  }

  override method add() {
    super()
    self.activateRecursiveAttack()
  }

  override method getHeroBullet() {
  	gameManager.increaseScore(10)
  	dev.cLog( "puntaje: " + gameManager.score().toString())
  	
    self.lifeDecrease()
    enemySounds.playCollision()
    
    self.showExplosion()
  }

  method lifeDecrease() { if(life > 1) life-=1 else self.die() }

  method shoot() {
  	if(game.hasVisual(self)) {
  	  self.bulletsPool().shootEnemyBullet(self)
    }
  }

  method die() {
    self.remove()
    self.level().removeEnemy(self)
    gameManager.increaseScore(award)
    dev.cLog("enemies left: " + gameManager.currentMoment().enemiesLeft())
    dev.cLog("puntaje: " + gameManager.score().toString())
  }
  
  method activateRecursiveAttack() {
  	if (self.isInsideLimit()) {
      game.schedule(self.randomAttackDelay(), {self.recursiveAttack()})
  	}
  }
  method recursiveAttack(){
  	self.attackType()
    self.activateRecursiveAttack()
  }
  method randomAttackDelay() = calc.randomInRange(3000, 15000)
  method attackType()
  
  override method collideWithHeroShip(heroship){
  	dev.cLog(heroship.toString())
  	gameManager.fatalHit()
  	heroSounds.playCollision()
  }
  
  override method remove() {
  	gameManager.currentMoment().enemyDown()
  	super()
  }
  
  /**
   * Private Methods -----------------------------------------------------------
   */
  method level(){
    // Shortcut method to level
    return gameManager.currentMoment().level()
  }
  override method explosionPosition(){
    return self.position().translatedNew(-1, -1)
  }
}