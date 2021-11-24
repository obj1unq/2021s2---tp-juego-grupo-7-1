import bullets.HeroBullet.HeroBullet
import bullets.EnemyBullet.EnemyBullet
import config.settings.settings

object bulletsFactory{
  const property enemyBullets = #{}
  const property heroBullets = #{}
  
  method bullets() = enemyBullets + heroBullets
  method createHeroBullet(_position){
    const newBullet = new HeroBullet(position=_position)
    heroBullets.add(newBullet)
    return newBullet
  }
  method createEnemyBullet(enemy){
    const newBullet = new EnemyBullet(position=enemy.position().translatedNew(0, -1))
    enemyBullets.add(newBullet)
    return newBullet
  }
  method enemyBulletsOnScreen() = self.enemyBullets().size()
  method remove(bullet){
    if(enemyBullets.contains(bullet)){
      enemyBullets.remove(bullet)
    }else{
      heroBullets.remove(bullet)    
    }
  }
  method shootEnemyBullet(bullet){
  	if(not self.tooMuchBullets()) {
  	  const newBullet = self.createEnemyBullet(bullet)
      newBullet.shoot()
  	}
  }
  method shootHeroBullet(_position) {
  	  const newBullet = self.createHeroBullet(_position)
  	  newBullet.shoot()
  }
  method tooMuchBullets() {
  	return self.enemyBulletsOnScreen() >= settings.MAX_ENEMY_BULLETS_ON_SCREEN()
  }
  method printBulletsCount(){
    console.println("enmyB: " + enemyBullets.size() + " | hroB: " + heroBullets.size() + " | ttl: " + self.bullets().size())
  }
}