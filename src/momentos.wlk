import wollok.game.*
import extras.*
import personajes.*
import heroShip.*
import config.*

class Momento {
  const titulo
  const background = "background.jpg"
  const visuals = #{}
  
  method inicializar(){
    self.setBackground()
    /**
     * acá salta un bug ya que no se limpia la
     * configuración de otro momento.
     * ¿Es posible eliminar las configuraciones anteriores?
     */
//    configuration.config()
    self.addVisuals()
    self.addTitle()
  }
  
  method setBackground(){
    game.boardGround(background)
  }
  method addVisuals(){
    visuals.forEach({visual=>visual.add()})
  }
  method addTitle(){
    var titleString = ""
    titulo.forEach({line=>titleString=titleString+line+"\n"})
    mensaje.text(titleString)
  }
}



object tituloJuego inherits Momento(
  titulo=["TITULO_JUEGO", "¡¡SPACE INVADERS!!"]
){}
object presentacionNivel inherits Momento(
  titulo=["PRESENTACION_NIVEL", "Nivel xxx"]
){}
object juego inherits Momento(
  titulo=["JUEGO"]
){}
object finalJuego inherits Momento(
  titulo=["FINAL_JUEGO", "A tu casa rey"]
){}
object creditos inherits Momento(
  titulo=["CREDITOS", "Muy rico todo"]
){}
object pdcObjetoCompuesto inherits Momento(
  titulo=["PDC", "Probando Objeto Compuesto"],
  visuals=#{}
){}
object pdcJuego inherits Momento(
  titulo=["PDC", "Probando Juego"],
  visuals=#{heroShip, naveEnemiga}
){}
