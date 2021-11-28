class Formation{
  const property rows = []
  
  method visuals() = rows.flatMap({row => row.visuals()})
  method enemiesTotal() = self.aliases().sum({i=> i.itemCount() })
  method enemiesLeft() = self.items().sum({i=> i.itemCount() })
  method removedEnemies() = self.enemiesTotal() - self.enemiesLeft()
  
  method assignAnchor(anchor){
    rows.forEach({row=> row.assignAnchor(anchor) })
  }
  method removeEnemy(enemy){
    rows.forEach({row=> row.manageRemoveEnemy(enemy)})
  }
  
  /** privates -------------------------------------------------------------- */
  method aliases() = rows.flatMap({row => row.aliases()})
  method items() = rows.flatMap({row => row.items()})
  method instantiateItems() {
  	var rowIndex = 0
    rows.forEach({row => 
      row.instantiateItems(rowIndex)
      rowIndex += 1
    })
  }
  
}