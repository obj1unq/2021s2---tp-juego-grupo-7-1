import wollok.game.*
import positions.*
import extras.Anchor
import extras.Pixel

class Visual{
  /**
   * NOTE: Visual childs must use add() method to be added to the stage,
   * instead of the direct "game.add(...)". This allows polymorphic
   * behavior to both native and CompositeVisuals objects.
   */
  
  // TODO: Evaluar que esta clase tenga los metodos de los movimientos delimitados.
  
  var property position = dynamicPositionManager.createAtCenter()
  method add(){ game.addVisual(self) }
}

class CompositeVisual{
  const width
  const height
  const assetPrefix
  const position = new DynamicPosition(x=3, y=3)
  const anchorImage = "px-anchor.png"
  
  const property anchor = new Anchor(position=position, image=anchorImage)
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
}