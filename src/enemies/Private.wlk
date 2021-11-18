import enemies.Enemy.Enemy

class Private inherits Enemy(award = 1, life = 1) {
	override method attackType() {
		self.shoot()
	}
}
