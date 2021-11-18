import wollok.game.game
import config.settings.settings
import visuals.Visual
import bullets.bulletsFactory.bulletsFactory
import bullets.HeroBullet.WithGetHeroBullet
import gameManager.gameManager
import extras.calc

class Enemy inherits WithGetHeroBullet and Visual {
  const property award = 1
  var property life = 2
  var property anchor = null
  var property xOffset
  var property yOffset

  method image() = "hotdog.png"

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
    self.lifeDecrease()
  }

  method lifeDecrease() { if(life > 1) life-=1 else self.die() }

  method shoot() {
  	if (self.isOnScreen()) {
  		bulletsFactory.shootEnemyBullet(self)
  	}
  }

  method die() {
    self.remove()
    gameManager.removeEnemy(self)
    gameManager.increaseScore(award)
  }
  
  /** PRIVATES -------------------------------------------------------------- */
  method activateRecursiveAttack() {
    game.schedule(self.randomAttackDelay(), {self.recursiveAttack()})
  }
  method recursiveAttack(){
    self.shoot()
    self.activateRecursiveAttack()
  }
  method randomAttackDelay() = calc.randomInRange(3000, 15000)
  

}