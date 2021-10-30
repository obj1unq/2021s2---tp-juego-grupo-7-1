import bullets.*

object bulletFactory{
  const property bullets = #{}
  
  method create(_position, _goesUp){
    const newBullet = new EnemyBullet( position = _position, goesUp = _goesUp)
    
    bullets.add(newBullet)
    return newBullet
  }
}
