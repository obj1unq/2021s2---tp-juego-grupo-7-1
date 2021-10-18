import wollok.game.*
import extras.*
import personajes.*
import HeroShip.*
import config.*

class Moment {
  const titulo
  const background = "background.jpg"
  const visuals = #{}
  const configuration = configVoid
  // ---------------------------------------
  
  method initialize(){
    self.setBackground()
    self.configure()    
    self.addVisuals()
    self.addTitle()
  }
  
  method setBackground(){ game.boardGround(background) }
  method configure(){ configuration.configMoment(self) }
  method addVisuals(){ visuals.forEach({visual=>visual.add()}) }
  
  method addTitle(){
    var titleString = ""
    titulo.forEach({line=>titleString=titleString+line+"\n"})
    
    rawMessage.text(titleString)
  }
}



object gameTitle inherits Moment(
  titulo=["TITULO_JUEGO", "¡¡SPACE INVADERS!!"]
){}
object levelCover inherits Moment(
  titulo=["PRESENTACION_NIVEL", "Nivel xxx"]
){}
object gamePlay inherits Moment(
  titulo=["JUEGO"]
){}
object gameOver inherits Moment(
  titulo=["FINAL_JUEGO", "A tu casa rey"]
){}
object credits inherits Moment(
  titulo=["CREDITOS", "Muy rico todo"]
){}

// DEV -------------------------------------------
//object pdcObjetoCompuesto inherits Moment(
//  titulo=["PDC", "Probando Objeto Compuesto"],
//  configuration=configPDCObjetoCompuesto
//){
//  const property heroShip = new HeroShip()
//  const visuals = #{heroShip}
//}
object pdcJuego inherits Moment(
  titulo=["PDC", "Probando Juego"],
//  visuals=#{naveEnemiga},
  configuration=configPDCJuego
){}
