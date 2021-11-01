class Direction{
  method nextPosition(visual){}
}
object left inherits Direction {
  override method nextPosition(visual){
    visual.position().moveLeft(1)
  }
}
object right inherits Direction {
  override method nextPosition(visual){
    visual.position().moveRight(1)
  }
}
object up inherits Direction {
  override method nextPosition(visual){
    visual.position().moveUp(1)
  }
}
object down inherits Direction {
  override method nextPosition(visual){
    visual.position().moveDown(1)
  }
}
object neutral inherits Direction {}
