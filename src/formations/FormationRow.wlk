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