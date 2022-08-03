package;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

class RulesScreen extends Sprite
{
	
	public function new() {
		super();
		
		var bmp = new Bitmap(Assets.getBitmapData("img/rules.png"));
		addChild(bmp);
		
		var buttonBack = new Button(335, 300, "BACK");
		addChild(buttonBack);
		buttonBack.addEventListener(MouseEvent.CLICK, clickBack);
	}
	
	
	public function destroy() {}
	
	
	public function clickBack(e:MouseEvent) {
		dispatchEvent(new Event("BACK")); 
	}
}