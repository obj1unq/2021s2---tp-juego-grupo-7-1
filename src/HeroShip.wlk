import wollok.game.*
import CompositeVisual.*
import Anchor.*
import bullets.*
import extras.tickCalculator
import directions.*
import DynamicPosition.*

object heroShipFactory{
  var lastCreated = null
  method create(){
    lastCreated = new HeroShip()
    return lastCreated
  }
  method lastCreated() = lastCreated
}

class HeroShip inherits CompositeVisual(
  width=3,
  height=2,
  assetPrefix = "px-verde",
  position=new DynamicPosition(x=3, y=3)
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
  
  method shoot() {
    const bullet = heroBulletFactory.create(position=self.position().up()) 
    bullet.shoot()
  }
  
  
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
