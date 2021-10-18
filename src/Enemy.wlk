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
  
  method receiveHit(){
//    console.println("colision")
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
  
  method die(){
    game.removeVisual(self)
    gameManager.increaseScore(award)  // Crear Score
  }
}