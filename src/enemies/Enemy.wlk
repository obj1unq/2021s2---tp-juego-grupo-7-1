import wollok.game.game
import config.settings.settings
import visuals.Visual
import bullets.BulletsPool.WithBulletsPool
import bullets.HeroBullet.WithGetHeroBullet
import gameManager.gameManager
import extras.calc
import HeroShip.WithCollideWithHeroShip

class Enemy inherits
  WithBulletsPool
  and WithCollideWithHeroShip
  and WithGetHeroBullet
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
  	console.println( "puntaje :" + gameManager.score().toString())
    self.lifeDecrease()
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
    console.println( "puntaje :" + gameManager.score().toString())
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
  
  /**
   * Private Methods -----------------------------------------------------------
   */
  method level(){
    // Shortcut method to level
    return gameManager.currentMoment().level()
  }
}