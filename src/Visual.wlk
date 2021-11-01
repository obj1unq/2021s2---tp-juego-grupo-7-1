import wollok.game.*
import DynamicPosition.*

class Visual{
  /**
   * NOTE: Visual childs must use add() method to be added to the stage,
   * instead of the direct "game.add(...)". This allows polymorphic
   * behavior to both native and CompositeVisuals objects.
   */
  
  // TODO: Evaluar que esta clase tenga los metodos de los movimientos delimitados.
  
  var property position = dynamicPositionManager.createAtCenter()
  method add(){
    game.addVisual(self)
  } 
}