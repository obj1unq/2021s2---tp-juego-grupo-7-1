import moments.Moment.Moment
import config.keyboard.configGameTitle
import SoundPool.soundPool

object gameTitle inherits Moment(
  title=["TITULO_JUEGO", "¡¡SPACE INVADERS!!", "", "Presione cualquier tecla para continuar"],
  configuration=configGameTitle
){
  override method load(){
   
    super()
    self.playSound()
  }
  method playSound(){
    soundPool.playMenuMusic()
  }
}