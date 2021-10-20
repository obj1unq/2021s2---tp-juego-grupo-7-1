import Formation.*
import Level.Level


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
