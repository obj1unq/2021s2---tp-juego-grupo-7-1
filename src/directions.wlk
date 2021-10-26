class Direction{
  method nextPosition(visual){
    return visual.position()
  }
}
object left inherits Direction {
  override method nextPosition(visual){
    return visual.position().left(1)
  }
}
object right inherits Direction {
  override method nextPosition(visual){
    return visual.position().right(1)
  }
}
object up inherits Direction {
  override method nextPosition(visual){
    return visual.position().up(1)
  }
}
object down inherits Direction {
  override method nextPosition(visual){
    return visual.position().down(1)
  }
}
object neutral inherits Direction {}
