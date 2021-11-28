import wollok.game.*
import config.keyboard.configPDCObjetoCompuesto
import gameManager.gameManager
import moments.Moment.Moment
import HeroShip.*
import bullets.bulletsMover.bulletsMover
import enemies.kamikazeMover.kamikazeMover
import SoundPool.soundPool

/**
 * PROVISORIOS
 */
class PDC_CompositeVisual inherits Moment(
  titulo=["PDC", "Probando Objeto Compuesto"],
  configuration=configPDCObjetoCompuesto
){
  const property heroShip = new HeroShip()
  override method visuals() = #{heroShip}
  override method load(){
    super()
    bulletsMover.activate()
    kamikazeMover.activate()
  }
}

object gameTitle inherits Moment(
  titulo=["TITULO_JUEGO", "¡¡SPACE INVADERS!!"]
){
 override method load(){
 	 
    super()
    self.playSound()
  }
  method playSound(){
		soundPool.playMenuMusic()
  }

}
class GameCover inherits Moment(
  titulo=["PRESENTACIÓN NIVEL", "Nivel " + gameManager.levelNumber().toString()]
){
  override method load(){
  	 
    super()
    soundPool.stop()
    self.playSound()
  }
  method playSound(){
		soundPool.playLevel()
  }
}
object gameOver inherits Moment(
  titulo=["FINAL_JUEGO", "A tu casa rey"]
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
object credits inherits Moment(
  titulo=["CREDITOS", "Muy rico todo"]
){
	
}