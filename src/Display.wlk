import visuals.Visual.Visual
import wollok.game.*
import extras.RawMessage

class Display {
	const property label
	const position
	var property numberValue
	var property rawMessage = null
	
	method setup() {
	  rawMessage = new RawMessage(position=position)
		rawMessage.text(label) 
		rawMessage.setup()
		self.update()
	}
	method update()
	method getHeroBullet(){}
}

class NumberDisplay inherits Display {
	override method update() {
	  rawMessage.text(label + numberValue.strValue())
	}	
}

class LifeDisplay inherits NumberDisplay {
  const property hearts = []
  
  override method setup(){
    super()
    self.setupHearts()
  }
  method lifesLeft() {
  	return hearts.take(numberValue.value())
  }
  
  override method update() {
  	self.lifesLeft().forEach(
  		{heart => heart.add()}
  	)
  }
  
  method heartLoss() {
  	self.lifesLeft().last().remove()
  }
  /** Privates -------------------------------------------------------------- */
  method setupHearts(){
    const heart1 = new Life(position=self.heartsPosition(1))
    const heart2 = new Life(position=self.heartsPosition(2))
    const heart3 = new Life(position=self.heartsPosition(3))
    hearts.add(heart1)
    hearts.add(heart2)
    hearts.add(heart3)
  }
  method heartsPosition(position) {
    return game.at(self.x_HeartsPosition(position),1)
  }
  method x_HeartsPosition(position) {
    return rawMessage.position().x() + 3 + ((position - 1) * 2)
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