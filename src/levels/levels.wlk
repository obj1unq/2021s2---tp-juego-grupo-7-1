import wollok.game.game
import gameManager.gameManager
import levels.Level.Level
import positions.*
import formations.Formation
import formations.FormationRow
import Coreographer.Coreographer
import enemies.Private.p
import enemies.Kamikaze.k
import enemies.VoidEnemy._
import extras.Anchor

object level0 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(refs=[_, _, _, p, p, _, _, _])
    ]
  ),
  bulletsLimit=15, timeLimit=30, totalEnemies=2
){}
object level1 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(refs=[_, p, k, _, _, k, p, _]),
      new FormationRow(refs=[_, p, k, p, p, k, p, _]),
      new FormationRow(refs=[_, p, p, p, p, p, p, _]),
      new FormationRow(refs=[_, _, p, k, k, p, _, _]),
      new FormationRow(refs=[_, _, _, p, p, _, _, _])
    ]
  ),
  bulletsLimit=30, timeLimit=60, totalEnemies=22
){}

object level2 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(refs=[_, k, _, _, _, _, k, _]),
      new FormationRow(refs=[_, p, k, _, _, k, p, _]),
      new FormationRow(refs=[_, _, _, p, p, _, _, _]),
      new FormationRow(refs=[_, _, k, k, k, k, _, _]),
      new FormationRow(refs=[_, k, _, _, _, _, k, _])
    ]
  ),
  bulletsLimit=60, timeLimit=90, totalEnemies=14
){}

object levels{
  const list = [level0, level1, level2]
  method quantity() = list.size()
  method level(levelNumber) = list.get(levelNumber-1)
  method loadLevel(levelNumber, gamePlay){
    const currentLevel = self.level(levelNumber)
    currentLevel.load(gamePlay)
  }
}