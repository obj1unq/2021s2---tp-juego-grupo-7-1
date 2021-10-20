import wollok.game.game
import gameManager.gameManager
import Anchor.Anchor
import Coreographer.Coreographer

class Level{
  const formationOrigin = game.at(1,game.height()-4)
  
  // TODO: refactorizar la vinculación del anchor con el coreographer
  const property anchor = new Anchor(position=formationOrigin)
  const formation
  const coreographer = new Coreographer()
  
  method load(){
    self.storeLevelObject()
    self.loadAnchor()
    self.loadEnemies()
    self.activateCoreographer()
  }
  method storeLevelObject(){
    gameManager.levelObject(self)    
  }
  method loadAnchor(){
    game.addVisual(anchor)
  }
  method loadEnemies(){
    formation.loadItems()
  }
  method activateCoreographer(){
    coreographer.activate()
  }
}