import wollok.game.*

object brocoli {
	var property position = game.at(self.mitadAncho() ,0)

	method image() = "brocoli.png"

	method mitadAncho() {
		return self.ancho() / 2
	}
	
	method ancho() {
		return game.width()
	}
	
	method alto() {
		return game.height()
	}
	
	method irA(nuevaPosicion) {
		if(nuevaPosicion.x().between(0, self.ancho() - 2)) { position = nuevaPosicion }
	}
	
	method disparar(bala) {
		config.movimientoDe(bala)
	}

}


class Bala {
	var property position = game.at(brocoli.position().x(), brocoli.position().y() + 1)

	method image() = "asparagus.png"

	method alto() {
		return game.height()
	}

	method removerDisparo(){
		game.removeTickEvent("MOVIMIENTO_DE_BALA")
		game.removeVisual(self)
	}

	method desplazar() {
		if(self.position().y() < self.alto()) {
			position = self.position().up(1)
		} else {
			self.removerDisparo()
		}
	}
}


object naveEnemiga {
	var mueveIzquierda = true
	var property position = game.center()		// lo centre para probar 
	const property limiteIzq = 0
	const property limiteDer = 48 

	method image() = "hotdog.png"
	
	method ancho() {
		return game.width()
	}
	
	method alto() {
		return game.height()
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
	
	method eliminar(bala){
		game.removeTickEvent("MOVIMIENTO_DE_BALA")
		game.removeVisual(bala)
		game.removeTickEvent("MOVIMIENTO_DE_ENEMIGO")
		game.removeVisual(self)
	}

}



object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ brocoli.irA(brocoli.position().left(1)) })
		keyboard.right().onPressDo({ brocoli.irA(brocoli.position().right(1)) })
		keyboard.space().onPressDo({ brocoli.disparar(new Bala()) })
	}
	
	method movimientoDe(bala){
		self.agregarYMover(bala)
	}
	
	method agregarYMover(bala){
		game.addVisual(bala)
		game.onTick(50, "MOVIMIENTO_DE_BALA" , {bala.desplazar()})	
	}

	method movimientoNaveEnemiga() {  
	    game.onTick(50, "MOVIMIENTO_DE_ENEMIGO", { naveEnemiga.mover() })
	}
	
	// Colision between enemy and bullet
	method configurarColision(bala) {
		game.onCollideDo(bala, { elemento => elemento.eliminar(bala) })
	}
}


