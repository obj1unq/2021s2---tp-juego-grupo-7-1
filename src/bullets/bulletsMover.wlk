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
//    console.println("cantidad de balas: " + bulletsPool.bullets().size())
    self.bulletsPool().bullets().forEach({
      bullet => bullet.move()
    })
  }
}