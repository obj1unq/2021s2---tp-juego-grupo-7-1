import extras.*

class Momento {
//  const background = ""
  const nombre
  // soundtrack ??
  
//  method inicializar(){self.error("No implementado")}
  method inicializar(){
    mensaje.text(nombre)
    console.println(nombre)
  }
}

object tituloJuego inherits Momento(nombre="[TITULO_JUEGO]\n¡¡SPACE INVADERS!!"){}
object presentacionNivel inherits Momento(nombre="[PRESENTACION_NIVEL]\nNivel xxx"){}
object juego inherits Momento(nombre="[JUEGO]\nJuego..."){}
object finalJuego inherits Momento(nombre="[FINAL_JUEGO]\nGame over"){}
object creditos inherits Momento(nombre="[CREDITOS]\nMuy rico todo"){}