import wollok.game.game
import gameManager.gameManager
import extras.tickCalculator
import directions.*

class Coreographer {
  const stepsPerDirection = 16
  var stepsDone = 0
  const switchsPerLine = 4
  var switchsDone = 0
  var direction = right
  var speed = 10.0
  var anchor = null
  const movementTickID = "ANCHOR_MOVEMENT" + self.identity().toString() 
  
  method activate(){
    anchor = gameManager.levelObject().anchor()
    self.activateMovement()
  }
  
  method activateMovement(){
    game.onTick(
      tickCalculator.speedBasedTick(speed),
      movementTickID,
      { self.performStep() }
    )
  }
  method destroyMovement(){
    game.removeTickEvent(movementTickID)
  }
  method resetMovement(){
    self.destroyMovement()
    self.activateMovement()
  }
  method performStep(){
    direction.nextPosition(anchor)
    stepsDone += 1
    
    if(self.completeStepsPerDirection()){
      self.manageSwitchAndDescend()
      self.increaseSpeed(0.5)
    }
  }
  method completeStepsPerDirection(){
    return stepsDone%stepsPerDirection == stepsPerDirection-1
  }
  method completeSwitchsPerLine(){
    return switchsDone%switchsPerLine == switchsPerLine-1
  }
  
  method manageSwitchAndDescend(){
    direction = direction.inverse()
    switchsDone += 1
    if(self.completeSwitchsPerLine()) self.descend()
  }
  method descend(){ down.nextPosition(anchor) }
  method increaseSpeed(amount){
    speed = speed + amount
    self.resetMovement()
  }
}
