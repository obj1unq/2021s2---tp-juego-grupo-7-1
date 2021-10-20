import wollok.game.*
import Enemy.Enemy

class Private inherits Enemy(award = 1, life = 2) {}

class Kamikaze inherits Enemy(award = 2, life = 3) {

  var onBanzai = false
  var banzaiX = null

  override method image() = "mcdonalds.png" // agregar imagen enemiga

  override method position() {
    if (not onBanzai) {
      return game.at(anchor.position().x() + xOffset, anchor.position().y() + yOffset)
    } else {
      return game.at(banzaiX, anchor.position().y() + yOffset)
    }
  }

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

