import wollok.game.keyboard
import gameManager.gameManager
import config.configGamePlay
import HeroShip.heroShipFactory
import bullets.bulletsMover
import levels.levels.*
import moments.Moment.*
import directions.*


class GamePlay inherits Moment(
  titulo=["JUEGO", "Nivel " + gameManager.levelNumber().toString()],
  configuration=configGamePlay
){
  var property level = null
  const property heroShip = heroShipFactory.create()
  
  
  override method load(){
    self.loadLevel(gameManager.levelNumber())
    super()
    bulletsMover.activate()
  }
  
  method loadLevel(levelNumber){
    levels.loadLevel(levelNumber, self)
  }
  override method visuals(){
    return (
        #{heroShip}
      + level.visuals()  
    ) 
  }
}

