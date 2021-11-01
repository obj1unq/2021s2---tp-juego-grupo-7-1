import wollok.game.*
object tickCalculator {
  method speedBasedTick(speed){
    return (1.0 / speed * 1000).roundUp()    
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