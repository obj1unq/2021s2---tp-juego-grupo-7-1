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
    self.prepareVisuals()
    super()
    
    bulletsMover.activate()
    visuals.clear()
  }
  
  method loadLevel(levelNumber){
    levels.level(levelNumber).load(self)
  }
  method prepareVisuals(){
    visuals.add(heroShip)
    level.visuals().forEach({item=>
      visuals.add(item)
    })
  }
}

