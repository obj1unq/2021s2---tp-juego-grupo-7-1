import wollok.game.*
import ObjetoCompuesto.*
import Anchor.*


object heroina inherits ObjetoCompuesto(
  width=10,
  height=3,
  anchor=new Anchor(position=game.center()),
  assetPrefix = "px-verde"
){}
