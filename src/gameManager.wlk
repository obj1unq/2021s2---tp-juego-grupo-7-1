import wollok.game.*
import momentos.*

object gameManager {
  /**
  > Almacena el estado global:
    - puntaje actual
    - nivel actual
    - cantidad de vidas
    - etc.
  > Se encargar de switchear de entre los momentos/modos
  > Carga los diferentes niveles.
  */
  var property puntaje = 0
  var property vidasRestantes = 5
  var property nivel = 1
  
  method cambiarAMomento(momento){
    momento.inicializar()
  }
  
  method config(){
    self.configTeclas()
  }
  method configTeclas(){
    keyboard.num1().onPressDo({self.cambiarAMomento(tituloJuego)})
    keyboard.num2().onPressDo({self.cambiarAMomento(presentacionNivel)})
    keyboard.num3().onPressDo({self.cambiarAMomento(juego)})
    keyboard.num4().onPressDo({self.cambiarAMomento(finalJuego)})
    keyboard.num5().onPressDo({self.cambiarAMomento(creditos)})
  }
  
  method iniciarJuego(){
    self.config()
    self.cambiarAMomento(tituloJuego)
  }
}
