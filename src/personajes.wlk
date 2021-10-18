import wollok.game.*


// TODO: Modificar el nombre a 'Movil'
class Visual{
  /**
   * NOTE: Visual childs must use add() method to be added to the, instead of
   * the direct "game.add(...)". This allows polymorphic functionallities to
   * both native and CompositeVisuals objects.
   */
	
	// TODO: Evaluar que esta clase tenga los metodos de los movimientos delimitados.
	
	// TODO: Eventualmente cambiar el nombre de los métodos 
	// y tratar de ubicarlos en un objeto mas abstracto (Objeto area (? )
  method add(){
    game.addVisual(self)
  }	
}

object heroShipIndividual inherits Visual{ //nombre provisorio
	var property position = self.startPosition()
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
		return game.at(game.width()/2, 0)
	}
	
	method goTo(newPosition) {
		if(newPosition.x().between(0, game.width() - 2)) { position = newPosition }
	}
	
	method shoot() {
	  const bullet = new Bullet( position = self.position().up(1) ) 
	  bullet.shoot()
	}
	
	method receiveHit(){
//	  console.println("colision")
	  	if(life > 1) { 
	  		life -=1 
	  	} else {
			self.die()
		}
	}
	
	method die() { 
		console.println("la quedé")
	}

}


class Bullet inherits Visual{
	var property position 

	method image() = "asparagus.png"
	
	method initialize() {
			  self.add()
	}
	
	method remove(){
		game.removeTickEvent("BULLET_MOVEMENT" + self.identity().toString())
		game.removeVisual(self)
	}

	method move() {
		if(self.position().y() < game.height()-4) { // reveer el area
			position = self.position().up(1)
		} else {
			self.remove()
		}
	}
	
	method shoot(){
	  game.onTick(50, "BULLET_MOVEMENT" + self.identity().toString(), {self.move()})
	  game.onCollideDo(self, 
	  	{ 
	  		target => 	target.receiveHit()
	  					self.remove()
	  	}
	  )  
	}
	
	method receiveHit() {
		self.remove()
	}
}
 
class Enemy inherits Visual{
	// Propiedades del Coreografo
	var property anchor = new Anchor()
 	var property xOffset
  	var property yOffset
  	
  	// Propiedades de la nave
  	const property award
  	var property life = 2
  	
  	method image() = "hotdog.png"
  	
	method position(){
		return game.at(
	      anchor.position().x()+xOffset,
	      anchor.position().y()+yOffset
	    )
	}
	
	method receiveHit(){
//	  console.println("colision")
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

class Kamikaze inherits Enemy{
	var onBanzai = false
	var banzaiX
	
  	override method image() = "hotdog.png" //agregar imagen enemiga
	
	override method position() {
		if (not onBanzai)  { 
			return game.at(
	      		anchor.position().x()+xOffset,
	      		anchor.position().y()+yOffset
	    	) 
	    } else {
	    	return game.at(
	      		banzaiX,
	      		anchor.position().y()+yOffset
	    	) 
	    }	
	}
	
	method banzai(){
		onBanzai = true
		banzaiX = self.position().x() 
		life = 1
		game.onTick(50, "ENEMY_MOVEMENT" + self.identity().toString(), {self.move()})
	  	game.onCollideDo(self, 
	  			{ 
	  				target => 	target.receiveHit()
	  							self.die()
	  			}
	  		)	
	}	
	
	method move() {
		if(self.position().y() > 0) {
			position = self.position().down(1)
		} else {
			self.remove()
		}
	}
	
	method remove() {
		game.removeTickEvent("ENEMY_MOVEMENT" + self.identity().toString())
		game.removeVisual(self)
	}
}

class EnemyBullet inherits Bullet{
	const award = 10

	override method image() = "asparagus.png" // agregar imagen de tiro enemigo ".png" 
	

	override method move() {
		if(self.position().y() > 0) {
			position = self.position().down(1)
		} else {
			self.remove()
		}
	}
	
	override method receiveHit() {
		gameManager.increaseScore(award)  // Crear Score
		self.remove()
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