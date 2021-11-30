import wollok.game.*
import moments.Moment.Moment
import SoundPool.soundPool
import config.keyboard.configGameOver


object gameOver inherits Moment(
  title=["FINAL_JUEGO", "A tu casa rey"],
  configuration=configGameOver
){
  override method load(){
    super()
    soundPool.stop()
    self.playSound()
  }
  method playSound(){
    soundPool.playGameOver()
  }
}