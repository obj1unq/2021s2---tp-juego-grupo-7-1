import visuals.Visual.Visual
import wollok.game.*
import extras.RawMessage

class Display {
	const property label
	const position
	var property rawMessage = null
	
	method setup(value) {
	  rawMessage = new RawMessage(position=position)
		rawMessage.text(label) 
		rawMessage.setup()
		self.update(value)
	}
	method update(value)
	method getHeroBullet(){}
}

class NumberDisplay inherits Display {
	override method update(value) {
	  rawMessage.text(label + value.toString())
	}	
}

class LifeDisplay inherits NumberDisplay {
  const property hearts = []
  var lastValue = null
  
  override method setup(value){
    super(value)
    self.setupHearts()
    lastValue=value
  }
  method heartsSlice(value) {
  	return hearts.take(value)
  }
  
  override method update(value) {
  	self.heartsSlice(value).forEach(
  		{heart => heart.add()}
  	)
  	lastValue=value
  }
  
  method heartLoss() {
  	self.heartsSlice(lastValue).last().remove()
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