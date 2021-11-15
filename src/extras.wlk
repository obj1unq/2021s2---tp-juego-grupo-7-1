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

class Pixel{
  var property anchor
  var property image
  var property xDelta
  var property yDelta
  
  method position(){
    return game.at(
      anchor.position().x()+xDelta,
      anchor.position().y()+yDelta
    )
  }
  
  method receiveHit() {
  	console.println("me dio")
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