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
//import extras.NumberValue

class Level1 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(aliases=[_, _, _, p, p, _, _, _])
    ]
  ),
  bulletsLimit=15,
  timeLimit=30
){}

object lvl1 {
	method newInstance() = new Level1()
}

class Level2 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(aliases=[_, k, _, _, _, _, k, _]),
      new FormationRow(aliases=[_, _, p, _, _, p, _, _])
    ]
  ),
  bulletsLimit=30,
  timeLimit=60
){}
object lvl2 {
  method newInstance() = new Level2()
}

class Level3 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(aliases=[_, _, k, _, _, k, _, _]),
      new FormationRow(aliases=[_, p, _, _, _, _, p, _]),
      new FormationRow(aliases=[_, _, _, p, p, _, _, _])
    ]
  ),
  bulletsLimit=30,
  timeLimit=60
){}
object lvl3 {
	method newInstance() = new Level3()
}

class Level4 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(aliases=[_, p, _, _, _, _, k, _]),
      new FormationRow(aliases=[_, _, p, _, _, k, _, _]),
      new FormationRow(aliases=[_, _, _, _, _, _, _, _]),
      new FormationRow(aliases=[_, _, k, _, _, p, _, _]),
      new FormationRow(aliases=[_, k, _, _, _, _, p, _])
    ]
  ),
  bulletsLimit=60,
  timeLimit=90
){}
object lvl4 {
	method newInstance() = new Level4()
}

class Level5 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(aliases=[_, _, p, _, _, p, _, _]),
      new FormationRow(aliases=[_, k, _, _, _, _, k, _]),
      new FormationRow(aliases=[p, _, _, _, _, _, _, p]),
      new FormationRow(aliases=[_, _, _, k, k, _, _, _]),
      new FormationRow(aliases=[_, p, _, _, _, _, p, _])
    ]
  ),
  bulletsLimit=60,
  timeLimit=90
){}
object lvl5 {
  method newInstance() = new Level5()
}

object levels{
  const list = [lvl1, lvl2, lvl3, lvl4, lvl5]
  method quantity() = list.size()
  method level(levelNumber) = list.get(levelNumber-1).newInstance()
  method loadLevel(levelNumber, gamePlay){
    const currentLevel = self.level(levelNumber)
    currentLevel.load(gamePlay)
  }
  method levelGoals(levelNumber) {
  	const level = self.level(levelNumber)
  	return [ level.timeLimit(), level.bulletsLimit() ]
  }
}