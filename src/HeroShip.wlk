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

  const xMin = 2
  const xMax = game.width() - 2
  const yMin = 2
  const yMax = game.height() - 2
  
  var direction = neutral
  
  override method add() {
    super()
    self.activateMovement()
    self.setupAreaLimiting()    
  }
  method turn(_direction){
    direction = _direction
  }
  method move(){
    direction.nextPosition(anchor)
  }
  
  method activateMovement(){
    game.onTick(
      tickCalculator.speedBasedTick(speed),
      "MOVEMENT" + self.identity().toString(),
      { self.move() }
    ) 
  }
  method setupAreaLimiting(){
    self.position().xMin(xMin)
    self.position().xMax(xMax)
    self.position().yMin(yMin)
    self.position().yMax(yMax)
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
