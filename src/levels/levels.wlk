import wollok.game.game
import gameManager.gameManager
import levels.Level.Level
import positions.*
import formations.Formation.Formation
import formations.FormationRow.FormationRow
import Coreographer.Coreographer
import enemies.Private.p
import enemies.Kamikaze.k
import enemies.VoidEnemy._
import extras.Anchor

object level0 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(aliases=[_, _, _, p, p, _, _, _])
    ]
  ),
  bulletsLimit=15, timeLimit=30, totalEnemies=2
){}
object level1 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(aliases=[_, p, k, _, _, k, p, _]),
      new FormationRow(aliases=[_, p, k, p, p, k, p, _]),
      new FormationRow(aliases=[_, p, p, p, p, p, p, _]),
      new FormationRow(aliases=[_, _, p, k, k, p, _, _]),
      new FormationRow(aliases=[_, _, _, p, p, _, _, _])
    ]
  ),
  bulletsLimit=30, timeLimit=60, totalEnemies=22
){}

object level2 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(aliases=[_, k, _, _, _, _, k, _]),
      new FormationRow(aliases=[_, p, k, _, _, k, p, _]),
      new FormationRow(aliases=[_, _, _, p, p, _, _, _]),
      new FormationRow(aliases=[_, _, k, k, k, k, _, _]),
      new FormationRow(aliases=[_, k, _, _, _, _, k, _])
    ]
  ),
  bulletsLimit=60, timeLimit=90, totalEnemies=14
){}

object levels{
  const list = [level0, level1, level2]
  method quantity() = list.size()
  method level(levelNumber) = list.get(levelNumber.value()-1)
  method loadLevel(levelNumber, gamePlay){
    const currentLevel = self.level(levelNumber)
    currentLevel.load(gamePlay)
  }
}