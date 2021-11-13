import wollok.game.*

object dynamicPositionFactory{
  method create(x, y){
    return new DynamicPosition(x=x, y=y)
  }
  method createAtCenter(){
    return self.create(gameDimensions.hCenter(), gameDimensions.vCenter())
  }
}

class DynamicPosition{
  var property x = 0
  var property y = 0
  
  var property xMin = -10
  var property xMax = game.width() + 10
  var property yMin = -10
  var property yMax = game.height() + 10

  method moveUp(steps){     y = yMax.min(y + steps) }
  method moveRight(steps){  x = xMax.min(x + steps) }
  method moveDown(steps){   y = yMin.max(y - steps) }
  method moveLeft(steps){   x = xMin.max(x - steps) }
  
  method up(){    return new DynamicPosition(x=self.x(),   y=self.y()+1) }
  method right(){ return new DynamicPosition(x=self.x()+1, y=self.y())   }
  method down(){  return new DynamicPosition(x=self.x(),   y=self.y()-1) }
  method left(){  return new DynamicPosition(x=self.x()-1, y=self.y())   }
  method translated(xOffset, yOffset){
    return new DynamicPosition(x=self.x()+xOffset, y=self.y()+yOffset)
  }
}

class SafeArea{
  var property xMin = 2
  var property xMax = game.width() - 2
  var property yMin = 2
  var property yMax = game.height() - 2
}

object gameDimensions{
  const property safeArea = new SafeArea()
  // Horizontal Center
  method hCenter() = game.width().div(2)
  
  // Vertical Center
  method vCenter() = game.height().div(2)  
}