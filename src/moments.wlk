import config.*
import Moment.Moment


object gameTitle inherits Moment(
  titulo=["TITULO_JUEGO", "¡¡SPACE INVADERS!!"]
){}
object levelCover inherits Moment(
  titulo=["PRESENTACION_NIVEL", "Nivel xxx"]
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
