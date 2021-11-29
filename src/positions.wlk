import wollok.game.*

class Limit{
  var property left = 0
  var property right = game.width()-1
  var property down = 3
  var property up = game.height()-1
  
  method isInside(visual){
    return (
          visual.position().y() <= self.up()
      and visual.position().x() <= self.right()
      and visual.position().y() >= self.down()
      and visual.position().x() >= self.left()
    )  
  }  
}

object dynamicPositionFactory{
  method create(x, y){
    return new DynamicPosition(x=x, y=y)
  }
  method createAtCenter(){
    return self.create(gameDimensions.hCenter(), gameDimensions.vCenter()-1)
  }
}

class DynamicPosition{
  var property x = 0
  var property y = 0
  
  method initialize(){
    console.println("Creo " + self.toString())
  }

  method moveUp(steps){     y = y+steps }
  method moveRight(steps){  x = x+steps }
  method moveDown(steps){   y = y-steps }
  method moveLeft(steps){   x = x-steps }
  
  method translatedNew(xOffset, yOffset){
    return new DynamicPosition(x=self.x()+xOffset, y=self.y()+yOffset)
  }
}

object gameDimensions{
  const property globalLimit = new Limit()
  
  // Horizontal Center
  method hCenter() = game.width().div(2)
  
  // Vertical Center
  method vCenter() = game.height().div(2)
  
  method isInsideGlobalLimit(visual) = self.globalLimit().isInside(visual)
}