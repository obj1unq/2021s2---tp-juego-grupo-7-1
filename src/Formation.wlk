import enemies.*
import gameManager.gameManager

class FormationItem{
  const xOffsetSize = 5
  const yOffsetSize = 3
  
  method loadItem(rowIndex, itemIndex){
//    console.println(rowIndex.toString() + " " +itemIndex.toString())
  }
  method anchor(){
    return gameManager.levelObject().anchor()
  }
}

object p inherits FormationItem{
  override method loadItem(rowIndex, itemIndex){
    const item = new Private(
      anchor=self.anchor(),
      xOffset=itemIndex*xOffsetSize,
      yOffset=-1*rowIndex*yOffsetSize
    )
    item.add()
  }
}
object k inherits FormationItem{
  override method loadItem(rowIndex, itemIndex){
    const item = new Kamikaze(
      anchor=self.anchor(),
      xOffset=itemIndex*xOffsetSize,
      yOffset=-1*rowIndex*yOffsetSize
    )
    item.add()
  }
}
object _ inherits FormationItem{}

class FormationRow{
  const property items = [] // i for items
  method loadItems(rowIndex){
    var itemIndex = 0
    items.forEach({item =>
      item.loadItem(rowIndex, itemIndex)
      itemIndex += 1
    })
  }
}
class Formation{
  const property rows = []
  method loadItems(){
    var index = 0
    rows.forEach({row =>
      row.loadItems(index)
      index += 1
    })
  }
}