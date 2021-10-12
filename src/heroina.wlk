import wollok.game.*
import Anchor.*
import Pixel.*


object heroina {
  const width = 10
  const height = 3
  const assetPrefix = "px-verde"
  const property anchor = new Anchor()
  method position() = game.center()
  
  method composition(){
    const comp = []
    (0..height-1).forEach({indexH=>
      const filaActual = []
      (0..width-1).forEach({indexW =>
        filaActual.add(
          new Pixel(
            image=assetPrefix+".png",
            xDelta=indexW,
            yDelta=indexH,
            anchor=self.anchor()
          )
        )
      })
      comp.add(filaActual)
    })
    return comp
  }
  method addVisualComposition(){
    self.composition().forEach({fila=>
      fila.forEach({pixel=>game.addVisual(pixel)})
    })
    game.addVisual(self.anchor())
  }
}
