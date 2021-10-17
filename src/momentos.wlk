import wollok.game.*
import extras.*
import personajes.*
import heroina.heroina
import config.*

class Momento {
  const titulo
  const background = "background.jpg"
  const visuals = #{}
  const composedVisuals = #{}
//  const configuration = configVoid
  
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
    // TODO: unificar y darle trato polimorfico
    visuals.forEach({visual=>
      game.addVisual(visual)
      visual.boot()
    })
    composedVisuals.forEach({composedVisual=>composedVisual.add()})
  }
  method addTitle(){
    var titleString = ""
    titulo.forEach({line=>titleString=titleString+line+"\n"})
    mensaje.text(titleString)
    console.println(titleString)
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
  composedVisuals=#{heroina}
//  configuration=configPDCObjetoCompuesto
){}
object pdcJuego inherits Momento(
  titulo=["PDC", "Probando Juego"],
  visuals=#{heroShip, naveEnemiga}
//  configuration=configPDCJuego
){}
