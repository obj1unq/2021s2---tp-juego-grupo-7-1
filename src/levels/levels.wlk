import wollok.game.game
import gameManager.gameManager
import positions.*
import formations.*
import extras.Anchor
import Coreographer.Coreographer
import levels.Level.Level

object level1 inherits Level(
  enemiesFormation=new Formation(
    rows=[
      new FormationRow(refs=[_, p, k, _, _, k, p, _]),
      new FormationRow(refs=[_, p, k, p, p, k, p, _]),
      new FormationRow(refs=[_, p, p, p, p, p, p, _]),
      new FormationRow(refs=[_, _, p, k, k, p, _, _]),
      new FormationRow(refs=[_, _, _, p, p, _, _, _])
    ]
  )
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
  )
){}

object levels{
  const list = [level1, level2]
  method level(levelNumber) = list.get(levelNumber-1)
}