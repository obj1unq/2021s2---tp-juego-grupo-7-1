import config.settings.settings
import wollok.game.game
import extras.calc

object kamikazeMover {
  const speed = 15.0
  const fallingShips = #{}
  
  method add(kamikaze) {
  	fallingShips.add(kamikaze)
  }
  
  method remove(kamikaze) {
  	fallingShips.remove(kamikaze)
  }
  
  method activate(){
    if(settings.ACTIVATE_KAMIKAZE_MOVER()){
      game.onTick(
        calc.speedBasedTick(speed),
        "KAMIKAZE_MOVER", 
        { self.moveShips() }
      )      
    }
  }
  method moveShips(){
//    console.println("cantidad de balas: " + bulletsFactory.bullets().size())
    fallingShips.forEach({
      kamikaze => kamikaze.move()
    })
  }
	
}
