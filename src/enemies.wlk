import wollok.game.*
import visuals.Visual
import bullets.*
import extras.Anchor
import gameManager.gameManager
import positions.*

class Enemy inherits Visual {

  const property goesUp = false
  const property award = 1
  var property life = 2
  var property anchor
  var property xOffset
  var property yOffset
//  var firstShotDone = false

  method image() = "hotdog.png"

  override method position() {
    return dynamicPositionManager.create(
      anchor.position().x() + xOffset,
      anchor.position().y() + yOffset
    )
  }

  override method add() {
    super()
    self.activate()
  }

  override method activate() {
  	const time = self.attackDelay(3000,15000)
  	if (game.hasVisual(self)) {
    	self.activateAttack(time, { self.shoot()})
    	game.schedule(time, { self.activate() } )
 	}
  }

  method receiveHit() {
    self.lifeDecrease()
  }

  method lifeDecrease() {
    if (life > 1) {
      life -= 1
    } else {
      self.die()
    }
  }

  method shoot() {
    const bullet = bulletsFactory.createEnemyBullet(self.position().translated(0, -1))
    bullet.shoot()
  }


  method die() {
    game.removeVisual(self)
    gameManager.increaseScore(award)
  }

}

class Private inherits Enemy(award = 1, life = 1) {}

class Kamikaze inherits Enemy(award = 2, life = 2) {

  var onBanzai = false
  var banzaiXY = null

  override method image() = "mcdonalds.png" // agregar imagen enemiga

  override method position() {
  	if (onBanzai) {
  		return banzaiXY
  	} else {
  		super()
  	}
  }

  method banzai() {
    banzaiXY = self.position()
    onBanzai = true
    life = 1
    
    game.onTick(50, "BANZAI" + self.identity().toString(), { self.move()})
  }
  
  override method activate() {
  	const time = self.attackDelay(15000,120000)
  	if (game.hasVisual(self)) {
    	self.activateAttack(time, { self.banzai() } )
    	game.schedule(time, { self.activate() } )
 	}
  }

  override method move() {
    if (self.isInsideSafeArea()) {
      self.position().moveDown(1)
    } else {
      game.removeTickEvent("BANZAI" + self.identity().toString())
      self.remove()
    }
  }

  method remove() {
    game.removeVisual(self)
  }

}

