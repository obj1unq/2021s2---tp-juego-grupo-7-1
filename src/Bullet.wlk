import wollok.game.*
import Visual.Visual

class Bullet inherits Visual{
  method image() = "asparagus.png"
  
  method initialize() {
        self.add()
  }
  
  method remove(){
    game.removeTickEvent("BULLET_MOVEMENT" + self.identity().toString())
    game.removeVisual(self)
  }

  method move() {
    if(self.position().y() < game.height()-4) { // reveer el area
      position = self.position().up(1)
    } else {
      self.remove()
    }
  }
  
  method shoot(){
    game.onTick(50, "BULLET_MOVEMENT" + self.identity().toString(), {self.move()})
    game.onCollideDo(self, 
      { 
        target =>   target.receiveHit()
              self.remove()
      }
    )  
  }
  
  method receiveHit() {
    self.remove()
  }
}