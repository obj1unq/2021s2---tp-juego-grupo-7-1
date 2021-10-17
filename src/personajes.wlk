import wollok.game.*


// TODO: Modificar el nombre a 'Movil'
class Visual{
	method boot(){
	}
	
	// TODO: Evaluar que esta clase tenga los metodos de los movimientos delimitados.
	
  	// TODO: Eventualmente cambiar el nombre de los métodos 
  	// y tratar de ubicarlos en un objeto mas abstracto (Objeto area (? )
  	
  method width() = game.width() 
	method height() = game.height()
	method xCenter() = self.width() / 2
	
}

//object heroShip inherits Visual{
//	var property position = game.at(self.xCenter(), 0)
//
//	method image() = "brocoli.png"
//	
//	method goTo(newPosition) {
//		if(newPosition.x().between(0, self.width() - 2)) { position = newPosition }
//	}
//	
//	method shoot() {
//	  const bullet = new Bullet( position = self.position().up(1) ) 
//	  bullet.shoot()
//	}
//
//}


class Bullet inherits Visual{
	var property position 

	method image() = "asparagus.png"
	
	method remove(){
		game.removeTickEvent("BULLET_MOVEMENT" + self.identity().toString())
		game.removeVisual(self)
	}

	method move() {
		if(self.position().y() < self.height()-4) {
			position = self.position().up(1)
		} else {
			self.remove()
		}
	}
	
	method shoot(){
	  game.addVisual(self)
	  game.onTick(50, "BULLET_MOVEMENT" + self.identity().toString(), {self.move()})
	  game.onCollideDo(self, 
	  	{ 
	  		target => 	target.getHit()
	  					self.remove()
	  	}
	  )  
	}
	override method boot(){}	
}
/* 
class Enemy inherits Visual{
	// Propiedades de la Flota
	var property anchor
 	var property xDelta
  	var property yDelta
  	
  	// Propiedades de la nave
  	const property award
  	var property life
  	
  	method image() = "hotdog.png"
  	
	method position(){
		return game.at(
	      anchor.position().x()+xDelta,
	      anchor.position().y()+yDelta
	    )
	}
	
	method getHit(){
	  console.println("colision")
	  	if(life > 1) { 
	  		life -=1 
	  	} else {
			game.removeTickEvent("ENEMY_MOVEMENT" + self.identity().toString())
			game.removeVisual(self)
		}
	}
}

*/
object naveEnemiga inherits Visual{
	var mueveIzquierda = true
	var property position = game.center()		// lo centre para probar 
	const property limiteIzq = 0
	const property limiteDer = 48 

	method image() = "hotdog.png"
	
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
	
	method getHit(){
	  console.println("colision")
		game.removeTickEvent("MOVIMIENTO_DE_ENEMIGO")
		game.removeVisual(self)
	}
  
  override method boot(){
    game.onTick(50000, "MOVIMIENTO_DE_ENEMIGO", { self.mover() })
  }
}

*/
