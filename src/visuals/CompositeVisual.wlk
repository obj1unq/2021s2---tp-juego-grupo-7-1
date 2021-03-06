import extras.Anchor
import extras.Pixel
import visuals.Visual.Visual

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
    self.composition().forEach({ pixel=> pixel.add() })
    if (showAnchor) self.anchor().add()
  }
  override method remove(){
    self.composition().forEach({ pixel=> pixel.remove() })
    if (showAnchor) self.anchor().remove()
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