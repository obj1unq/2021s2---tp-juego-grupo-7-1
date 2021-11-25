import wollok.game.game
import config.settings.settings
import bullets.BulletsPool.WithBulletsPool
import extras.calc

object bulletsMover inherits WithBulletsPool{
  const speed = 20.0
  
  method activate(){
    if(settings.ACTIVATE_BULLETS_MOVER()){
      game.onTick(
        calc.speedBasedTick(speed),
        "BULLET_MOVER", 
        { self.moveBullets() }
      )      
    }
  }
  method moveBullets(){
    self.bulletsPool().shootedBullets().forEach({
      bullet => bullet.move()
    })
  }
}