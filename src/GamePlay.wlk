import config.configGamePlay
import Moment.Moment
import HeroShip.HeroShip
import gameManager.gameManager
import levels.*

class GamePlay inherits Moment(
  titulo=["JUEGO", "Nivel " + gameManager.level().toString()],
  configuration=configGamePlay
){
  const property heroShip = new HeroShip()
  const levels = [level1]
  
  override method load(){
    super()
    self.loadLevel(gameManager.level())
  }
  
  method loadLevel(levelNumber){
    levels.get(levelNumber-1).load()
  }
}
