import wollok.game.*
import bulletFactory.*
import bullets.*


object bulletsMover{
//  var counter = 0
  method activate(){
    game.onTick(
    	50, 
    	"BULLET_MOVER", 
    	bulletFactory.bullets().forEach(
    		{ 
    			bullet => bullet.move()
    		}
    	)
    )
  }
}