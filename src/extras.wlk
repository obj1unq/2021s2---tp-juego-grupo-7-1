import wollok.game.game
import visuals.Visual
import positions.dynamicPositionFactory
import config.settings.settings
import HeroShip.WithCollideWithHeroShip
import bullets.HeroBullet.WithGetHeroBullet

object calc{
  method speedBasedTick(speed) = (1.0 / speed * 1000).roundUp()    
  method randomInRange(min, max) = min.randomUpTo(max)
}

class Anchor inherits WithGetHeroBullet and WithCollideWithHeroShip and Visual{
  const image = "px-anchor.png"
  method image() { return image }
  // method receiveHit() {}
}

class Pixel inherits Visual{
  var property anchor
  var property image
  var property xDelta
  var property yDelta
  
  override method position(){
    const displacing = if(settings.DISPLACE_PIXELS_FROM_ANCHOR()) 1 else 0
    position.x(anchor.position().x()+xDelta+displacing)
    position.y(anchor.position().y()+yDelta)
    return position
  }
}

class RawMessage inherits WithGetHeroBullet {
  var property position = dynamicPositionFactory.create(25,28)
  var property text = "HOLA"
  var property textColor = "FFFFFFFF"
  
  method setup(){
    game.addVisual(self)
  }
  
  method clear(){
  	game.removeVisual(self)
  }
}

object listHandler{
  method pop(list){
    /**
     * Deletes last item from list and returns it.
     */
    const popped = list.last()
    list.remove(popped)
    return popped
  }
}

object collisioner{
  method onCollideDo(subject, closure){
    const colliders = game.allVisuals().filter({visual=> 
          visual.position().x() == subject.position().x()
      and visual.position().y() == subject.position().y()
    })
    colliders.remove(subject)
    colliders.forEach({collider=>
      closure.apply(collider)
    })
  }
}

mixin ItemCount{
  method itemCount()
}
mixin ItemCount0 inherits ItemCount{
  override method itemCount() = 0
}
mixin ItemCount1 inherits ItemCount{
  override method itemCount() = 1
}