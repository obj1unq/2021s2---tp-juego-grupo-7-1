import wollok.game.*

class DynamicPosition{
  var property x = 0
  var property y = 0

  method moveUp(steps) {    y += steps }
  method moveRight(steps) { x += steps }
  method moveDown(steps) {  y -= steps }
  method moveLeft(steps) {  x -= steps }
}
object gameDimensions{
  /**
   * Horizontal Center
   */
  method hCenter() = game.width().div(2)
  /**
   * Vertical Center
   */
  method vCenter() = game.height().div(2)
    
}
object dynamicPositionManager{
  method create(x, y){
    return new DynamicPosition(x=x, y=y)
  }
  method createAtCenter(){
    return self.create(gameDimensions.hCenter(), gameDimensions.vCenter())
  }
}
