import wollok.game.*
import gameManager.gameManager
import config.keyboard.configGamePlay
import HeroShip.HeroShip
import levels.levels.*
import moments.Moment.*
import directions.*
import extras.RawMessage
import positions.dynamicPositionFactory
import Display.NumberDisplay
//import extras.NumberValue


class GamePlay inherits Moment(
  title=["JUEGO", "Nivel " + gameManager.levelNumber().toString()],
  configuration=configGamePlay
){
  // State - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  var property level = null
  
  const property bulletsDisplay = new NumberDisplay(
  	label="BULLETS: ", position=dynamicPositionFactory.create(16,0)
  )
  const property timeDisplay = new NumberDisplay(
    label="TIME: ", position=dynamicPositionFactory.create(30,0)
  )
  
  var property timePassed = 0
  var property bulletsShooted = 0
  var property enemiesDown = 0
  
  const property heroShip = new HeroShip()
  
  
  // Methods - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  override method load(){
    self.loadLevel(gameManager.levelNumber())
    super()
    self.setupDisplays()
  }
  override method visuals(){
    return (
        #{heroShip}
      + level.visuals()  
    ) 
  }
  method enemiesTotal() = self.level().enemiesTotal()
  method enemiesLeft() = self.level().enemiesLeft()
  method bulletsLimit() = self.level().bulletsLimit()
  method timeLimit() = self.level().timeLimit()

  method loadLevel(levelNumber){
    levels.loadLevel(levelNumber, self)
    level.bulletsPool().reset()
  }
 
  method setupDisplays() {
  	bulletsDisplay.setup(self.bulletsLimit())
  	timeDisplay.setup(self.timeLimit())
  	self.startTheClock()
  } 
  
  method startTheClock() {
  	game.onTick(1000,"CLOCK", {
  	  self.updateClock()
  	})
  }
  method updateClock() {
    timePassed += 1
    timeDisplay.update(self.remainingTime())
  	if(self.timesUp()) {
  	  self.gameOver()
  	}
  }
  
  method bulletShooted(){
  	bulletsShooted += 1
  	bulletsDisplay.update(self.remainingBullets())
  }
  
  method enemieDown() {
  	enemiesDown +=1
  	if (self.noMoreEnemies()) {
  	  self.stageClear()
  	}
  }
  
  method stageClear() {
  	gameManager.goToNextLevel()
  }
  
  
  // Win & Lose Logic
  
  method remainingItem(total, used) = total-used
  
  method remainingTime() = self.remainingItem(self.timeLimit(), timePassed)
  method remainingBullets() = self.remainingItem(self.bulletsLimit(),bulletsShooted)
  method remainingEnemies() = self.remainingItem(self.enemiesTotal(),self.enemiesDown())
  
  method limitReached(value) = value==0
  
  method gameOver() { gameManager.switchToGameOver() }
  method timesUp() = self.limitReached(self.remainingTime())
  method noMoreBullets() = self.limitReached(self.remainingBullets())
  method noMoreEnemies() = self.limitReached(self.remainingEnemies())
}

