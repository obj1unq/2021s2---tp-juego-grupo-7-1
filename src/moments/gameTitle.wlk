import wollok.game.*
import moments.Moment.Moment
import config.keyboard.configGameTitle
import SoundPool.soundPool
import positions.dynamicPositionFactory
import visuals.Visual.Visual

object gameTitle inherits Moment(
  title=[" ", " ", "", "Presione cualquier tecla para continuar"],
  configuration=configGameTitle,
  visuals=#{gameTitleImage}
){
  override method load(){
    super()
    self.playSound()
  }
  method playSound(){
    soundPool.playLevel()
  }
}

object gameTitleImage inherits Visual(position=dynamicPositionFactory.create(0, 0)){
  method image()="gameCoverOK.png"
}