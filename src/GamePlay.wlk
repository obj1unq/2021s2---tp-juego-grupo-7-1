import config.configGamePlay
import Moment.Moment
import HeroShip.HeroShip
import gameManager.gameManager
import levels.*
import bulletsMover.*

object levels{
  const property list = [level1, level2]
}

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
