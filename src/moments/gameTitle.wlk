import moments.Moment.Moment
import config.keyboard.configGameTitle


object gameTitle inherits Moment(
  title=["TITULO_JUEGO", "¡¡SPACE INVADERS!!", "", "Presione cualquier tecla para continuar"],
  configuration=configGameTitle
){}