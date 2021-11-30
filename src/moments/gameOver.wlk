import wollok.game.*
import moments.Moment.Moment
import SoundPool.soundPool
import config.keyboard.configGameOver
import extras.RawMessage
import positions.dynamicPositionFactory

object gameOver inherits Moment(
  title=[" ", "A tu casa rey"],
  configuration=configGameOver
){

  override method load(){
    super()
    soundPool.stop()
    self.playSound()
    game.addVisual(gameOverIm)  
    self.keysActionsMessage() 
  }
  method playSound(){
    soundPool.playGameOver()
  }
  method keysActionsMessage() {
  	const message = new RawMessage(
  	  position= dynamicPositionFactory.createAtCenter(),
  	  text="Pulsa 'Enter' para reintentar, o 'Espacio' para volver al inicio"
  	)
  	message.setup()
  }
  
}
object gameOverIm {
	const property position = dynamicPositionFactory.create(11, 18)
	  method image()="gameOver.png"
    							  
}