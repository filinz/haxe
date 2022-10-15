package;

import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 */
class Main extends Sprite 
{
	public var game:Game;
	
	public function new() {
		super();
		
		game = new Game();
		addChild(game);
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
	}

}
