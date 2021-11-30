import moments.Moment.Moment
import SoundPool.soundPool
import config.keyboard.configGameWin
import extras.RawMessage
import positions.dynamicPositionFactory
import visuals.Visual.Visual


object gameWin inherits Moment(
  title=[" ", "Era re por ahi kingón!"],
  visuals=#{
    gameWinImage,
    new RawMessage(
      position= dynamicPositionFactory.createAtCenter(),
      text="Pulsa cualquier tecla para volver al inicio."
    )
  },
  configuration=configGameWin
){
  override method load(){
    super()
    self.playSound()
  }
  method playSound(){
    soundPool.stop()
    soundPool.playLevelWin()
  }
}

object gameWinImage inherits Visual(
  position=dynamicPositionFactory.create(11, 10)
){
  method image()="gameWin.png"
}