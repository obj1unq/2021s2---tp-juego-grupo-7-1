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


class GamePlay inherits Moment(
  titulo=["JUEGO", "Nivel " + gameManager.levelNumber().toString()],
  configuration=configGamePlay
){
  // State
  var property level = null
  var property bulletsLimit = null
  var property timeLimit = null
  var property totalEnemies = null
  
  const property bulletsText = new RawMessage(position=dynamicPositionFactory.create(16,0))
  const property timeText = new RawMessage(position=dynamicPositionFactory.create(30,0))
  
  const property bulletsDisplay = new NumberDisplay(
  	label="BULLETS: ", rawMessage=bulletsText, number=bulletsLimit
  )
  const property timeDisplay = new NumberDisplay(
    label="TIME: ", rawMessage=timeText, number=timeLimit
  )
  
  var property timePassed = 0
  var property bulletsShooted = 0
  var property enemiesDown = 0
  
  const property heroShip = new HeroShip()
  
  
  // Methods
  override method visuals(){
    return (
        #{heroShip}
      + level.visuals()  
    ) 
  }
  method enemiesLeft()
  override method load(){
    self.loadLevel(gameManager.levelNumber())
    super()
  }
  method loadLevel(levelNumber){
    levels.loadLevel(levelNumber, self)
  }
 
  method setupDisplays() {
  	bulletsDisplay.setup()
  	timeDisplay.setup()
  	self.startTheClock()
  } 
  method updateDisplays() {
  	bulletsDisplay.update()
  	self.updateTimeDisplay()
  }
  
  method startTheClock() {
  	game.onTick(1000,"CLOCK",{
  	  timePassed += 1
  	  timeDisplay.number(self.remainingTime())
  	  self.updateTimeDisplay()
  	})
  }
  method updateTimeDisplay() {
  	timeDisplay.update()
  	if (self.timesUp()) {
  	  gameManager.switchToGameOver()
  	}
  }
  
  method timesUp() = self.limitReached(self.remainingTime())
  method limitReached(value) = value==0
  method remainingTime() = self.remainingItem(timeLimit,timePassed)
  
  method bulletShooted(){
  	bulletsShooted += 1
  	bulletsDisplay.number(self.remainingBullets())
  	bulletsDisplay.update()
  }
  method remainingBullets() = self.remainingItem(bulletsLimit,bulletsShooted)
  method remainingItem(total, used) = total-used
}

