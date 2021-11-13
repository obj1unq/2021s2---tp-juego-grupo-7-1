import wollok.game.keyboard
import gameManager.gameManager
import config.MomentConfiguration
import HeroShip.heroShipFactory
import bullets.bulletsMover
import levels.main.levels
import moments.Moment.*
import directions.*


class GamePlay inherits Moment(
  titulo=["JUEGO", "Nivel " + gameManager.level().toString()],
  configuration=configGamePlay,
  visuals=#{heroShipFactory.create()}
){
  
  const property heroShip = heroShipFactory.lastCreated()
  
  
  override method load(){
    super()
//    self.setBackground()
//    self.configure()    
//    self.addVisuals()
//    self.addTitle()
    self.loadLevel(gameManager.level())
    bulletsMover.activate()
  }
  
  method loadLevel(levelNumber){
    levels.list().get(levelNumber-1).load()
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