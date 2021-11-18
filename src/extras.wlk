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

class Anchor inherits WithCollideWithHeroShip and Visual{
  const image = "px-anchor.png"
  method image() { return image }
  method receiveHit() {}
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

object rawMessage inherits WithGetHeroBullet {
  var property position = game.at(game.width()/2, game.height()-2)
  var property text = "HOLA"
  var property textColor = "FFFFFFFF"
  
  method setup(){
    game.addVisual(self)
  }
}