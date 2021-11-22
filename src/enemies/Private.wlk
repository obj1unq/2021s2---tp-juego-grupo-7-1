import enemies.Enemy.Enemy

class Private inherits Enemy(award = 1, life = 1) {
	override method image() = "private.png"
	
	override method attackType() {
		self.shoot()
	}
}
