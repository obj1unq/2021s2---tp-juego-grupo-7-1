// TODO: el método se tiene que llamar move porque no describe sino que acciona
class Direction{
  method nextPosition(visual)
  method inverse()
}
object left inherits Direction {
  override method nextPosition(visual){ visual.position().moveLeft(1) }
  override method inverse() = right
}
object right inherits Direction {
  override method nextPosition(visual){ visual.position().moveRight(1) }
  override method inverse() = left
}
object up inherits Direction {
  override method nextPosition(visual){ visual.position().moveUp(1) }
  override method inverse() = down
}
object down inherits Direction {
  override method nextPosition(visual){ visual.position().moveDown(1) }
  override method inverse() = up
}
object neutral inherits Direction {
  override method nextPosition(visual){}
  override method inverse() = self
}