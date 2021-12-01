import wollok.game.*
import positions.dynamicPositionFactory
import positions.gameDimensions
import moments.gameTitle.gameTitle
import moments.gameOver.gameOver
import moments.gameWin.gameWin
import moments.LevelCover.LevelCover
import moments.GamePlay.GamePlay
import levels.levels.levels
import extras.RawMessage
import extras.dev
import Display.*
import SoundPool.*
import enemies.Kamikaze.k
import config.settings.settings

object gameManager {
  /**
   > Stores global status: current score, current level, life number, etc.
   > Switches between the moments/modes
   > Load levels.
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
  const property title = new RawMessage(position=dynamicPositionFactory.create(gameDimensions.hCenter(),28))  
  
   
   
  // ---------------------------------------------
  method load(){
    self.introduceGame()
  }
    
  // Moments/modes switching
  method introduceGame(){
    self.switchTo(gameTitle)  
  }
  method beginGame(){
    self.setBeginingStatus()
    self.beginCurrentLevel()
  }
  method manageStageClear(){
    if(levels.hasRemainingLevels(levelNumber)){
      self.goToNextLevel()
    }else{
      self.winGame()
    }
  }
  method winGame(){
    self.switchToMomentWithDelay(gameWin)
  }
  method goToNextLevel(){
    levelNumber += 1
    self.beginCurrentLevel()
  }
  
  method switchTo(moment){
    dev.cLog("switchTo: " + moment.toString())   
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
  
  method loseLife() { 
  	lifeDisplay.heartLoss()
  	life -= 1
  	lifeDisplay.update(life)
    if (life == 0) { 
  	  self.switchToGameOver()
  	}
  }
  
  method switchToMomentWithDelay(moment) {
  	if (settings.TEST_MODE()) {
  	  self.switchTo(moment)
  	} else {
  	  game.schedule(10, {self.switchTo(moment)} )
  	}
  }
  
  method switchToGameOver() {
    self.switchToMomentWithDelay(gameOver)
  }
  method switchToGamePlay() {
  	self.switchToMomentWithDelay(new GamePlay())
  }
  
  method fatalHit() {
  	life.times( { i => self.loseLife() } )
  }
  
  method refreshDisplays(){
    lifeDisplay.update(life)
    scoreDisplay.update(score)
  }
  
  /** Private Methods ------------------------------------------------------- */
  method setBeginingStatus(){
    levelNumber = 1
    self.setRetryStatus()
  }
  method setRetryStatus(){
  	score = 0
    life = 3
    self.refreshDisplays()
  }
  
  method retryLevel() {
  	self.setRetryStatus()
  	self.beginCurrentLevel()
  }
  method beginCurrentLevel(){
    self.switchToMomentWithDelay(new LevelCover())
  }
}
