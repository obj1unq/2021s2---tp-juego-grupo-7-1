import wollok.game.*
import config.settings.settings

object soundPool {
  var property volume = 0.2
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
    if(settings.PLAY_SOUNDS()){
      music.stop()    
    }
  }

  method play(sound, time) {
    if(settings.PLAY_SOUNDS()){
      sound.volume(volume)
      sound.play()
    }
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
  const property collisionFile
  const property shootFile
  
  method playCollision(){
    const s = game.sound(self.collisionFile())
    if(settings.PLAY_SOUNDS()){
      s.play()      
    }
  }
  method playShoot(){
    const s = game.sound(self.shootFile())
    if(settings.PLAY_SOUNDS()){
      s.play()      
    }
  }
}

object enemySounds inherits CharacterSound(
  shootFile="sounds/enemyShoot.mp3",
  collisionFile="sounds/enemyDestroy.mp3"
){}

object heroSounds inherits CharacterSound(
  shootFile = "sounds/heroShoot.mp3",
  collisionFile = "sounds/heroDestroy.mp3"
){}
