import bullets.*

object bulletFactory{
  const property bullets = #{}
  
  method create(_position, _goesUp){
    const bullet = new EnemyBullet( position = _position, goesUp = _goesUp)
    bullets.add(bullet)
    return bullet
  }
}
