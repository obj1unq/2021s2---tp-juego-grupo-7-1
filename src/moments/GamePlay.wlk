import wollok.game.keyboard
import gameManager.gameManager
import config.keyboard.configGamePlay
import HeroShip.HeroShip
import bullets.bulletsMover.bulletsMover
import levels.levels.*
import moments.Moment.*
import directions.*
import enemies.kamikazeMover.kamikazeMover


class GamePlay inherits Moment(
  titulo=["JUEGO", "Nivel " + gameManager.levelNumber().toString()],
  configuration=configGamePlay
){
  var property level = null
  const property heroShip = new HeroShip()
  
  
  override method load(){
    self.loadLevel(gameManager.levelNumber())
    super()
    bulletsMover.activate()
    kamikazeMover.activate()
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

