import wollok.game.*
import moments.Moment.Moment
import SoundPool.soundPool
import config.keyboard.configGameOver
import extras.RawMessage
import positions.dynamicPositionFactory
import visuals.Visual.Visual

object gameOver inherits Moment(
  title=[" ", "A tu casa rey"],
  configuration=configGameOver,
  visuals=#{
    gameOverImage,
    new RawMessage(
      position= dynamicPositionFactory.createAtCenter(),
      text="Pulsa 'Enter' para reintentar, o 'Espacio' para volver al inicio"
    )
  }
){
  override method load(){
    super()
    self.playSound()
  }
  method playSound(){
    soundPool.stop()
    soundPool.playGameOver()
  }  
}
object gameOverImage inherits Visual(position = dynamicPositionFactory.create(11, 18)) {
  method image()="gameOver.png"
}