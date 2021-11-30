import wollok.game.game
import config.settings.settings
import visuals.Visual.Visual
import bullets.HeroBullet.WithGetHeroBullet

class Explosion inherits WithGetHeroBullet and Visual{
  var currentImage = 1
  const totalFrames = 6
  const imagePrefix = "explosion-"
  const imageExtension = ".png"
  
  method image() = imagePrefix + currentImage + imageExtension
  override method add(){
    super()
    self.activate()
  }
  method activate(){
    game.onTick(
      settings.EXPLOSION_FRAME_DURATION(),
      self.tickEventName(),
      {
        self.updateImage()
        self.manageAutoremove()
      }
    )
  }
  
  /** Private methods ------------------------------------------------------- */
  method tickEventName() = "" + self.identity().toString()
  method updateImage(){ currentImage += 1 }
  method manageAutoremove() {
  	if(currentImage >= totalFrames+1){
  	  self.removeTickEvent()
  	  self.remove()
  	}
  }
  method removeTickEvent(){ game.removeTickEvent(self.tickEventName()) }
}

object explosionFactory{
  method createAt(_position){
    const explosion = new Explosion(position=_position)
    explosion.add()
  }
}