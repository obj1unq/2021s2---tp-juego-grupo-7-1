import gameManager.gameManager
import enemies.Private.Private
import enemies.Kamikaze.Kamikaze
import enemies.VoidEnemy.VoidEnemy

class FormationRow{
  const property refs = []
  const items = []

  method instantiateItems(rowIndex){
    var itemIndex = 0
    refs.forEach({ref =>
      const newInstance = ref.newInstance(rowIndex, itemIndex)
      items.add(newInstance)
      itemIndex += 1
    })
//    refs.clear()
  }
  method assignAnchor(anchor){
    items.forEach({item=>
      item.anchor(anchor)
    })
  }
  method visuals() = items.asSet()
  method manageRemoveEnemy(enemy){
    /**
     * removes enemy if it's located in this row
     */
    if(items.contains(enemy)){
      items.remove(enemy)
    }
  }
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
  
  method enemiesTotal() = self.refs().sum({i=> i.itemCount() })
  method assignAnchor(anchor){
    rows.forEach({row=>
      row.assignAnchor(anchor)
    })
    
  }
  method removeEnemy(enemy){
    rows.forEach({row=> row.manageRemoveEnemy(enemy)})
  }
  
  /** privates -------------------------------------------------------------- */
  method refs() = rows.flatMap({row => row.refs()})
}