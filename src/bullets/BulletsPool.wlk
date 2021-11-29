import gameManager.gameManager
import bullets.HeroBullet.HeroBullet
import bullets.EnemyBullet.EnemyBullet
import config.settings.settings
import extras.listHandler

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
  	  
  	  self.shooter(toShootBullet, enemy, 0, -1)
  	}
  }
  method shootHeroBullet(heroShip) {
  	if(heroBullets.size() > 0) {
      const toShootBullet = listHandler.pop(heroBullets)
      shootedHeroBullets.add(toShootBullet)
      
      self.heroShooter(toShootBullet, heroShip)
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
    settings.HERO_BULLETS().times({i=> self.createHeroBullet() })
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