import config.settings.settings
import wollok.game.game
import extras.calc
import formations.k

object kamikazeMover {
  const speed = 15.0
  
  method activate(){
    game.schedule(1000, {
      if(settings.ACTIVATE_KAMIKAZE_MOVER()){
        game.onTick(
          calc.speedBasedTick(speed),
          "KAMIKAZE_MOVER", 
          { k.moveBanzayers() }
        )
      }      
    })
  }	
}
