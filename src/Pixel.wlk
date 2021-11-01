import wollok.game.*

class Pixel{
  var property anchor
  var property image
  var property xDelta
  var property yDelta
  
  method position(){
    return game.at(
      anchor.position().x()+xDelta,
      anchor.position().y()-yDelta
    )
  }
}