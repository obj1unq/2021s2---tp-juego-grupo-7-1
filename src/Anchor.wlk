import wollok.game.*

class Anchor{
  var property position = game.center()
  
  method irA(nuevaPosicion) {
    position = nuevaPosicion
  }
  method image() {
    return "px-void.png"
  }
}