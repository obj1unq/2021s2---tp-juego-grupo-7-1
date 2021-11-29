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
class PDC_CompositeVisual inherits Moment(title = [ "PDC", "Probando Objeto Compuesto" ], configuration = configPDCObjetoCompuesto) {

  const property heroShip = new HeroShip()

  override method visuals() = #{ heroShip }

  override method load() {
    super()
    bulletsMover.activate()
    kamikazeMover.activate()
  }
}