import wollok.game.*
import config.configVoid
import extras.rawMessage

class Moment {
  const titulo
  const background = "background.jpg"
  const visuals = #{}
  const configuration = configVoid
  
  method load(){
    self.setBackground()
    self.addVisuals()
    self.addTitle()
    self.configure()
  }
  
  method setBackground(){ game.boardGround(background) }
  method configure(){ configuration.configMoment(self) }
  method addVisuals(){ visuals.forEach({visual=>visual.add()}) }
  method addTitle(){
    var titleString = ""
    titulo.forEach({line=>titleString=titleString+line+"\n"})
    rawMessage.text(titleString)
  }
}