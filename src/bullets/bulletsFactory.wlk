import bullets.HeroBullet.HeroBullet
import bullets.EnemyBullet.EnemyBullet

object bulletsFactory{
  const property bullets = #{}
  
  method createHeroBullet(_position){
    const newBullet = new HeroBullet(position=_position)
    bullets.add(newBullet)
    return newBullet
  }
  method createEnemyBullet(enemy){
    const newBullet = new EnemyBullet(position=enemy.position().translatedNew(0, -1))
    bullets.add(newBullet)
    return newBullet
  }
}