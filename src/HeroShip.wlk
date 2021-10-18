import wollok.game.*
import CompositeVisual.*
import Anchor.*
import bullets.Bullet

class HeroShip inherits CompositeVisual(
  width=4,
  height=3,
  anchor=new Anchor(),
  assetPrefix = "px-verde"
){
  var property position = self.startPosition()
  var property life = 3

  method image() = "brocoli.png"
  
  method initialize() {
//    game.onCollideDo(self, {
//      console.println("se para el juego")
//    })  
  }
  
  method startPosition() {
    return game.at(game.width()/2, 0)
  }
  
  override method goTo(newPosition) {
    if(newPosition.x().between(1, game.width() - 2)) { anchor.position(newPosition) }
  }
  
  method shoot() {
    const bullet = new Bullet( position = self.position().up(1) ) 
    bullet.shoot()
  }
  
  method receiveHit(){
//    console.println("colision")
      if(life > 1) { 
        life -=1 
      } else {
      self.die()
    }
  }
  
  method die() { 
    console.println("la quedé")
  }
}
