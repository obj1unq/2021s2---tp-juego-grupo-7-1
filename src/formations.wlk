import gameManager.gameManager
import enemies.Private.Private
import enemies.Kamikaze.Kamikaze
import enemies.VoidEnemy.VoidEnemy

class FormationItemReference{
  const xOffsetSize = 5
  const yOffsetSize = 3
  
//  method anchor() = gameManager.levelObject().anchor()
  method newInstance(rowIndex, itemIndex)
  method itemCount() = 1
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
  const kamikazes = #{}
  override method newInstance(rowIndex, itemIndex){
    const kamikazeShip = new Kamikaze(
      xOffset=itemIndex*xOffsetSize,
      yOffset=-1*rowIndex*yOffsetSize
    )
    kamikazes.add(kamikazeShip)
    return kamikazeShip
  }
  method banzayers() = kamikazes.filter({kamikaze=> kamikaze.onBanzai()})
  method moveBanzayers(){
    self.banzayers().forEach({banzayer=>
      banzayer.move()
    })
  }
  method removeInstance(instance){ kamikazes.remove(instance) }
}
object _ inherits FormationItemReference{
  override method newInstance(rowIndex, itemIndex){
    return new VoidEnemy()
  }
  override method itemCount() = 0
}

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
    refs.clear()
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
  method removeEnemy(enemy){
    console.println("FALTA IMPLMENTAR Formation.removeEnemy()")
  }
}