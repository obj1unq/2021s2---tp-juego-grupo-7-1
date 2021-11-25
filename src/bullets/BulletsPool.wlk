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
    }
  }
  
  // TODO: Eliminar código repetido en los 2 métodos siguientes
  method shootEnemyBullet(enemy){
  	if(enemyBullets.size() > 0) {
  	  const toShootBullet = listHandler.pop(enemyBullets)
  	  shootedEnemyBullets.add(toShootBullet)
  	  
  	  toShootBullet.position().x(enemy.position().x())
  	  toShootBullet.position().y(enemy.position().y() - 1)
      toShootBullet.shoot()
  	}
  }
  method shootHeroBullet(heroShip) {
  	if(heroBullets.size() > 0) {
      const toShootBullet = listHandler.pop(heroBullets)
      shootedHeroBullets.add(toShootBullet)
      
      toShootBullet.position().x(heroShip.position().x())
      toShootBullet.position().y(heroShip.position().y() + 2)
      toShootBullet.shoot()
    }
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
    settings.ENEMY_BULLETS().times({i=> self.createHeroBullet() })
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