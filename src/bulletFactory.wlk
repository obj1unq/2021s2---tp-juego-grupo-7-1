object bulletFactory{
  const bullets = #{}
  
  method create(_position, isEnemy){
    const bullet = new EnemyBullet( position = _position, goesUp = !isEnemy )
    bullets.add(bullet)
    return bullet
  }
}
