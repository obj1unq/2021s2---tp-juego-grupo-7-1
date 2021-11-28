import extras.ItemCount0
import enemies.EnemyAlias.EnemyAlias

class VoidEnemy inherits ItemCount0{
  method anchor(_anchor){}
  method add(){}
}

object _ inherits ItemCount0 and EnemyAlias{
  override method newInstance(rowIndex, itemIndex){
    return new VoidEnemy()
  }
}