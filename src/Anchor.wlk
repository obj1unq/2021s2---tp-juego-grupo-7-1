import wollok.game.*

class Anchor{
  var property position
  
  method position(_posicion){
    // asigna la posición del objeto, sin modificar otros atributos del estado.
    position = _posicion
  }
  method irA(nuevaPosicion) {
    // si bien parece igual al setter de position,
    // este puede incluir lógica de movimiento.
    position = nuevaPosicion
  }
  method image() {
    return "px-void.png"
  }
}