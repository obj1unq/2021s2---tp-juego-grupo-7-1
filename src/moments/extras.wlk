import gameManager.gameManager
import HeroShip.heroShipFactory
import config.configPDCObjetoCompuesto
import moments.Moment.Moment

/**
 * PROVISORIOS
 */
class PDC_CompositeVisual inherits Moment(
  titulo=["PDC", "Probando Objeto Compuesto"],
  configuration=configPDCObjetoCompuesto,
  visuals=#{heroShipFactory.create()}
){
  const property heroShip = heroShipFactory.lastCreated()
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