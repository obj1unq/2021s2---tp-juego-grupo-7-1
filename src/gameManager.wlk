import wollok.game.*

import moments.gameTitle
import extras.rawMessage

object gameManager {
  /**
  > Almacena el estado global: puntaje actual, nivel actual, cantidad de vidas, etc.
  > Se encargar de switchear de entre los momentos/modos
  > Carga los diferentes niveles.
  */
  const genesis = gameTitle
  
  var property score = 0
  var property lifes = 5
  var property level = 1
   
  // ---------------------------------------------
  method initialize(){
    self.switchTo(genesis)
  }
  
  method switchTo(moment){
    self.clearMoment()
    rawMessage.setup()
    moment.initialize()
  }
  method clearMoment(){
    game.clear()
    // garbage collector ???
  }
  
  method increaseScore(amount){ score += amount }
  
}
