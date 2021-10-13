import wollok.game.*
import extras.*
import personajes.*
import config.*

class Momento {
  const titulo
  const background = "background.jpg"
  const visuals = #{}
  const config = configVoid
  
  method inicializar(){
    self.setBackground()
    config.config()
    self.addVisuals()
    self.addTitle()
  }
//  method unmount(){
//    visuals.forEach({visual=>game.removeVisual(visual)})
//  }
  
  method setBackground(){
    game.boardGround(background)
  }
  method addVisuals(){
    visuals.forEach({visual=>
      game.addVisual(visual)
      visual.boot()
    })
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
  titulo=["PDC", "Probando Objeto Compuesto"]
){}
object pdcJuego inherits Momento(
  titulo=["PDC", "Probando Juego"],
  visuals=#{brocoli, naveEnemiga},
  config=configPDCJuego
){}
