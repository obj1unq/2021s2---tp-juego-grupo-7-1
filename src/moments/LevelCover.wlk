import wollok.game.game
import moments.Moment.Moment
import gameManager.gameManager
import config.settings.settings
import SoundPool.soundPool

class LevelCover inherits Moment(
  title=["PRESENTACIÓN NIVEL", "Nivel " + gameManager.levelNumber().toString()]
){
  var countDown = settings.LEVEL_COVER_TIME()
  override method load(){
    super()
    self.playSound()
    gameManager.refreshDisplays()
    self.scheduleSwitchToGamePlay()
  }
  
  
  /** Private Methods ------------------------------------------------------- */
  method scheduleSwitchToGamePlay(){
    self.startCountDown()
    game.schedule(settings.LEVEL_COVER_TIME()*1000, {
      game.removeTickEvent(self.identity().toString()+"_COUNT_DOWN") 
      gameManager.switchToGamePlay()
    })
  }
  method startCountDown(){
    self.refreshCountDownDisplay()
    game.onTick(
      1000,
      self.identity().toString()+"_COUNT_DOWN",
      { self.refreshCountDownDisplay() }
    )
  }
  method refreshCountDownDisplay() {
  	console.println("countDown: " + countDown)
    countDown-=1
  }
  method playSound(){
    soundPool.stop()
    soundPool.playLevel()
  }
}