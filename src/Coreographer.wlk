import wollok.game.game
import gameManager.gameManager

class Coreographer {
  const stepsPerDirection = 16
  const stepSize = 1
  var stepsDone = 0
  var direction = 1
  
  
  method activate(){
    const anchor = gameManager.levelObject().anchor()
    
    game.onTick(
      200,
      "LEVEL_ANCHOR_MOVEMENT" + self.identity().toString(),
      {
        anchor.goTo(self.nextPosition(anchor))
        self.performStep()
      }
    )
  }
  method nextPosition(anchor){
    return anchor.position().right(stepSize*direction)
  }
  method performStep(){
    stepsDone += 1
    if (stepsPerDirection == stepsDone){
      self.switchDirection()
      self.resetStepsCount()     
    }
  }
  method switchDirection(){direction = direction*-1}
  method resetStepsCount(){stepsDone = 0}
}
