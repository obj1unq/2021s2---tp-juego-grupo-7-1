import wollok.game.*
import gameManager.gameManager
import momentos.*
import personajes.*
import heroShip.*

class Config{
  method config(){
    self.configurarTeclas()
  }
  method configurarTeclas(){}
}
object configVoid inherits Config{}


object configGlobal inherits Config{
  override method configurarTeclas() {
    keyboard.num1().onPressDo({gameManager.cambiarAMomento(tituloJuego)})
    keyboard.num2().onPressDo({gameManager.cambiarAMomento(presentacionNivel)})
    keyboard.num3().onPressDo({gameManager.cambiarAMomento(juego)})
    keyboard.num4().onPressDo({gameManager.cambiarAMomento(finalJuego)})
    keyboard.num5().onPressDo({gameManager.cambiarAMomento(creditos)})
    keyboard.num6().onPressDo({gameManager.cambiarAMomento(pdcObjetoCompuesto)})
    keyboard.num7().onPressDo({gameManager.cambiarAMomento(pdcJuego)})
  }
}


object configPDCJuego inherits Config{
//  override method configurarTeclas() {
//    keyboard.left().onPressDo({ heroShip.goTo(heroShip.position().left(1)) })
//    keyboard.right().onPressDo({ heroShip.goTo(heroShip.position().right(1)) })
//    keyboard.space().onPressDo({ heroShip.shoot() })
//  }
}


object configPDCObjetoCompuesto inherits Config{
  override method configurarTeclas() {
    keyboard.left().onPressDo({ heroShip.goTo(heroShip.position().left(1)) })
    keyboard.right().onPressDo({ heroShip.goTo(heroShip.position().right(1)) })
    keyboard.up().onPressDo({ heroShip.goTo(heroShip.position().up(1)) })
    keyboard.down().onPressDo({ heroShip.goTo(heroShip.position().down(1)) })
  }
}
