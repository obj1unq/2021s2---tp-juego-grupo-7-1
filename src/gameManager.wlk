import wollok.game.*
import positions.dynamicPositionFactory
import moments.gameTitle.gameTitle
import moments.gameOver.gameOver
import moments.LevelCover.LevelCover
import moments.GamePlay.GamePlay
import levels.levels.levels
import extras.NumberValue
import extras.RawMessage
import Display.*


object gameManager {
  /**
  > Almacena el estado global: puntaje actual, nivel actual, cantidad de vidas, etc.
  > Se encargar de switchear de entre los momentos/modos
  > Carga los diferentes niveles.
  */

  var property currentMoment
  var property score = new NumberValue(value=0)
  var property life = new NumberValue(value=0)
  var property levelNumber = new NumberValue(value=1)
  
  const property scoreDisplay = new NumberDisplay(
  	label="SCORE: ",
  	position=dynamicPositionFactory.create(2,0),
  	numberValue=score
  )  
  const property lifeDisplay = new LifeDisplay(
  	label="LIFE: ",
  	position=dynamicPositionFactory.create(40,0),
  	numberValue=life
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
  	scoreDisplay.update()
  }
  
  method increaseLevel(){ levelNumber = (levelNumber+1).min(levels.quantity()) }
  method decreaseLevel(){ levelNumber = 1.max(levelNumber-1) }
  
  method looseLife() { 
  	lifeDisplay.heartLoss()
  	life -= 1
  	lifeDisplay.update()
    if (life == 0) { 
  	  self.switchToGameOver()
  	}
  }
  
  method switchToGameOver() {
  	game.schedule(1, {self.switchTo(gameOver)})
  }
  method switchToGamePlay() {
  	game.schedule(1, {self.switchTo(new GamePlay())})
  }
  
  method fatalHit() {
  	life.times( { i => self.looseLife() } )
  }
  
  method refreshDisplays(){
    lifeDisplay.update()
    scoreDisplay.update()
  }
  
  /** Private Methods ------------------------------------------------------- */
  method setBeginingStatus(){
    score.value(0)
    life.value(3)
    levelNumber.value(1)
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
