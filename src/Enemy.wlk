import wollok.game.*
import Visual.Visual
import bullets.*
import Anchor.Anchor
import gameManager.gameManager

class Enemy inherits Visual{
  const property award = 1
  var property life = 2
  
  var property anchor
  var property xOffset
  var property yOffset
  
  method image() = "hotdog.png"
  
  override method position(){
    return game.at(
      anchor.position().x()+xOffset,
      anchor.position().y()+yOffset
    )
  }
  
  override method add(){
    super()
    self.activate()
  } 
  
  method activate(){
    self.activateAttack()
  }
  
  method receiveHit(){
//    console.println("colision")
// podriamos agregar un validar disparo que compruebe si el disparo le tendria q hacer danio, remover o nada.
// con darle una orientacion a la bala (arriba y abajo) segun quien dispare si hero o enemy?
// si tiene la misma orientacion no tendria que restar vidas (?)
      if(life > 1) { 
        life -=1 
      } else {
      self.die()
    }
  }
 
  method shoot(){
      const bullet = new EnemyBullet( position = self.position().down(1) ) 
      bullet.shoot()
  }
  method nextShootDelay(){
    // TODO: acá puede haber una lógcia de firstShotDelay y nextShot ordinario
    return 10000.randomUpTo(50000)
  }
  
  method die(){
    game.removeVisual(self)
    self.removeShotTickEvent()
    gameManager.increaseScore(award)  // Crear Score
  }
  method activateAttack(){
    game.onTick(
      self.nextShootDelay(),
      "NEXT_SHOT_DELAY" + self.identity().toString(),
      {
        self.shoot()
        self.resetAttack()
      }
    )
  }
  method resetAttack(){
    self.removeShotTickEvent()
    self.activateAttack()
  }
  method removeShotTickEvent(){
    game.removeTickEvent("NEXT_SHOT_DELAY" + self.identity().toString())    
  }
}