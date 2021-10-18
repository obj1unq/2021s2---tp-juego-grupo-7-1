import config.*
import Moment.Moment
import gameManager.gameManager

object gameTitle inherits Moment(
  titulo=["TITULO_JUEGO", "¡¡SPACE INVADERS!!"]
){}
class GameCover inherits Moment(
  titulo=["PRESENTACIÓN NIVEL", "Nivel " + gameManager.level().toString()]
){}
//object gamePlay inherits Moment(
//  titulo=["JUEGO"]
//){}
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
