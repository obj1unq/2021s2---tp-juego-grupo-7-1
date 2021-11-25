import wollok.game.*
import moments.moments.*
import moments.GamePlay.*
import levels.levels.levels
import extras.RawMessage
import extras.Life



object gameManager {
  /**
  > Almacena el estado global: puntaje actual, nivel actual, cantidad de vidas, etc.
  > Se encargar de switchear de entre los momentos/modos
  > Carga los diferentes niveles.
  */
  const genesis = gameTitle
  
  
  var property score = 0
  var property levelNumber = 1
  var property currentMoment
  
  const property title = new RawMessage()
  const property scoreText = new RawMessage(
  	position = game.at(2,0)
  )
  const property lifeDisplayText = new RawMessage(
  	text = "LIFES: ",
  	position = game.at(game.width()-10,0)
  )
  
  
  const leftMargin = lifeDisplayText.position().x() + 3
  const heart3 = new Life(position=game.at(leftMargin+4,1))
  const heart2 = new Life(position=game.at(leftMargin+2,1))
  const heart1 = new Life(position=game.at(leftMargin,1))
  const property lifesLeft = [heart1, heart2, heart3]
  const property lifesUsed = []
  
   
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
    self.setupScoreText()
    self.setuplifeDisplay()
    moment.load()
    self.currentMoment(moment)
  }
  method clearPreviousMoment(){
    game.clear()
  }
  
  method setuplifeDisplay() {
  	lifeDisplayText.setup()
  	lifesLeft.forEach( { heart => game.addVisual(heart)})
  }
  
  method increaseScore(amount){ 
  	score += amount
  	self.updateScoreText()
  }
  
  method updateScoreText() {
  	scoreText.text("SCORE: " + score.toString())
  }
  
  method setupScoreText() {
  	scoreText.setup()
  	self.updateScoreText()
  }
  
  method increaseLevel(){ levelNumber = (levelNumber+1).min(levels.quantity()) }
  method decreaseLevel(){ levelNumber = 1.max(levelNumber-1) }
  
  method heroGotHit() { 
  	if(lifesLeft.size() > 1) {
  	  self.removeLife() 
  	} else {
  	  self.removeLife()  
  	  game.schedule(1, {self.switchTo(gameOver)})
  	}
  }
  
  method removeLife() {
  	const lost = lifesLeft.last()
  	lifesUsed.add(lost)
  	game.removeVisual(lost)
  	lifesLeft.remove(lost)
  }
}
