import wollok.game.game
import positions.dynamicPositionFactory
import positions.gameDimensions

class Visual{
  const property position = dynamicPositionFactory.createAtCenter()
  const property limit = gameDimensions.globalLimit()
  
  method add(){ game.addVisual(self) }
  method remove(){
    game.removeVisual(self)
  }
  method isOnScreen() = game.hasVisual(self) 
  method isInsideLimit() = limit.isInside(self)
}