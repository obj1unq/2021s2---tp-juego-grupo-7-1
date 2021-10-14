import wollok.game.*
import gameManager.gameManager
import momentos.*
import personajes.*
import heroina.heroina

class Config{
  method config(){
    self.configurarTeclas()
  }
  method configurarTeclas(){}
}
object configVoid inherits Config{}


object configGlobal inherits Config{
  override method configurarTeclas() {
//    console.println("entre 1")
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
  override method configurarTeclas() {
//    console.println("entre 2")
    keyboard.left().onPressDo({ brocoli.irA(brocoli.position().left(1)) })
    keyboard.right().onPressDo({ brocoli.irA(brocoli.position().right(1)) })
    keyboard.space().onPressDo({ brocoli.disparar() })
  }
}


object configPDCObjetoCompuesto inherits Config{
  override method configurarTeclas() {
//    console.println("entre 3")
    keyboard.left().onPressDo({ heroina.irA(heroina.position().left(1)) })
    keyboard.right().onPressDo({ heroina.irA(heroina.position().right(1)) })
    keyboard.up().onPressDo({ heroina.irA(heroina.position().up(1)) })
    keyboard.down().onPressDo({ heroina.irA(heroina.position().down(1)) })
  }
}
