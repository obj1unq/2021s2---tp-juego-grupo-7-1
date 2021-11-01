import wollok.game.*
import visuals.Visual
import bullets.Bullet
import extras.Anchor
import gameManager.gameManager

object heroShipIndividual inherits Visual(position = self.startPosition()) { //nombre provisorio

  var property life = 3

  method image() = "brocoli.png"

  method initialize() {
    game.onCollideDo(self, { console.println("se para el juego")})
  }

  method startPosition() {
    return game.at(25, 1)
  }

  method goTo(newPosition) {
    if (newPosition.x().between(0, game.width() - 2)) {
      position = newPosition
    }
  }

  method shoot() {
    const bullet = new Bullet(position = self.position().up(1))
    bullet.shoot()
  }

  method receiveHit(harmless) {
    if (not harmless) {
      self.lifeDecrease()
    }
  }

  method lifeDecrease() {
    if (life > 1) {
      life -= 1
    } else {
      self.die()
    }
  }

  method die() {
    console.println("la quedé")
  }
}
