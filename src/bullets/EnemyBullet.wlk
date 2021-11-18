import bullets.Bullet.Bullet
import directions.down

class EnemyBullet inherits Bullet(direction=down) {
  const property award = 10
  override method image() = "enemyBullet.png"  
}