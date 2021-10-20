import wollok.game.*
import Visual.Visual
import gameManager.gameManager

class Bullet inherits Visual {

  method image() = "asparagus.png"

  method remove() {
    game.removeTickEvent("BULLET_MOVEMENT" + self.identity().toString())
    game.removeVisual(self)
  }

  method move() {
    if (self.position().y() < game.height() - 4) { // reveer el area
      position = self.position().up(1)
    } else {
      self.remove()
    }
  }

  method shoot() {
    self.add()
    game.onTick(50, "BULLET_MOVEMENT" + self.identity().toString(), { self.move()})
    game.onCollideDo(self, { target =>
      target.receiveHit()
      self.remove()
    })
  }

  method receiveHit() {
    self.remove()
  }

}

class EnemyBullet inherits Bullet {

  const award = 10

  override method image() = "asparagus.png" // agregar imagen de tiro enemigo ".png" 

  override method move() {
    if (self.position().y() > 0) {
      position = self.position().down(1)
    } else {
      self.remove()
    }
  }

  override method receiveHit() {
// podriamos agregar un validar disparo que compruebe si el disparo le tendria q hacer danio, remover o nada.
// con darle una orientacion a la bala (arriba y abajo) segun quien dispare si hero o enemy?
// si tiene la misma orientacion no tendria que eliminarse (?)
    gameManager.increaseScore(award) // Crear Score
    self.remove()
  }

}

