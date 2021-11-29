import wollok.game.*
import moments.Moment.Moment
import SoundPool.soundPool


object gameOver inherits Moment(
  title=["FINAL_JUEGO", "A tu casa rey"]
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