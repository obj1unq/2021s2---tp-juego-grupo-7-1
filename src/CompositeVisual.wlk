import wollok.game.*
import Anchor.*
import Pixel.*

class CompositeVisual{
  const width
  const height
  const assetPrefix
  const property anchor = new Anchor()
  const showAnchor = true
  
  method position(){ return anchor.position() }
  
  method add(){
    self.composition().forEach({
      fila=>fila.forEach({ pixel=>game.addVisual(pixel) })
    })
    if (showAnchor) game.addVisual(self.anchor())
  }
  
  
  
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
//  method goTo(nuevaPosicion) {
//    anchor.goTo(nuevaPosicion)
//  }
}