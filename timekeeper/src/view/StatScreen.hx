package view;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;

class StatScreen extends Screen
{
	var bmpBackground:Bitmap;
	
	public function new() {
		super();
		
		bmpBackground = outBmp(0, 0, "statscreen.png");
		addChild(bmpBackground);

	}
	
}