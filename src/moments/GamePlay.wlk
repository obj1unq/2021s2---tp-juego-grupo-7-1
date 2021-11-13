import wollok.game.keyboard
import gameManager.gameManager
import config.MomentConfiguration
import HeroShip.heroShipFactory
import bullets.bulletsMover
import levels.levels.levels
import moments.Moment.*
import directions.*


class GamePlay inherits Moment(
  titulo=["JUEGO", "Nivel " + gameManager.levelNumber().toString()],
  configuration=configGamePlay
){
  var property level
  const property heroShip = heroShipFactory.create()
  
  
  override method load(){
    self.loadLevel(gameManager.levelNumber())
    self.prepareVisuals()
    
    super()
    bulletsMover.activate()
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

object configGamePlay inherits MomentConfiguration{
  override method configMoment(moment){
    super(moment)
    self.configHeroShip(moment.heroShip())
  }
  method configHeroShip(heroShip){
    keyboard.left().onPressDo({   heroShip.turn(left) })
    keyboard.right().onPressDo({  heroShip.turn(right) })
    keyboard.down().onPressDo({  heroShip.turn(neutral) })
    keyboard.space().onPressDo({  heroShip.shoot() })
  }
}