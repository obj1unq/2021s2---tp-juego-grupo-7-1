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

	method height() {
		return game.height()
	}

	method removerDisparo(){
		game.removeTickEvent("MOVIMIENTO_DE_BALA")
		game.removeVisual(self)
	}

	method desplazar() {
		if(self.position().y() < self.height()) {
			position = self.position().up(1)
		} else {
			self.removerDisparo()
		}
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
		game.onTick(200, "MOVIMIENTO_DE_BALA" , {bala.desplazar()})	
	}


}


