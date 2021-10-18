import wollok.game.*
import gameManager.gameManager
import moments.*
import personajes.*
import HeroShip.*
import PDC_CompositeVisual.PDC_CompositeVisual

class Config{
  // vvv To Deprecate! vvvvvv
  method config(){
    self.configurarTeclas()
  }
  method configurarTeclas(){}
  // ^^^ End To Deprecate ^^^
  
  method configMoment(moment){}
}
object configVoid inherits Config{}


object configGlobal inherits Config{
  override method configurarTeclas() {
    keyboard.num1().onPressDo({gameManager.switchTo(gameTitle)})
    keyboard.num2().onPressDo({gameManager.switchTo(levelCover)})
    keyboard.num3().onPressDo({gameManager.switchTo(gamePlay)})
    keyboard.num4().onPressDo({gameManager.switchTo(gameOver)})
    keyboard.num5().onPressDo({gameManager.switchTo(credits)})
    keyboard.num6().onPressDo({gameManager.switchTo(new PDC_CompositeVisual())})
    keyboard.num7().onPressDo({gameManager.switchTo(pdcJuego)})
  }
}


object configPDCJuego inherits Config{
//  override method configurarTeclas() {
//    keyboard.left().onPressDo({ heroShip.goTo(heroShip.position().left(1)) })
//    keyboard.right().onPressDo({ heroShip.goTo(heroShip.position().right(1)) })
//    keyboard.space().onPressDo({ heroShip.shoot() })
//  }
}


object configPDCObjetoCompuesto inherits Config{
  override method configMoment(moment){
    self.configHeroShip(moment.heroShip())
  }
  method configHeroShip(heroShip){
    keyboard.left().onPressDo({ heroShip.goTo(heroShip.position().left(1)) })
  }
  // TODO: Implementar lógica de direcciones como objetos
//  override method configurarTeclas() {
//    keyboard.left().onPressDo({ pdcObjetoCompuesto.heroShip().goTo(pdcObjetoCompuesto.heroShip().position().left(1)) })
//    keyboard.right().onPressDo({ pdcObjetoCompuesto.heroShip().goTo(pdcObjetoCompuesto.heroShip().position().right(1)) })
//    keyboard.up().onPressDo({ pdcObjetoCompuesto.heroShip().goTo(pdcObjetoCompuesto.heroShip().position().up(1)) })
//    keyboard.down().onPressDo({ pdcObjetoCompuesto.heroShip().goTo(pdcObjetoCompuesto.heroShip().position().down(1)) })
//  }
}
