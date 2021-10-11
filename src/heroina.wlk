import wollok.game.*
import Anchor.*

class HeroinaPx{
  var property anchor
  var property image
  var property xDelta
  var property yDelta
  
  method position(){
    return game.at(
      anchor.position().x()+xDelta,
      anchor.position().y()+yDelta
    )
  }
}
object heroina {
  const width = 5
  const height = 5
  const assetPrefix = "px-verde"
  const property anchor = new Anchor()
  method position() = game.center()
  
  method composition(){
    const comp = []
    (0..height-1).forEach({indexN=>
      const filaActual = []
      (0..width-1).forEach({indexM =>
        filaActual.add(
          new HeroinaPx(
            image=assetPrefix+".png",
            xDelta=indexN,
            yDelta=indexM,
            anchor=self.anchor()
          )
        )
      })
      comp.add(filaActual)
    })
    return comp
  }
}
