import wollok.game.game
import Formation.*
import gameManager.gameManager
import Anchor.Anchor
import Coreographer.Coreographer

class Level{
  const formationOrigin = game.at(1,game.height()-4)
  
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


object level1 inherits Level(
  formation=new Formation(
    rows=[
      new FRow(i=[_, p, k, _, _, k, p, _]),
      new FRow(i=[_, p, k, p, p, k, p, _]),
      new FRow(i=[_, p, p, p, p, p, p, _]),
      new FRow(i=[_, _, p, k, k, p, _, _]),
      new FRow(i=[_, _, _, p, p, _, _, _])
    ]
  )
){}

object level2 inherits Level(
  formation=new Formation(
    rows=[
      new FRow(i=[_, k, _, _, _, _, k, _]),
      new FRow(i=[_, p, k, _, _, k, p, _]),
      new FRow(i=[_, _, _, p, p, _, _, _]),
      new FRow(i=[_, _, k, k, k, k, _, _]),
      new FRow(i=[_, k, _, _, _, _, k, _])
    ]
  )
){}
