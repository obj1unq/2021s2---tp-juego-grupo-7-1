import wollok.game.*
import moments.gameTitle
import levels.levels
import extras.rawMessage

object gameManager {
  /**
  > Almacena el estado global: puntaje actual, nivel actual, cantidad de vidas, etc.
  > Se encargar de switchear de entre los momentos/modos
  > Carga los diferentes niveles.
  */
  const genesis = gameTitle
  
  // TODO: chequear que esto tal vez convenga que viva en GamePlay
  var property levelObject
  
  var property score = 0
  var property lifes = 5
  var property level = 1
   
  // ---------------------------------------------
  method load(){
    self.switchTo(genesis)
  }
  
  method switchTo(moment){
    self.clearPreviousMoment()
    rawMessage.setup()
    moment.load()
  }
  method clearPreviousMoment(){
    game.clear()
  }
  
  method increaseScore(amount){ score += amount }
  method increaseLevel(){ level = (level+1).min(levels.list().size()) }
  method decreaseLevel(){ level = 1.max(level-1) }
  
}
