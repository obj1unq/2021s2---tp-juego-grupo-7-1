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
  const property bulletsLimit
  const property timeLimit
  
  method load(_gamePlay){
    self.storeLevelObjects(_gamePlay)
    self.setupDisplays(_gamePlay)
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
  method storeLevelObjects(_gamePlay){ 
  	_gamePlay.level(self)
  	_gamePlay.bulletsLimit(self.bulletsLimit())
  	_gamePlay.timeLimit(self.timeLimit())
  }
  method setupDisplays(_gamePlay) {
  	_gamePlay.setupDisplays()
  }
  method DEV_loadAnchor(){
    /**
     * DEV ONLY METHOD: Loads into screen the 
     */
    game.addVisual(anchor)
  }
}
