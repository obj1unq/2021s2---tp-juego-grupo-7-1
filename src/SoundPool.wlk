import wollok.game.*

object soundPool {

	// CONFIG

	method play(sound, time) {
		sound.volume(0.5)
		sound.play()
		game.schedule(time,{sound.stop()})
	}
		
	method playMenuMusic() {
		const track = game.sound("Menu.wav") 
		self.mixVolumeAndLoop(track)
		game.schedule(100,{track.play()})
		keyboard.o().onPressDo({track.stop()})
	}
	method mixVolumeAndLoop(sound) {//
		sound.volume(0.5)
		sound.shouldLoop(true)
	}
	
	method controlVolume(sound){ //Deberia guardar el sound en una variable y evitar parametro?
 		keyboard.k().onPressDo({ 0.max(sound.volume() - 0.2) })
   		keyboard.l().onPressDo({ 1.min(sound.volume() + 0.2)})  
	} // PARA CONTROLAR EL VOLUMEN EN EL JUEGO , DEBERIA IR EN EL CONFIG? 
	
	// SHOOT 
	
	method playShootHero() { 
		const shootHero = game.sound("HeroShoot.wav")
		self.play(shootHero, 1000)
	}
	
	method playEnemyShoot() {
		const shootEnemy = game.sound("EnemyShoot.wav")
		self.play(shootEnemy, 1000)
	}
	
	// COALITION
	
	method playCoalitionHero() {
		const coalitionHero = game.sound("HeroDestroy.wav")
		self.play(coalitionHero, 1000)
	}
	
	method playCoalitionEnemy() {
		const coalitionEnemy = game.sound("EnemyDestroy.mp3")
		self.play(coalitionEnemy, 1000)
	}	
	
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
	
	method playMenuSelect() {// CUANDO ESTAS EN EL MENU INICIAL
		const menuSelect = game.sound("MenuSelect.wav")
		self.play(menuSelect, 3000)
	}
	method playMenuSelect2() {// CUANDO ESTAS EN EL MENU PARA REINTENTAR
		const menuSelect2 = game.sound("MenuSelect2.wav")
		self.play(menuSelect2, 3000)
	}
	method playIntroLevel() {//
		const menuSelect2 = game.sound("MenuSelect2.wav")
		self.play(menuSelect2, 3000)
	}
	method playMenuSelected() {
		const selected = game.sound("Selected.mp3")
		self.play(selected, 3000)
	}
	
	// LEVELS
	
	method playBossLevel() {
		const bossLevel = game.sound("BossMenu.wav")
		self.mixVolumeAndLoop(bossLevel)
		game.schedule(100,{bossLevel.play()})
		keyboard.o().onPressDo({bossLevel.stop()})
		
	}
	method playLevel() {
		const level = game.sound("level.wav")
		self.mixVolumeAndLoop(level)
		game.schedule(100,{level.play()})
		keyboard.o().onPressDo({level.stop()})
	}
}