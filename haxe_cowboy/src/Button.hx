package;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.display.Bitmap;

import openfl.Assets;

class Button extends Sprite
{

	public function new(x:Int, y:Int, name:String ) 
	{
		super();
		
		this.x = x;
		this.y = y;
		
		var bmp:Bitmap = new Bitmap();
		bmp.bitmapData = Assets.getBitmapData("img/button.png");
		addChild(bmp);
		
		useHandCursor = true;
		buttonMode = true;
		
		var textField = new TextField();
		var textFormat = new TextFormat();
		
		textFormat.font = "Arial";
		textFormat.color = 0x000000;
		textFormat.size = 18;
		textFormat.bold = true;
		textFormat.align = "center";

		textField.mouseEnabled = false;
		textField.width = this.width;
		textField.defaultTextFormat = textFormat;
		textField.text = name;
		textField.y = 18;
		
		addChild(textField);
	}
	
}