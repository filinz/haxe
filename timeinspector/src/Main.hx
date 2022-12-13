package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.Assets;
import openfl.display.Bitmap;

/**
 * ...
 * @author filinz
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		trace("Okey");
		
		var bmp = new Bitmap(Assets.getBitmapData("img/pilot.png"));
		addChild(bmp);
	}

}
