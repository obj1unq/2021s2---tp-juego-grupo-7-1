import wollok.game.*
import positions.dynamicPositionFactory
import moments.gameTitle.gameTitle
import moments.gameOver.gameOver
import moments.LevelCover.LevelCover
import moments.GamePlay.GamePlay
import levels.levels.levels
//import extras.NumberValue
import extras.RawMessage
import Display.*
import SoundPool.*


object gameManager {
  /**
  > Almacena el estado global: puntaje actual, nivel actual, cantidad de vidas, etc.
  > Se encargar de switchear de entre los momentos/modos
  > Carga los diferentes niveles.
  */

  var property currentMoment
  var property score = 0
  var property life = 0
  var property levelNumber = 0
  
  const property scoreDisplay = new NumberDisplay(
  	label="SCORE: ",
  	position=dynamicPositionFactory.create(2,0)
  )  
  const property lifeDisplay = new LifeDisplay(
  	label="LIFE: ",
  	position=dynamicPositionFactory.create(40,0)
  )
  const property title = new RawMessage()  
  
   
   
  // ---------------------------------------------
  method load(){
    self.introduceGame()
  }
    
  // Semantic moments
  method introduceGame(){
    self.switchTo(gameTitle)
  }
  method beginGame(){
    self.setBeginingStatus()
    self.beginCurrentLevel()
  }
  method goToNextLevel(){
    levelNumber += 1
    self.beginCurrentLevel()
  }
  
  method switchTo(moment){
    console.println("switchTo: " + moment.toString())   
    self.clearPreviousMoment()   
    self.currentMoment(moment)
    title.setup()   
    self.setupDisplays()
    moment.load()
  }

  method clearPreviousMoment(){
    game.clear()

  }
  
  method setupDisplays() {
  	scoreDisplay.setup(score)
  	lifeDisplay.setup(life)
  }
  
  method increaseScore(amount){ 
  	score += amount
  	scoreDisplay.update(score)
  }
  
  method increaseLevel(){ levelNumber = (levelNumber+1).min(levels.quantity()) }
  method decreaseLevel(){ levelNumber = 1.max(levelNumber-1) }
  
  method looseLife() { 
  	life -= 1
  	lifeDisplay.update(life)
    if (life == 0) { 
  	  self.switchToGameOver()
  	}
  }
  
  method switchToGameOver() {
  	game.schedule(1, {self.switchTo(gameOver)})
  }
  method switchToGamePlay() {
  	self.switchTo(new GamePlay())
  }
  
  method fatalHit() {
  	life.times( { i => self.looseLife() } )
  }
  
  method refreshDisplays(){
    lifeDisplay.update(life)
    scoreDisplay.update(score)
  }
  
  /** Private Methods ------------------------------------------------------- */
  method setBeginingStatus(){
    score = 0
    life = 3
    levelNumber = 1
    self.refreshDisplays()
  }
  method beginCurrentLevel(){
    self.switchTo(new LevelCover())
//    const currentLevel = levels.level(levelNumber)
//    
//    self.switchTo(new GamePlay(
//      bulletsLimit=currentLevel.bulletsLimit(), 
//      timeLimit=currentLevel.timeLimit()
//    ))   
  }
}
