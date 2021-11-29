import wollok.game.game
import moments.Moment.Moment
import gameManager.gameManager
import config.settings.settings
import SoundPool.soundPool
import extras.RawMessage
import levels.levels.levels
import positions.dynamicPositionFactory

class LevelCover inherits Moment(
  title=["PRESENTACIÓN NIVEL", "Nivel " + gameManager.levelNumber().toString()]
){
  var countDown = settings.LEVEL_COVER_TIME()
  override method load(){
    super()
    self.loadGoal()
    self.playSound()
    gameManager.refreshDisplays()
    self.scheduleSwitchToGamePlay()
  }
  
  method loadGoal() {
  	const goals = levels.levelGoals(gameManager.levelNumber())
  	const message = new RawMessage(
  		position= dynamicPositionFactory.createAtCenter(),
  		text="Destruye todas las naves enemigas. Tienes " 
  		+ goals.first().toString()
  		+ " segundos y cuentas con " 
  		+ goals.last().toString()
  		+ " balas"
  	)
  	message.setup()
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
    soundPool.playMenuMusic()
    
  }
}