import wollok.game.*
import visuals.Visual
import positions.dynamicPositionFactory

object tickCalculator {
  method speedBasedTick(speed){
    return (1.0 / speed * 1000).roundUp()    
  }
}

class Anchor inherits Visual{
  const image = "px-anchor.png"
  method image() { return image }
  method receiveHit() {}
}

class Pixel inherits Visual{
  var property anchor
  var property image
  var property xDelta
  var property yDelta
  
  override method position(){
    position.x(anchor.position().x()+xDelta)
    position.y(anchor.position().y()+yDelta)
    return position
  }
}

object rawMessage {
  var property position = game.at(game.width()/2, game.height()-2)
  var property text = "HOLA"
  var property textColor = "FFFFFFFF"
  
  method setup(){
    game.addVisual(self)
  }
}