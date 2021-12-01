import wollok.game.*
import gameManager.gameManager
import moments.moments.*
import directions.*
import SoundPool.*

class MomentConfiguration{  
  method configMoment(moment){ self.configGlobal() }
  method configGlobal(){
    keyboard.l().onPressDo({ soundPool.volumeUp()   })  
    keyboard.k().onPressDo({ soundPool.volumeDown() })
  }
}
object configVoid inherits MomentConfiguration{}

object configGameTitle inherits MomentConfiguration{
  override method configMoment(moment){
    super(moment)
    self.configGlobal()
    keyboard.any().onPressDo({ gameManager.beginGame() })
  }
}
object configGamePlay inherits MomentConfiguration{
  override method configMoment(moment){
    super(moment)
    self.configHeroShip(moment.heroShip())
    keyboard.any().onPressDo({self.configGlobal()}) 
  }
  method configHeroShip(heroShip){
    keyboard.left().onPressDo({  heroShip.turn(left) })
    keyboard.right().onPressDo({ heroShip.turn(right) })
    keyboard.up().onPressDo({    heroShip.turn(up) })
    keyboard.down().onPressDo({  heroShip.turn(down) })
    keyboard.space().onPressDo({  heroShip.shoot() })
    keyboard.n().onPressDo({  heroShip.turn(neutral) })
  }
}

object configGameOver inherits MomentConfiguration{
  override method configMoment(moment){
    super(moment)
    keyboard.enter().onPressDo({
      gameManager.retryLevel()
    })
    keyboard.space().onPressDo({ gameManager.introduceGame() })
  }
}
object configGameWin inherits MomentConfiguration{
  override method configMoment(moment){
    self.configGlobal()
    keyboard.any().onPressDo({
      gameManager.introduceGame() 
    })
  }
}
object configPDCObjetoCompuesto inherits MomentConfiguration{
  override method configMoment(moment){
    self.configHeroShip(moment.heroShip())
    keyboard.c().onPressDo({self.configGlobal()}) 
  }
  method configHeroShip(heroShip){
    keyboard.left().onPressDo({  heroShip.turn(left) })
    keyboard.right().onPressDo({ heroShip.turn(right) })
    keyboard.up().onPressDo({    heroShip.turn(up) })
    keyboard.down().onPressDo({  heroShip.turn(down) })
    keyboard.space().onPressDo({  heroShip.shoot() })
    keyboard.n().onPressDo({  heroShip.turn(neutral) })
  }
}