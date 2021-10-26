import wollok.game.game
import gameManager.gameManager
import tickCalculator.*

class Coreographer {
  const stepsPerDirection = 16
  const stepSize = 1
  var mustDescend = false
  var stepsDone = 0
  var direction = 1
  var speed = 3.0
  
  
  method activate(){
    // TODO: refactorizar la vinculación del anchor con el coreographer
    const anchor = gameManager.levelObject().anchor()
    
    game.onTick(
      tickCalculator.speedBasedTick(speed),
      "LEVEL_ANCHOR_MOVEMENT" + self.identity().toString(),
      {
        anchor.goTo(self.nextPosition(anchor))
        self.performStep()
      }
    )
  }
  method nextPosition(anchor){
  	if (mustDescend) {
  		mustDescend = false
  		return anchor.position().down(1)
  	} else {
    	return anchor.position().right(stepSize*direction)	
    }
  }
  method performStep(){
    stepsDone += 1
    if (stepsPerDirection == stepsDone){
      self.switchDirection()
      self.resetStepsCount()
      mustDescend = true
      speed += 0.5 
    }
  }
  method switchDirection(){direction = direction*-1}
  method resetStepsCount(){stepsDone = 0}
}
