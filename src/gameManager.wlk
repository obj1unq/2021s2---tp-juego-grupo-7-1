import wollok.game.*
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
  const genesis = gameTitle

  var property score = 0
  var property bullets = 10
  var property time = 20
  var property life = 3
  
  const property title = new RawMessage()
  const property scoreText = new RawMessage(position = game.at(2,0))
  const property bulletsText = new RawMessage(position = game.at(16,0))
  const property timeText = new RawMessage(position = game.at(30,0))
  const property lifeText = new RawMessage(position = game.at(40,0))
  
  const property scoreDisplay = new NumberDisplay(
  	label = "SCORE: ",
  	rawMessage = scoreText,
  	number = score
  )
  const property bulletsDisplay = new NumberDisplay(
  	label = "BULLETS: ",
  	rawMessage = bulletsText,
  	number = bullets
  )
  const property timeDisplay = new NumberDisplay(
  	label = "TIME: ",
  	rawMessage = timeText,
  	number = time
  )
  const property lifeDisplay = new LifeDisplay(
  	label = "LIFE: ",
  	rawMessage = lifeText,
  	number = life
  )
  
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
    title.setup()
    self.setupDisplays()
    moment.load()
    self.startTheClock()
    self.currentMoment(moment)
  }
  
  method clearPreviousMoment(){
    game.clear()
  }
  
  method setupDisplays() {
  	scoreDisplay.setup()
  	bulletsDisplay.setup()
  	timeDisplay.setup()
  	lifeDisplay.setup()
  }
  
  method increaseScore(amount){ 
  	score += amount
  	scoreDisplay.number(score)
  	scoreDisplay.update()
  }
  
  method bulletShooted(){
  	bullets -= 1
  	bulletsDisplay.number(bullets)
  	bulletsDisplay.update()
  }
  
  method startTheClock() {
  	game.onTick(1000,"CLOCK",{
  		time -= 1
  		timeDisplay.number(time)
  		timeDisplay.update()
  	})
  }
  
  method increaseLevel(){ levelNumber = (levelNumber+1).min(levels.quantity()) }
  method decreaseLevel(){ levelNumber = 1.max(levelNumber-1) }
  
  method looseLife() { 
  	lifeDisplay.heartLoss()
  	life -= 1
  	lifeDisplay.number(life)
  	lifeDisplay.update()
    if (life == 0) { 
  	  game.schedule(1, {self.switchTo(gameOver)})
  	}
  }
  

}
