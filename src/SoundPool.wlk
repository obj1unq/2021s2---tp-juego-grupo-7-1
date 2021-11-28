import wollok.game.*

object soundPool {

  var property volume = 0.5
  var property music = game.sound("sounds/menu.mp3")

  // WIN OR LOSE
  method playLevelWin() {
    const win = game.sound("sounds/levelComplete.mp3")
    music = win
    self.play(win, 1000)
  }

  method playGameOver() {
    const gameOver = game.sound("sounds/gameOver.mp3")
    music = gameOver
    self.play(gameOver, 1000)
  }

  method playLoseLife() {
    const loseLife = game.sound("sounds/enemyDestroy.mp3")
    music = loseLife
    self.play(loseLife, 3000)
  }

  // MENU SELECTOR 
  method playMenuSelect() { // CUANDO ESTAS EN EL MENU INICIAL
    const menuSelect = game.sound("sounds/menuSelect.mp3")
    music = menuSelect
    self.play(menuSelect, 3000)
  }

  method playMenuSelect2() { // CUANDO ESTAS EN EL MENU PARA REINTENTAR
    const menuSelect2 = game.sound("sounds/menuSelect2.mp3")
    music = menuSelect2
    self.play(menuSelect2, 3000)
  }

  method playIntroLevel() { //
    const menuSelect2 = game.sound("sounds/menuSelect2.mp3")
    music = menuSelect2
    self.play(menuSelect2, 3000)
  }

  method playMenuSelected() {
    const selected = game.sound("sounds/selected.mp3")
    music = selected
    self.play(selected, 3000)
  }

  // LEVELS 
  method playLevel() {
    const level = game.sound("sounds/level.mp3")
    music = level
    self.mixVolumeAndLoop(level)
    game.schedule(100, { level.play()})
    keyboard.o().onPressDo({ level.stop()})
  }

  // CONFIG
  method stop() {
    music.stop()
  }

  method play(sound, time) {
    sound.volume(volume)
    sound.play()
  // game.schedule(time,{sound.stop()})
  }

  method playMenuMusic() {
    const track = game.sound("sounds/menu.mp3")
    music = track
    self.mixVolumeAndLoop(track)
    game.schedule(100, { track.play()})
    keyboard.o().onPressDo({ track.stop()})
  }

  method mixVolumeAndLoop(sound) { //
    sound.volume(volume)
    sound.shouldLoop(true)
  }

  method volumeUp() {
    volume = 1.min(volume + 0.2)
    music.volume(volume)
  }

  method volumeDown() {
    volume = 0.max(volume - 0.2)
    music.volume(volume)
  }

}

class CharacterSound {

  method shoot()

  method coalition()

}

object enemySounds inherits CharacterSound {

  const property enemyShoot = game.sound("sounds/enemyShoot.mp3")
  const property coalitionEnemy = game.sound("sounds/enemyDestroy.mp3")

  override method shoot() {
    soundPool.play(enemyShoot, 1000)
  }

  override method coalition() {
    soundPool.play(coalitionEnemy, 1000)
  }

}

object heroSounds inherits CharacterSound {

  const property heroShoot = game.sound("sounds/heroShoot.mp3")
  const property coalitionHero = game.sound("sounds/heroDestroy.mp3")

  override method shoot() {
    soundPool.play(heroShoot, 1000)
  }

  override method coalition() {
    soundPool.play(coalitionHero, 1000)
  }

}

