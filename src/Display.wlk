import visuals.Visual
import wollok.game.*

class Display {
	const property label
	var property rawMessage
	var property number
	
	method setup() {
		rawMessage.text(label) 
		rawMessage.setup()
		self.update()
	}
	method update()
	
	method getHeroBullet() {}
}

class NumberDisplay inherits Display {
	
	override method update() {
	  rawMessage.text(label + number.toString())
	}	
}

class LifeDisplay inherits NumberDisplay {
  
  const heart3 = new Life(position=self.HeartsPosition(3))
  const heart2 = new Life(position=self.HeartsPosition(2))
  const heart1 = new Life(position=self.HeartsPosition(1))
  const property hearts = [heart1, heart2, heart3]
  
  method HeartsPosition(position) {
  	return game.at(self.x_HeartsPosition(position),1)
  }
  
  method x_HeartsPosition(position) {
  	return rawMessage.position().x() + 3 + ((position - 1) * 2)
  }
  
  method lifesLeft() {
  	return hearts.take(number)
  }
  
  override method update() {
  	self.lifesLeft().forEach(
  		{heart => heart.add()}
  	)
  }
  
  method heartLoss() {
  	self.lifesLeft().last().remove()
  }
}

class Life inherits Visual {
  const image = "life.png"
  
  method image() { return image }
  
  override method add() {
  	if (not self.isOnScreen()) {
  		super()
  	}
  }

}