import wollok.game.*
import Visual.Visual
import bullets.*
import Anchor.Anchor
import gameManager.gameManager
import bulletFactory.*

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
    return game.at(anchor.position().x() + xOffset, anchor.position().y() + yOffset)
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
    const bullet = bulletFactory.create(self.position().down(1), goesUp)
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
//    game.schedule(self.nextShootDelay(), { self.shoot()})
  }

}

