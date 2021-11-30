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
//    game.addVisual(gameOverIm)   
  }
  method playSound(){
    soundPool.playGameOver()
  }
}
//object gameOverIm {
//	const property position = game.at(10, 15)
//	  method image()="gameOver.png"
//    							  
//}