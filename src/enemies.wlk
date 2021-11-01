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
  var firstShotDone = false

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

  method activate() {
    self.activateAttack()
  }

  method receiveHit(harmful) {
    if(harmful){ self.lifeDecrease() }
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

  method nextShootDelay() {
    // TODO: acá puede haber una lógcia de firstShotDelay y nextShot ordinario
    const min = if (!firstShotDone) 3000 else 20000
    const max = if (!firstShotDone) 10000 else 50000
    firstShotDone = !firstShotDone
    return min.randomUpTo(max)
  }

  method die() {
    game.removeVisual(self)
    gameManager.increaseScore(award)
  }

  method activateAttack() {
    game.schedule(self.nextShootDelay(), { self.shoot()})
  }

}

class Private inherits Enemy(award = 1, life = 2) {}

class Kamikaze inherits Enemy(award = 2, life = 3) {

  var onBanzai = false
  var banzaiX = null

  override method image() = "mcdonalds.png" // agregar imagen enemiga

//  override method position() {
//    if (not onBanzai) {
//      return game.at(anchor.position().x() + xOffset, anchor.position().y() + yOffset)
//    } else {
//      return game.at(banzaiX, anchor.position().y() + yOffset)
//    }
//  }

  method banzai() {
    onBanzai = true
    banzaiX = self.position().x()
    life = 1
    game.onTick(50, "ENEMY_MOVEMENT" + self.identity().toString(), { self.move()})
    game.onCollideDo(self, { target =>
      target.receiveHit()
      self.die()
    })
  }

  method move() {
    if (self.position().y() > 0) {
      position = self.position().down(1)
    } else {
      self.remove()
    }
  }

  method remove() {
    game.removeTickEvent("ENEMY_MOVEMENT" + self.identity().toString())
    game.removeVisual(self)
  }

}

