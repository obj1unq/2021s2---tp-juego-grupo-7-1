import wollok.game.*
import config.keyboard.configVoid
import extras.rawMessage

class Moment {
  const titulo
  const background = "background.jpg"
  const property visuals = #{}
  const configuration = configVoid
  
  method load(){
    self.setBackground()
    self.addVisuals()
    self.addTitle()
    self.configure()
  }
  
  /** -----------------------------------------------------
   * Private Methods
   */
  method setBackground(){ game.boardGround(background) }
  method configure(){ configuration.configMoment(self) }
  method addVisuals(){ self.visuals().forEach({visual=>visual.add()}) }
  method addTitle(){
    var titleString = ""
    titulo.forEach({line=>titleString=titleString+line+"\n"})
    rawMessage.text(titleString)
  }
}