import wollok.game.*
import extras.*
import config.*

class Moment {
  const titulo
  const background = "background.jpg"
  const visuals = #{}
  const configuration = configVoid
  // ---------------------------------------
  
  method initialize(){
    self.setBackground()
    self.configure()    
    self.addVisuals()
    self.addTitle()
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