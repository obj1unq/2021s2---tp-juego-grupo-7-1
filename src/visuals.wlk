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
  
  var property position = dynamicPositionFactory.createAtCenter()
  method add(){ game.addVisual(self) }
  method move()
  method isInsideSafeArea() {
  	return self.position().y() >= gameDimensions.safeArea().yMin()
  }
  method activate()
  method activateAttack(time, attack) {
    game.schedule(time, attack)
  }
  method attackDelay(min,max) {
    return min.randomUpTo(max)
  }
}

class CompositeVisual{
  const width
  const height
  const assetPrefix
  const position = new DynamicPosition(x=3, y=3)
  const anchorImage = "px-anchor.png"
  const composition = []
  const property anchor = new Anchor(position=position, image=anchorImage)
  const showAnchor = true
  
  method position(){ return anchor.position() }
  
  method add(){
    self.compose()
    self.composition().forEach({
      fila=>fila.forEach({ pixel=>game.addVisual(pixel) })
    })
    if (showAnchor) game.addVisual(self.anchor())
  }
  method compose(){
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
      composition.add(filaActual)
    })   
  }
  method composition() = composition
}