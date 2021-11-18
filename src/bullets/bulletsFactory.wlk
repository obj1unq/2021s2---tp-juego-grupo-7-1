import bullets.HeroBullet.HeroBullet
import bullets.EnemyBullet.EnemyBullet

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
}