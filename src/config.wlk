import wollok.game.*
import gameManager.gameManager
import moments.*
import personajes.*
import HeroShip.*
import PDC_CompositeVisual.PDC_CompositeVisual

class MomentConfiguration{  
  method configMoment(moment){ self.configGlobal() }
  method configGlobal(){
    /**
     * TODO: Ver como pasar la clase por parámetro
     * o abstraer la instanciación de los momentos
     */
    keyboard.num1().onPressDo({gameManager.switchTo(gameTitle)})
    keyboard.num2().onPressDo({gameManager.switchTo(levelCover)})
    keyboard.num3().onPressDo({gameManager.switchTo(gamePlay)})
    keyboard.num4().onPressDo({gameManager.switchTo(gameOver)})
    keyboard.num5().onPressDo({gameManager.switchTo(credits)})
    keyboard.num6().onPressDo({gameManager.switchTo(new PDC_CompositeVisual())})
    keyboard.num7().onPressDo({gameManager.switchTo(pdcJuego)})    
  }
}
object configVoid inherits MomentConfiguration{}

object configPDCJuego inherits MomentConfiguration{
//  override method configurarTeclas() {
//    keyboard.left().onPressDo({ heroShip.goTo(heroShip.position().left(1)) })
//    keyboard.right().onPressDo({ heroShip.goTo(heroShip.position().right(1)) })
//    keyboard.space().onPressDo({ heroShip.shoot() })
//  }
}


object configPDCObjetoCompuesto inherits MomentConfiguration{
  override method configMoment(moment){
    super(moment)
    self.configHeroShip(moment.heroShip())
  }
  method configHeroShip(heroShip){
    // TODO: Implementar lógica de direcciones como objetos
    keyboard.left().onPressDo({ heroShip.goTo(heroShip.position().left(1)) })
    keyboard.right().onPressDo({ heroShip.goTo(heroShip.position().right(1)) })
    keyboard.up().onPressDo({ heroShip.goTo(heroShip.position().up(1)) })
    keyboard.down().onPressDo({ heroShip.goTo(heroShip.position().down(1)) })
  }
}
