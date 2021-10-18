import config.configPDCObjetoCompuesto
import moments.Moment
import HeroShip.HeroShip

class PDC_CompositeVisual inherits Moment(
  titulo=["PDC", "Probando Objeto Compuesto"],
  configuration=configPDCObjetoCompuesto
){
  const property heroShip = new HeroShip()
  const visuals = #{heroShip} // this throws alert but it's correct!
}
