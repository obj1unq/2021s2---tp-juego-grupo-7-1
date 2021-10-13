class Nivel{
  method cargarEnemigos(){
    
  }
}

object r{}
object k{}
object _{}

object nivel1 inherits Nivel{
  method formacionEnemiga(){
    return [
      [_, r, k, _, _, k, r, _],
      [_, r, k, r, r, k, r, _],
      [_, r, r, r, r, r, r, _],
      [_, _, r, k, k, r, _, _],
      [_, _, _, r, r, _, _, _]
    ]
  }
}