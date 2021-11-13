import wollok.game.game
import gameManager.gameManager
import positions.*
import extras.Anchor
import Coreographer.Coreographer

class Level{
  const formationOrigin = dynamicPositionFactory.create(
    gameDimensions.safeArea().xMin(), gameDimensions.safeArea().yMax()
  ) 
  
  // TODO: refactorizar la vinculación del anchor con el coreographer
  const property anchor = new Anchor(position=formationOrigin)
  const property enemiesFormation
  const coreographer = new Coreographer()
  
  method load(_gamePlay){
    self.storeLevelObject(_gamePlay)
    self.enemiesFormation().assignAnchor(anchor)
    self.activateCoreographer(anchor)
    
    self.DEV_loadAnchor()
  }
  method storeLevelObject(_gamePlay){
    _gamePlay.level(self)    
  }
//  method loadEnemies(){
//    formation.loadItems()
//  }
  method activateCoreographer(_anchor){
    coreographer.activate(_anchor)
  }
  method visuals(){
    return self.enemiesFormation().visuals()
  }
  method DEV_loadAnchor(){
    game.addVisual(anchor)
  }
}
