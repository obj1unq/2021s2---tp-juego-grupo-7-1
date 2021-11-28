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