import wollok.game.game
import gameManager.gameManager
import positions.*
import extras.Anchor
import Coreographer.Coreographer

class Level{
  const formationOrigin = dynamicPositionFactory.create(
    gameDimensions.globalLimit().left()+1,
    gameDimensions.globalLimit().up()-1
  ) 
  
  const property anchor = new Anchor(position=formationOrigin)
  const property enemiesFormation
  const coreographer = new Coreographer()
  
  method load(_gamePlay){
    self.storeLevelObject(_gamePlay)
    self.enemiesFormation().assignAnchor(anchor)
    self.activateCoreographer(anchor)
    
    self.DEV_loadAnchor()
  }
  
  method visuals() = self.enemiesFormation().visuals()
  
  
  
  /** -----------------------------------------------------
   * Private Methods
   */
  method activateCoreographer(_anchor){ coreographer.activate(_anchor) }
  method storeLevelObject(_gamePlay){ _gamePlay.level(self) }
  method DEV_loadAnchor(){
    /**
     * DEV ONLY METHOD: Loads into screen the 
     */
    game.addVisual(anchor)
  }
}
