import config.*
import gameManager.gameManager
import HeroShip.HeroShip
import wollok.game.*
import extras.*
import config.*
import levels.*
import bulletsMover.*

class Moment {
  const titulo
  const background = "background.jpg"
  const visuals = #{}
  const configuration = configVoid
  // ---------------------------------------
  
  method load(){
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
class GameCover inherits Moment(
  titulo=["PRESENTACIÓN NIVEL", "Nivel " + gameManager.level().toString()]
){}
object gameOver inherits Moment(
  titulo=["FINAL_JUEGO", "A tu casa rey"]
){}
object credits inherits Moment(
  titulo=["CREDITOS", "Muy rico todo"]
){}

class GamePlay inherits Moment(
  titulo=["JUEGO", "Nivel " + gameManager.level().toString()],
  configuration=configGamePlay
){
  
  const property heroShip = new HeroShip()
  const levelsList = levels.list()
  
  override method load(){
    super()
    self.loadLevel(gameManager.level())
    bulletsMover.activate()
  }
  
  method loadLevel(levelNumber){
    levelsList.get(levelNumber-1).load()
  }
}


class PDC_CompositeVisual inherits Moment(
  titulo=["PDC", "Probando Objeto Compuesto"],
  configuration=configPDCObjetoCompuesto
){
  const property heroShip = new HeroShip()
  const visuals = #{heroShip} // this throws alert but it's correct!
}