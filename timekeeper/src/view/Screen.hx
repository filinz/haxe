package view;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;

class Screen extends Sprite 
{

	public function new() 
	{
		super();
		
		this.visible = false;
		
	}
	
	public function outText(x:Int, y:Int, text:String, style:String):TextField {
		
		var textField = new TextField();
		var textFormat = new TextFormat();
		
		switch style {
			case "date": {
				textFormat.font = "Arial";
				textFormat.color = 0xffff66;
				textFormat.size = 24;
				textFormat.bold = false;
				//textFormat.align = "center";
			}
			case "clock": {
				textFormat.font = "Arial";
				textFormat.color = 0xffffff;
				textFormat.size = 32;
				textFormat.bold = true;
				//textFormat.align = "center";
			}
			case "tab": {
				textFormat.font = "Arial";
				textFormat.color = 0xffff00;
				textFormat.size = 16;
				textFormat.bold = true;
				//textFormat.align = "center";
			}
			default: {
				textFormat.font = "Arial";
				textFormat.color = 0x000000;
				textFormat.size = 12;
				textFormat.bold = false;
				//textFormat.align = "center";
			}
		}
		
		textField.mouseEnabled = false;
		textField.width = this.width;
		textField.defaultTextFormat = textFormat;
		textField.text = text;
		textField.x = x;
		textField.y = y;
		
		addChild(textField);
		
		return textField;
		
		
	}
	
	
	public function outBmp(x:Int, y:Int, fileName:String):Bitmap {
		var bmp = new Bitmap(Assets.getBitmapData("img/" + fileName));
		bmp.x = x;
		bmp.y = y;

		addChild(bmp);
		
		return bmp;
	}
}