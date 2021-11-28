import wollok.game.*

object soundPool {

  const property volume = 0.5
  const property heroShoot = game.sound("Sounds/HeroShoot.wav")
  const property enemyShoot = game.sound("Sounds/EnemyShoot.wav")
  var property shoot
  const property coalitionHero = game.sound("Sounds/HeroDestroy.wav")
  const property coalitionEnemy = game.sound("Sounds/EnemyDestroy.mp3")

  // SHOOT 
  method playShoot(shootSound) {
    self.play(shootSound, 1000)
  }

  method playShot() {
    self.play(shoot, 1000)
  }

  method heroShot() {
    shoot = heroShoot
  }

  method enemyShot() {
    shoot = enemyShoot
  }

  // COALITION
  method playCoalition(coalition) {
    self.play(coalition, 1000)
  }

//	method playCoalitionHero() {
//		const coalitionHero = game.sound("HeroDestroy.wav")
//		self.play(coalitionHero, 1000)
//	}
//	
//	method playCoalitionEnemy() {
//		const coalitionEnemy = game.sound("EnemyDestroy.mp3")
//		self.play(coalitionEnemy, 1000)
//	}	
  // WIN OR LOSE
  method playLevelWin() {
    const win = game.sound("LevelComplete.wav")
    self.play(win, 3000)
  }

  method playGameOver() {
    const gameOver = game.sound("GameOver.wav")
    self.play(gameOver, 1100)
  }

  method playLoseLife() {
    const loseLife = game.sound("EnemyDestroy.wav")
    self.play(loseLife, 3000)
  }

  // MENU SELECTOR 
  method playMenuSelect() { // CUANDO ESTAS EN EL MENU INICIAL
    const menuSelect = game.sound("MenuSelect.wav")
    self.play(menuSelect, 3000)
  }

  method playMenuSelect2() { // CUANDO ESTAS EN EL MENU PARA REINTENTAR
    const menuSelect2 = game.sound("MenuSelect2.wav")
    self.play(menuSelect2, 3000)
  }

  method playIntroLevel() { //
    const menuSelect2 = game.sound("MenuSelect2.wav")
    self.play(menuSelect2, 3000)
  }

  method playMenuSelected() {
    const selected = game.sound("Selected.mp3")
    self.play(selected, 3000)
  }

  // LEVELS
  method playLevel() {
    const level = game.sound("level.wav")
    self.mixVolumeAndLoop(level)
    game.schedule(100, { level.play()})
    keyboard.o().onPressDo({ level.stop()})
  }

  // CONFIG
  method play(sound, time) {
    sound.volume(volume)
    sound.play()
    game.schedule(time, { sound.stop()})
  }

  method playMenuMusic() {
    const track = game.sound("Menu.wav")
    self.mixVolumeAndLoop(track)
    game.schedule(100, { track.play()})
    keyboard.o().onPressDo({ track.stop()})
  }

  method mixVolumeAndLoop(sound) { //
    sound.volume(volume)
    sound.shouldLoop(true)
  }

  method volumeUp() {
    return 1.min(volume + 0.2)
  }

  method volumeDown() {
    return 0.max(volume - 0.2)
  }

}

