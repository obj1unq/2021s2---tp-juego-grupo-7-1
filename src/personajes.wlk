import wollok.game.*
import Visual.Visual
import bullets.Bullet
import Anchor.Anchor
import gameManager.gameManager

object heroShipIndividual inherits Visual(position = self.startPosition()){ //nombre provisorio
	var property life = 3

	method image() = "brocoli.png"
	
	method initialize() {
		game.onCollideDo(self, 
		  	{ 
		  		console.println("se para el juego")
		  	}
		)  
	}
	
	method startPosition() {
		return game.at(25, 1)
	}
	
	method goTo(newPosition) {
		if(newPosition.x().between(0, game.width() - 2)) { position = newPosition }
	}
	
	method shoot() {
	  const bullet = new Bullet( position = self.position().up(1) ) 
	  bullet.shoot()
	}
	
	method receiveHit(Harmless){
  	  if (not Harmless) {
  	  	self.lifeDecrease()
  	  }
  }
  
  method lifeDecrease() {
      if(life > 1) { 
        life -=1 
      } else {
      self.die()
  }
	
	method die() { 
		console.println("la quedé")
	}

}



 










/*
object naveEnemiga inherits Visual{
	var mueveIzquierda = true
	var property position = game.center()		// lo centre para probar 
	const property limiteIzq = 0
	const property limiteDer = 48 

	method image() = "hotdog.png"
	override method initialize(){
	  game.onTick(50000, "MOVIMIENTO_DE_ENEMIGO", { self.mover() })
	}
	
	method puedeMoverIzquierda() {
		return self.position().x() > limiteDer or mueveIzquierda
	}
	
	method puedeMoverDerecha() {
		return self.position().x() < limiteIzq or not mueveIzquierda
	}
	
	method mover() {
		if(self.puedeMoverIzquierda()) { 
			position = self.position().left(1)
			mueveIzquierda = true
		}
		if (self.puedeMoverDerecha()){
			position = self.position().right(1)
			mueveIzquierda = false			
		}
	}
	
	method receiveHit(){
	  console.println("colision")
		game.removeTickEvent("MOVIMIENTO_DE_ENEMIGO")
		game.removeVisual(self)
	}
  
}

*/