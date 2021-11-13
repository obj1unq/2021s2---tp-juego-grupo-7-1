import gameManager.gameManager
import config.configGamePlay
import HeroShip.heroShipFactory
import bullets.bulletsMover
import levels.levels
import moments.Moment.*

class GamePlay inherits Moment(
  titulo=["JUEGO", "Nivel " + gameManager.level().toString()],
  configuration=configGamePlay,
  visuals=#{heroShipFactory.create()}
){
  
  const property heroShip = heroShipFactory.lastCreated()
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