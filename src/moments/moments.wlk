import config.keyboard.configPDCObjetoCompuesto
import gameManager.gameManager
import moments.Moment.Moment
import HeroShip.*
import bullets.bulletsMover.bulletsMover

/**
 * PROVISORIOS
 */
class PDC_CompositeVisual inherits Moment(
  titulo=["PDC", "Probando Objeto Compuesto"],
  configuration=configPDCObjetoCompuesto
){
  const property heroShip = new HeroShip()
  override method visuals() = #{heroShip}
  override method load(){
    super()
    bulletsMover.activate()
  }
}

object gameTitle inherits Moment(
  titulo=["TITULO_JUEGO", "¡¡SPACE INVADERS!!"]
){}
class GameCover inherits Moment(
  titulo=["PRESENTACIÓN NIVEL", "Nivel " + gameManager.levelNumber().toString()]
){}
object gameOver inherits Moment(
  titulo=["FINAL_JUEGO", "A tu casa rey"]
){}
object credits inherits Moment(
  titulo=["CREDITOS", "Muy rico todo"]
){}