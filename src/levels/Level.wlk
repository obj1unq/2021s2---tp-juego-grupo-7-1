import wollok.game.game
import gameManager.gameManager
import positions.*
import extras.Anchor
import Coreographer.Coreographer

class Level{
  const formationOrigin = dynamicPositionManager.create(
    gameDimensions.safeArea().xMin(), gameDimensions.safeArea().yMax()
  ) 
  
  // TODO: refactorizar la vinculación del anchor con el coreographer
  const property anchor = new Anchor(position=formationOrigin)
  const formation
  const coreographer = new Coreographer()
  
  method load(){
    self.storeLevelObject()
    self.loadAnchor()
    self.activateBulletsMover()
    self.loadEnemies()
    self.activateCoreographer()
  }
  method storeLevelObject(){
    gameManager.levelObject(self)    
  }
  method loadAnchor(){
    game.addVisual(anchor)
  }
  method activateBulletsMover(){
    // bulletsMover----
  }
  method loadEnemies(){
    formation.loadItems()
  }
  method activateCoreographer(){
    coreographer.activate()
  }
}
