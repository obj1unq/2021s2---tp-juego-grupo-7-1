import wollok.game.*

class Visual{
  method boot(){}
}

object brocoli inherits Visual{
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
	
	method disparar() {
	  const bala = new Bala()
	  bala.dispararse()
	}

}


class Bala inherits Visual{
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
		if(self.position().y() < self.alto()-4) {
			position = self.position().up(1)
		} else {
			self.removerDisparo()
		}
	}
	method dispararse(){
	  game.addVisual(self)
	  game.onTick(50, "MOVIMIENTO_DE_BALA" , {self.desplazar()})
	  game.onCollideDo(self, { elemento => elemento.eliminar(self) })  
	}
	override method boot(){}
}


object naveEnemiga inherits Visual{
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
	
	method eliminar(_bala){
	  console.println("colision")
		game.removeTickEvent("MOVIMIENTO_DE_BALA")
		game.removeVisual(_bala)
		game.removeTickEvent("MOVIMIENTO_DE_ENEMIGO")
		game.removeVisual(self)
	}
  
  override method boot(){
    game.onTick(50, "MOVIMIENTO_DE_ENEMIGO", { self.mover() })
  }
}


