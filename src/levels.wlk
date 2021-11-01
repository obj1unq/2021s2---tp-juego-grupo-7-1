import Formation.*
import Level.Level


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