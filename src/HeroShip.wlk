import wollok.game.*
import CompositeVisual.*
import Anchor.*
import bullets.Bullet
import tickCalculator.tickCalculator
import directions.neutral

class HeroShip inherits CompositeVisual(
  width=3,
  height=2,
  assetPrefix = "px-verde"
){
  var property life = 3
  var property speed = 50.0
  var direction = neutral
  
  override method add() {
    super()
    game.onTick(
      tickCalculator.speedBasedTick(speed),
      "MOVEMENT" + self.identity().toString(),
      {
        self.move()
      }
    ) 
    
  }
  method turn(_direction){
    direction = _direction
  }
  method move(){
    direction.nextPosition(anchor)
  }
  
//  override method goTo(newPosition) {
//    if(newPosition.x().between(1, game.width() - 2)) {
//      anchor.position(newPosition)
//    }
//  }
  
//  method shoot() {
//    const bullet = new Bullet( position = self.position().up(1) ) 
//    bullet.shoot()
//  }
  
//  method receiveHit(){
////    console.println("colision")
//      if(life > 1) { 
//        life -=1 
//      } else {
//      self.die()
//    }
//  }
//  
//  method die() { 
//    console.println("la quedé")
//  }
}
