import wollok.game.*


class Visual{
  /**
   * NOTE: Visual childs must use add() method to be added to the, instead of
   * the direct "game.add(...)". This allows polymorphic functionallities to
   * both native and CompositeVisuals objects.
   */
  
  // TODO: Evaluar que esta clase tenga los metodos de los movimientos delimitados.
  
  // TODO: Eventualmente cambiar el nombre de los métodos 
  // y tratar de ubicarlos en un objeto mas abstracto (Objeto area (? )
  var property position = game.center()
  method add(){
    game.addVisual(self)
  } 
}