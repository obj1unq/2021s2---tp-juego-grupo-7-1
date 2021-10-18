import config.configGamePlay
import Moment.Moment
import HeroShip.HeroShip

class GamePlay inherits Moment(
  titulo=["PDC", "Probando Objeto Compuesto"],
  configuration=configGamePlay
){
  const property heroShip = new HeroShip()
  const visuals = #{heroShip} // this throws alert but it's correct!
}
