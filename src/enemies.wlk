import wollok.game.*
import visuals.Visual
import bullets.*
import extras.Anchor
import gameManager.gameManager
import positions.*

class Enemy inherits Visual {

//  const property goesUp = false
  const property award = 1
  var property life = 2
  var property anchor = null
  var property xOffset
  var property yOffset
//  var firstShotDone = false

  method image() = "hotdog.png"

  override method position() {
    return dynamicPositionFactory.create(
      anchor.position().x() + xOffset,
      anchor.position().y() + yOffset
    )
  }

  override method add() {
    super()
    self.activate()
  }

  override method activate() {
  	self.activateShooting()
  }
  
  method activateShooting() {
  	self.activate({ self.shoot() },7000,21000)
  }
  
  method activate(attack, minTime, maxTime) {
  	const time = self.attackDelay(minTime, maxTime)
  	self.attack(time, attack)
  }
  
  method attack(time, attack) {
  	if (game.hasVisual(self)) {
    	self.activateAttack(time, attack)
    	game.schedule(time, { self.activate() } )
 	}
  }

  method receiveHit() {
    self.lifeDecrease()
  }

  method lifeDecrease() {
    if (life > 1) {
      life -= 1
    } else {
      self.die()
    }
  }

  method shoot() { 
  	if (bulletsFactory.bulletsOnScreen() < 5) {
    	const bullet = bulletsFactory.createEnemyBullet(self.position().translated(0, -1))
    	bullet.shoot()
   	}
  }


  method die() {
    self.remove()
    gameManager.increaseScore(award)
  }
  
  method remove() {
  	game.removeVisual(self)
  }

}

class Private inherits Enemy(award = 1, life = 1) {
  override method move(){}
}

class Kamikaze inherits Enemy(award = 2, life = 2) {

  var onBanzai = false
  var banzaiXY = null
  var attackCounter = 0

  override method image() = "mcdonalds.png" // agregar imagen enemiga

  override method position() {
  	if (onBanzai) {
  		return banzaiXY
  	} else {
  		super()
  	}
  }

  method banzai() {
    banzaiXY = self.position()
    onBanzai = true
    life = 1
    
    game.onTick(100, "BANZAI" + self.identity().toString(), { self.move()})
  }
  
  override method activate() {
  	if (attackCounter < 5) {
  		self.activateShooting() 
  	} else if (not onBanzai){
	self.activateRandomAttack() 
	}
	attackCounter += 1
  }
  
  method activateRandomAttack() {
  	const selector = (1..5).anyOne()
  	  	if (selector==1) {
  		self.activateBanzai()
  	} else {
  		self.activateShooting()
  	}
  }
  
  method activateBanzai() {
  	self.activate({ self.banzai() },20000,60000))
  }

  override method move() {
    if (self.isInsideSafeArea()) {
      self.position().moveDown(1)
    } else {
      game.removeTickEvent("BANZAI" + self.identity().toString())
      self.remove()
    }
  }

}

class VoidEnemy{
  method anchor(_anchor){}
  method add(){}
}
