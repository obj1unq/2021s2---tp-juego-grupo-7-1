import enemies.EnemyAlias.EnemyAlias

class VoidEnemy{
  method anchor(_anchor){}
  method add(){}
}

object _ inherits EnemyAlias{
  override method newInstance(rowIndex, itemIndex){
    return new VoidEnemy()
  }
  override method itemCount() = 0
}