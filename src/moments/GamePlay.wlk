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
  
  const property bulletsDisplay = new NumberDisplay(
  	label="BULLETS: ", rawMessage=null, number=null
  )
  const property timeDisplay = new NumberDisplay(
    label="TIME: ", rawMessage=null, number=null
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
  method enemiesTotal() = self.level().enemiesTotal()
  method enemiesLeft() = self.level().enemiesLeft()
  method bulletsLimit() = self.level().bulletsLimit()
  method timeLimit() = self.level().timeLimit()
  
  override method load(){
    self.loadLevel(gameManager.levelNumber())
    super()
    self.setupDisplays()
  }
  method loadLevel(levelNumber){
    levels.loadLevel(levelNumber, self)
  }
 
  method setupDisplays() {
  	const bulletsText = new RawMessage(position=dynamicPositionFactory.create(16,0))
    const timeText = new RawMessage(position=dynamicPositionFactory.create(30,0))
  	
  	bulletsDisplay.rawMessage(bulletsText)
  	bulletsDisplay.number(self.bulletsLimit())
  	bulletsDisplay.setup()
  	timeDisplay.rawMessage(timeText)
  	timeDisplay.number(self.timeLimit())
  	timeDisplay.setup()
  	self.startTheClock()
  } 
  
  method startTheClock() {
  	game.onTick(1000,"CLOCK",{
  	  timePassed += 1
  	  timeDisplay.number(self.remainingTime())
  	  self.refreshTimeDisplay()
  	})
  }
  method refreshTimeDisplay() {
  	timeDisplay.update()
  	if (self.timesUp()) {
  	  self.gameOver()
  	}
  }
  
  method bulletShooted(){
  	bulletsShooted += 1
  	bulletsDisplay.number(self.remainingBullets())
  	self.refreshBulletsDisplay()
  }
  
  method refreshBulletsDisplay() {
  	bulletsDisplay.update()
  	if (self.noMoreBullets()) {
  	  self.gameOver()
  	}
  }
  
  method enemieDown() {
  	enemiesDown +=1
  	if (self.noMoreEnemies()) {
  	  self.stageClear()
  	}
  }
  
  method stageClear() {
  	console.println("Ganaste capo, pasas de nivel")
  }
  
  
  // Win & Lose Logic
  
  method remainingItem(total, used) = total-used
  
  method remainingTime() = self.remainingItem(self.timeLimit(),timePassed)
  method remainingBullets() = self.remainingItem(self.bulletsLimit(),bulletsShooted)
  method remainingEnemies() = self.remainingItem(self.enemiesTotal(),self.enemiesDown())
  
  method limitReached(value) = value==0
  
  method gameOver() { gameManager.switchToGameOver() }
  method timesUp() = self.limitReached(self.remainingTime())
  method noMoreBullets() = self.limitReached(self.remainingBullets())
  method noMoreEnemies() = self.limitReached(self.remainingEnemies())
  
  
  
  
}

