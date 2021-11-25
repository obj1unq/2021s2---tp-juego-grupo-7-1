import enemies.Enemy.Enemy
import enemies.EnemyAlias.EnemyAlias

class Private inherits Enemy(award = 1, life = 1) {
	override method image() = "private.png"
	
	override method attackType() {
		self.shoot()
	}
}

object p inherits EnemyAlias{
  override method newInstance(rowIndex, itemIndex){
    return new Private(
      xOffset=itemIndex*xOffsetSize,
      yOffset=-1*rowIndex*yOffsetSize
    )
  }
}