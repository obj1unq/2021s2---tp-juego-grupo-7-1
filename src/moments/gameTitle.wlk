import wollok.game.*
import moments.Moment.Moment
import config.keyboard.configGameTitle
import SoundPool.soundPool
import positions.dynamicPositionFactory
import visuals.Visual.Visual
import extras.RawMessage

object gameTitle inherits Moment(
  title=[" "],
  configuration=configGameTitle,
  visuals=#{new RawMessage(
  	position=dynamicPositionFactory.create(24, 26),
  	text="Presione cualquier tecla para continuar"
  ),gameTitleImage} 
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
  override method add(){
    super()
  }
}