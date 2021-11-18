import wollok.game.*
import positions.*
import extras.Anchor
import extras.Pixel

class Visual{
  const position = dynamicPositionFactory.createAtCenter()
  method position() = position // avoid using property to prevent dynamicPosition re-instance
  method add(){ game.addVisual(self) }
  
  method isInsideSafeArea() {
    return gameDimensions.isInsideSafeArea(self)
  }
}

class CompositeVisual inherits Visual{
  const width
  const height
  const assetPrefix = "px-void"
  const anchorImage = "px-anchor.png"
  const composition = []
  const property anchor = new Anchor(position=position, image=anchorImage)
  const showAnchor = true
  
  override method position(){ return anchor.position() }
  
  override method add(){
    self.compose()
    self.composition().forEach({ pixel=>game.addVisual(pixel) })
    if (showAnchor) game.addVisual(self.anchor())
  }
  method compose(){
    (0..height-1).forEach({indexH=>
      composition.add(self.compositionRow(indexH))
    })   
  }
  method compositionRow(indexH){
    const filaActual = []
    (0..width-1).forEach({indexW =>
      filaActual.add(
        self.compositionPixel(indexW, indexH)
      )
    })
    return filaActual
  }
  method compositionPixel(indexW, indexH){
    return new Pixel(
      image=assetPrefix+".png",
      xDelta=indexW,
      yDelta=indexH,
      anchor=self.anchor()
    )
  }
  method composition() = composition.flatten()
  
}