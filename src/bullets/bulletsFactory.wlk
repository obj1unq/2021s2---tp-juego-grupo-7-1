import bullets.HeroBullet.HeroBullet
import bullets.EnemyBullet.EnemyBullet

object bulletsFactory{
  const property bullets = #{}
  
  method createHeroBullet(_position){
    const newBullet = new HeroBullet(position=_position)
    bullets.add(newBullet)
    return newBullet
  }
  method createEnemyBullet(_position){
    const newBullet = new EnemyBullet(position=_position)
    bullets.add(newBullet)
    return newBullet
  }
}