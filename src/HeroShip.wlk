import wollok.game.*
import CompositeVisual.*
import Anchor.*


class HeroShip inherits CompositeVisual(
  width=4,
  height=3,
  anchor=new Anchor(position=game.center()),
  assetPrefix = "px-verde"
){}
