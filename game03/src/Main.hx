package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;

/**
 * Robin Hood
 * @author filinz
 */
class Main extends Sprite 
{

	var titleScreen:TitleScreen;
	var game:Game;
	var shopScreen:ShopScreen;
	
	public function new() 
	{
		super();
		
		titleScreen = new TitleScreen();
		titleScreen.addEventListener("CLICKED", startGame); 
		addChild(titleScreen);
		titleScreen.visible = true;
		
		shopScreen = new ShopScreen();
		shopScreen.addEventListener("SHOPFINISHED", startGame); 
		addChild(shopScreen);
		shopScreen.visible = false;
		
	}

	public function startGame(e:Event) {
		//trace("game started");
		if (contains(titleScreen)) {
			removeChild(titleScreen);
		}

		shopScreen.visible = false;
		
		game = new Game();
		game.addEventListener("GAMEOVER", gameOver);
		addChild(game);
		
	}
	
	public function gameOver(e:Event) {
		if (contains(game)) {
			removeChild(game);
		}
		game.removeEventListener("GAMEOVER", gameOver);
		game.destroy();
		game = null;
		
		shopScreen.visible = true;
	}
}
