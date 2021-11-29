class FormationRow{
  const property aliases = []
  const property items = []

  method instantiateItems(rowIndex){
    var itemIndex = 0
    aliases.forEach({alias =>
      if(alias.itemCount() > 0){
        const newInstance = alias.newInstance(rowIndex, itemIndex)
        items.add(newInstance)
      }
      itemIndex += 1        
    })
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