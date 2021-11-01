import wollok.game.game
import gameManager.gameManager
import DynamicPosition.*
import Formation.*
import Anchor.Anchor
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

object level1 inherits Level(
  formation=new Formation(
    rows=[
      new FormationRow(items=[_, p, k, _, _, k, p, _]),
      new FormationRow(items=[_, p, k, p, p, k, p, _]),
      new FormationRow(items=[_, p, p, p, p, p, p, _]),
      new FormationRow(items=[_, _, p, k, k, p, _, _]),
      new FormationRow(items=[_, _, _, p, p, _, _, _])
    ]
  )
){}

object level2 inherits Level(
  formation=new Formation(
    rows=[
      new FormationRow(items=[_, k, _, _, _, _, k, _]),
      new FormationRow(items=[_, p, k, _, _, k, p, _]),
      new FormationRow(items=[_, _, _, p, p, _, _, _]),
      new FormationRow(items=[_, _, k, k, k, k, _, _]),
      new FormationRow(items=[_, k, _, _, _, _, k, _])
    ]
  )
){}

object levels{
  const property list = [level1, level2]
}