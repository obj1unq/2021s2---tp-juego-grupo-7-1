import wollok.game.game
import Formation.*
import gameManager.gameManager
import Anchor.Anchor


class Level{
  const formationOrigin = game.at(1,game.height()-4)
  
  const property anchor = new Anchor(position=formationOrigin)
  const formation
  
  method load(){
    self.storeLevelObject()
    self.loadAnchor()
    self.loadEnemies()
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
