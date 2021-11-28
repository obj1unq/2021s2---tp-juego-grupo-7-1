import wollok.game.*
import gameManager.gameManager
import moments.moments.*
import directions.*
import SoundPool.*

class MomentConfiguration{  
  method configMoment(moment){ self.configGlobal() }
  method configGlobal(){
    /**
     * TODO: Ver como pasar la clase por parámetro
     * o abstraer la instanciación de los momentos en una Factory
     */
    keyboard.num1().onPressDo({ gameManager.introduceGame() })
    keyboard.num2().onPressDo({ gameManager.beginGame() })
    keyboard.num5().onPressDo({gameManager.switchTo(credits)})
    keyboard.num6().onPressDo({gameManager.switchTo(new PDC_CompositeVisual())})
    
    keyboard.o().onPressDo({gameManager.decreaseLevel()}) 
    keyboard.p().onPressDo({gameManager.increaseLevel()}) 
  }
}
object configGameTitle inherits MomentConfiguration{
  override method configMoment(moment){
    self.configGlobal()
    keyboard.any().onPressDo({ gameManager.beginGame() })
  }
}
object configVoid inherits MomentConfiguration{}
object configGamePlay inherits MomentConfiguration{
  override method configMoment(moment){
    self.configHeroShip(moment.heroShip())
    keyboard.c().onPressDo({self.configGlobal()}) 
//    super(moment)
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
object controlVolume{
	method configVolume(){
		keyboard.l().onPressDo({ soundPool.volumeUp()   })  
		keyboard.k().onPressDo({ soundPool.volumeDown() })  
	}
}