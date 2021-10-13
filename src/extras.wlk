import wollok.game.*

object mensaje {
  var property position = game.at(game.width()/2, game.height()-2)
  var property text = "HOLA"
  var property textColor = "FFFFFFFF"
  
  method setup(){
    game.addVisual(self)
  }
}