import enemies.*
import gameManager.gameManager

class FormationItemReference{
  const xOffsetSize = 5
  const yOffsetSize = 3
  
//  method anchor() = gameManager.levelObject().anchor()
  method newInstance(rowIndex, itemIndex)
}

object p inherits FormationItemReference{
  override method newInstance(rowIndex, itemIndex){
    return new Private(
      xOffset=itemIndex*xOffsetSize,
      yOffset=-1*rowIndex*yOffsetSize
    )
  }
}
object k inherits FormationItemReference{
  override method newInstance(rowIndex, itemIndex){
    return new Kamikaze(
      xOffset=itemIndex*xOffsetSize,
      yOffset=-1*rowIndex*yOffsetSize
    )
  }
}
object _ inherits FormationItemReference{
  override method newInstance(rowIndex, itemIndex){
    return new VoidEnemy()
  }
}

class FormationRow{
  const property refs = []
  const items = []

  method instantiateItems(rowIndex){
    var itemIndex = 0
    refs.forEach({ref =>
      items.add(
        ref.newInstance(rowIndex, itemIndex)
      )
      itemIndex += 1
    })
  }
  method assignAnchor(anchor){
    items.forEach({item=>
      item.anchor(anchor)
    })
  }
  method visuals() = items.asSet()
}


class Formation{
  const property rows = []
  
  method initialize(){
    var rowIndex = 0
    rows.forEach({row => 
      row.instantiateItems(rowIndex)
      rowIndex += 1
    })
  }
  method visuals() = rows.flatMap({row => row.visuals()})
  method assignAnchor(anchor){
    rows.forEach({row=>
      row.assignAnchor(anchor)
    })
  }
}