import wollok.game.*
import config.configGlobal
import momentos.tituloJuego
import extras.*

object gameManager {
  /**
  > Almacena el estado global: puntaje actual, nivel actual, cantidad de vidas, etc.
  > Se encargar de switchear de entre los momentos/modos
  > Carga los diferentes niveles.
  */
  var property puntaje = 0
  var property vidasRestantes = 5
  var property nivel = 1
  const config = configGlobal
//  var momentoActual = tituloJuego
  
  method boot(){
    config.config()
    self.cambiarAMomento(tituloJuego)
  }
  
  method cambiarAMomento(momento){
//    momentoActual.unmount()
    self.clearVisuals()
    mensaje.setup()
    momento.inicializar()
//    momentoActual = momento
  }
  method clearVisuals(){
    game.allVisuals().forEach({visual=>game.removeVisual(visual)})
  }
}
