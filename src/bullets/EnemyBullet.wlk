import bullets.Bullet.Bullet
import directions.down
import HeroShip.WithCollideWithHeroShip
import bullets.HeroBullet.WithGetHeroBullet
import SoundPool.*
import wollok.game.*

class EnemyBullet inherits WithCollideWithHeroShip and WithGetHeroBullet and Bullet(direction=down) {
  const property award = 10
  override method image() = "enemyBullet.png"
  override method sound() = game.sound("sounds/enemyShoot.mp3")
  override method collideWithHeroShip(heroship){
    heroship.getShot()
    self.remove()
  }
}