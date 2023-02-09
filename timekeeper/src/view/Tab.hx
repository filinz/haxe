package view;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.text.TextField;
import openfl.text.TextFormat;

class Tab extends Sprite
{

	public var active:Bool = false;
	
	var names:Array<String> = ["Flip", "Table", "Pomo", "Stats"];
	
	public function new(num:Int) {
		super();
		
		var width = 100;
		var height = 40;
		var x0 = 10 + num * (width + 20);
		var y0 = 60;

		
		if (active) {
			graphics.lineStyle(3, 0x003366);
			//outText(x0 + 20, y0 + 10, text, "tab_a");
		} else {
			graphics.lineStyle(3, 0xFFFF00);
			//outText(x0 + 20, y0 + 10, text, "tab_p");
		}
		
		graphics.moveTo(x0, y0 + height);
		graphics.lineTo(x0 + width, y0 + height);
		

		graphics.lineStyle(3, 0xFFFF00);
		
		graphics.moveTo(x0, y0 + height);
		graphics.lineTo(x0, y0);
		graphics.lineTo(x0 + width, y0);
		graphics.lineTo(x0 + width, y0 + height);
		
	
		
		
	}
	
}