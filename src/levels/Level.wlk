import wollok.game.game
import gameManager.gameManager
import positions.*
import extras.Anchor
import Coreographer.Coreographer
import bullets.bulletsMover.bulletsMover
import bullets.BulletsPool.BulletsPool
import enemies.kamikazeMover.kamikazeMover

class Level{
  const formationOrigin = dynamicPositionFactory.create(
    gameDimensions.globalLimit().left()+1,
    gameDimensions.globalLimit().up()-1
  )
  
  const property anchor = new Anchor(position=formationOrigin)
  const property bulletsPool = new BulletsPool()
  const property enemiesFormation
  const coreographer = new Coreographer()
  
  method load(_gamePlay){
    self.storeLevelObject(_gamePlay)
    self.enemiesFormation().assignAnchor(anchor)
    self.activateHelpers(anchor)
 
    self.DEV_loadAnchor()
  }
  
  method visuals() = self.enemiesFormation().visuals()
  method enemiesTotal() = self.enemiesFormation().enemiesTotal()
  method removeEnemy(enemy){ self.enemiesFormation().removeEnemy(enemy) }
  
  /** -----------------------------------------------------
   * Private Methods
   */
  method activateHelpers(_anchor){
    coreographer.activate(_anchor)
    bulletsPool.load()
    bulletsMover.activate()
    kamikazeMover.activate()
  }
  method storeLevelObject(_gamePlay){ _gamePlay.level(self) }
  method DEV_loadAnchor(){
    /**
     * DEV ONLY METHOD: Loads into screen the 
     */
    game.addVisual(anchor)
  }
}
