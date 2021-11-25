import wollok.game.*
import moments.moments.*
import moments.GamePlay.*
import levels.levels.levels
import extras.rawMessage

object gameManager {
  /**
  > Almacena el estado global: puntaje actual, nivel actual, cantidad de vidas, etc.
  > Se encargar de switchear de entre los momentos/modos
  > Carga los diferentes niveles.
  */
  const genesis = gameTitle
  
  
  var property score = 0
  var property lifes = 3
  var property levelNumber = 1
  var property currentMoment
   
  // ---------------------------------------------
  method load(){
    self.switchTo(genesis)
  }
  
  method switchToGamePlay(){
    self.switchTo(new GamePlay())
  }
  
  method switchTo(moment){
    console.println("switchTo: " + moment.toString())
    
    self.clearPreviousMoment()
    rawMessage.setup()
    moment.load()
    self.currentMoment(moment)
  }
  method clearPreviousMoment(){
    game.clear()
  }
  
  method increaseScore(amount){ score += amount }
  method increaseLevel(){ levelNumber = (levelNumber+1).min(levels.quantity()) }
  method decreaseLevel(){ levelNumber = 1.max(levelNumber-1) }
  
  method looseLife() { 
  	if(lifes > 1) lifes -= 1 else self.switchTo(gameOver)
  }
}
