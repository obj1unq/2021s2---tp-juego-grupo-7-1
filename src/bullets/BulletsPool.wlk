import gameManager.gameManager
import bullets.HeroBullet.HeroBullet
import bullets.EnemyBullet.EnemyBullet
import config.settings.settings
import extras.listHandler
import SoundPool.*

class BulletsPool{
  const property enemyBullets = []
  const property heroBullets = []
  const property shootedEnemyBullets = []
  const property shootedHeroBullets = []
  
  method shootedBullets() = shootedEnemyBullets + shootedHeroBullets
  method load(){
    self.preloadEnemyBullets()
    self.preloadHeroBullets()
    
  }
  
  
  method remove(bullet){
    if(shootedEnemyBullets.contains(bullet)){
      shootedEnemyBullets.remove(bullet)
      enemyBullets.add(bullet)
    }else{
      shootedHeroBullets.remove(bullet)
      heroBullets.add(bullet)
      self.shouldKeepShooting()
    }
 
  }
  
  method shouldKeepShooting() {
  	if (self.heroWontShootAnymore()) {
  	  gameManager.switchToGameOver()
  	}
  }
  
  method heroWontShootAnymore() {
  	const gamePlay = gameManager.currentMoment()
  	
  	return gamePlay.noMoreBullets() and self.heroBullets().size()==5
  }
  
  method shootEnemyBullet(enemy){
  	if(enemyBullets.size() > 0) {
  	  const toShootBullet = listHandler.pop(enemyBullets)
  	  shootedEnemyBullets.add(toShootBullet)
  	  
<<<<<<< HEAD
  	  toShootBullet.position().x(enemy.position().x())
  	  toShootBullet.position().y(enemy.position().y() - 1)
      toShootBullet.shoot()
      
=======
  	  self.shooter(toShootBullet, enemy, 0, -1)
>>>>>>> branch 'master' of git@github.com:obj1unq/2021s2---tp-juego-grupo-7-1.git
  	}
  }
  method shootHeroBullet(heroShip) {
  	if(heroBullets.size() > 0) {
      const toShootBullet = listHandler.pop(heroBullets)
      shootedHeroBullets.add(toShootBullet)
      
<<<<<<< HEAD
      toShootBullet.position().x(heroShip.position().x())
      toShootBullet.position().y(heroShip.position().y() + 2)
      toShootBullet.shoot()
   
=======
      self.heroShooter(toShootBullet, heroShip)
>>>>>>> branch 'master' of git@github.com:obj1unq/2021s2---tp-juego-grupo-7-1.git
    }
  }
  
  method shooter(bullet, ship, xOffset, yOffset) {
  	bullet.position().x(ship.position().x() + xOffset)
  	bullet.position().y(ship.position().y() + yOffset)
  	bullet.shoot()
  }
  
  method heroShooter(bullet,ship) {
  	var offset
  	ship.switchCannon()
  	if(ship.cannon()) offset=0 else offset=2
  	self.shooter(bullet,ship,offset,2)
  }
  
  method heroLimitReached() {
  	return shootedHeroBullets.size() == 5
  }
  /**
   * Private Methods -----------------------------------------------------------
   */
  method enemyBulletsOnScreen() = self.enemyBullets().size()
  method tooMuchBullets() {
  	return self.enemyBulletsOnScreen() >= settings.MAX_ENEMY_BULLETS_ON_SCREEN()
  }
  method createHeroBullet(){
    const newBullet = new HeroBullet()
    heroBullets.add(newBullet)
  }
  method createEnemyBullet(){
    const newBullet = new EnemyBullet()
    enemyBullets.add(newBullet)
  }
  
  method preloadEnemyBullets(){
    settings.ENEMY_BULLETS().times({i=> self.createEnemyBullet() })
  }
  method preloadHeroBullets(){
<<<<<<< HEAD
    settings.ENEMY_BULLETS().times({i=> self.createHeroBullet() })
    
=======
    settings.HERO_BULLETS().times({i=> self.createHeroBullet() })
>>>>>>> branch 'master' of git@github.com:obj1unq/2021s2---tp-juego-grupo-7-1.git
  }
//  method printBulletsCount(){
//    console.println(
//      "enmyB: "
//      + enemyBullets.size()
//      + " | hroB: "
//      + heroBullets.size()
//      + " | ttl: "
//      + self.shootedBullets().size()
//    )
//  }
}




mixin WithBulletsPool{
  method bulletsPool() = gameManager.currentMoment().level().bulletsPool()
}