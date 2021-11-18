import wollok.game.game
import config.settings.settings
import bullets.bulletsFactory.bulletsFactory
import extras.calc

object bulletsMover{
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
//    console.println("cantidad de balas: " + bulletsFactory.bullets().size())
    bulletsFactory.bullets().forEach({
      bullet => bullet.move()
    })
  }
}