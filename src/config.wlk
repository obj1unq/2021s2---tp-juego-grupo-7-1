import wollok.game.*
import gameManager.gameManager
import moments.extras.*
import directions.*


class MomentConfiguration{  
  method configMoment(moment){ self.configGlobal() }
  method configGlobal(){
    /**
     * TODO: Ver como pasar la clase por parámetro
     * o abstraer la instanciación de los momentos en una Factory
     */
    keyboard.num1().onPressDo({gameManager.switchTo(gameTitle)})
    keyboard.num2().onPressDo({gameManager.switchTo(new GameCover())})
    keyboard.num3().onPressDo({gameManager.switchToGamePlay()})
    keyboard.num4().onPressDo({gameManager.switchTo(gameOver)})
    keyboard.num5().onPressDo({gameManager.switchTo(credits)})
    keyboard.num6().onPressDo({gameManager.switchTo(new PDC_CompositeVisual())})
    
    keyboard.o().onPressDo({gameManager.decreaseLevel()}) 
    keyboard.p().onPressDo({gameManager.increaseLevel()}) 
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
    keyboard.left().onPressDo({   heroShip.turn(left) })
    keyboard.right().onPressDo({  heroShip.turn(right) })
    keyboard.down().onPressDo({  heroShip.turn(neutral) })
    keyboard.space().onPressDo({  heroShip.shoot() })
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
  }
}



//OPCIONES 

// object gameTitle inherits MomentConfiguration {
//  
//  override method image() { return ".png"}
//  
//
//  Tipico de juego el Pulse cualquier tecla para empezar  -------------

//  override method configTeclas() {    
//    keyboard.any().onPressDo({ GamePlay.iniciar() })
//  }
//}

// Se puede usar al finalizar el juego para volver al menu ----------

//object credits inherits MomentConfiguration { 
//  
//  override method image() { return ".png"}

// PODRIA SER  PARA VOLVER AL MENU

//  override method configGlobal() {
//    keyboard.any().onPressDo({ gameTitle.iniciar() })
  
//  O PODRIA SER PARA SALIR DEL JUEGO 

//  override method configGlobal() {
//    keyboard.any().onPressDo({ game.stop() })
//  }
//}