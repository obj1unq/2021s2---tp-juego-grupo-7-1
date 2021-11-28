import wollok.game.*
import positions.dynamicPositionFactory
import moments.moments.*
import moments.GamePlay.*
import levels.levels.levels
import extras.RawMessage
import Display.*



object gameManager {
  /**
  > Almacena el estado global: puntaje actual, nivel actual, cantidad de vidas, etc.
  > Se encargar de switchear de entre los momentos/modos
  > Carga los diferentes niveles.
  */

  var property score
  var property life
  var property levelNumber
  var property currentMoment
  
  const property title = new RawMessage()
  const property scoreText = new RawMessage(position = dynamicPositionFactory.create(2,0))
  const property lifeText = new RawMessage(position = dynamicPositionFactory.create(40,0))
  
  const property scoreDisplay = new NumberDisplay(
  	label = "SCORE: ",
  	rawMessage = scoreText,
  	number = score
  )
  
  const property lifeDisplay = new LifeDisplay(
  	label = "LIFE: ",
  	rawMessage = lifeText,
  	number = life
  )
  
   
  // ---------------------------------------------
  method load(){
    self.introduceGame()
  }
  
  // Semantic moments
  method introduceGame(){
    self.switchTo(gameTitle)
  }
  method beginGame(){
    self.loadBeginingStatus()
    self.switchTo(new GamePlay())
  }
  
//  method switchToGamePlay(){
//  	const currentLevel = levels.level(levelNumber)
//  	
//    self.switchTo(new GamePlay(
//    	bulletsLimit=currentLevel.bulletsLimit(), 
//    	timeLimit=currentLevel.timeLimit()
//    ))
//  }
  
  method switchTo(moment){
    console.println("switchTo: " + moment.toString())
    
    self.clearPreviousMoment()
    title.setup()
    self.setupDisplays()
    moment.load()
    self.currentMoment(moment)
  }
  
  method clearPreviousMoment(){
    game.clear()
  }
  
  method setupDisplays() {
  	scoreDisplay.setup()
  	lifeDisplay.setup()
  }
  
  method increaseScore(amount){ 
  	score += amount
  	scoreDisplay.number(score)
  	scoreDisplay.update()
  }
  
  method increaseLevel(){ levelNumber = (levelNumber+1).min(levels.quantity()) }
  method decreaseLevel(){ levelNumber = 1.max(levelNumber-1) }
  
  method looseLife() { 
  	lifeDisplay.heartLoss()
  	life -= 1
  	lifeDisplay.number(life)
  	lifeDisplay.update()
    if (life == 0) { 
  	  self.switchToGameOver()
  	}
  }
  
  method switchToGameOver() {
  	game.schedule(1, {self.switchTo(gameOver)})
  }
  
  method fatalHit() {
  	life.times( { i => self.looseLife() } )
  }
  
  /** Private Methods ------------------------------------------------------- */
  method loadBeginingStatus(){
    score = 0
    life = 3
    levelNumber = 1
  }
}
