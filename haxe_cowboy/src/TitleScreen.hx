package;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

class TitleScreen extends Sprite
{

	public function new() {
		super();
		
		var bmp = new Bitmap(Assets.getBitmapData("img/title.png"));
		addChild(bmp);
		
		var buttonStart = new Button(240, 300, "START");
		addChild(buttonStart);
		buttonStart.addEventListener(MouseEvent.CLICK, clickStart);
		
		var buttonRules = new Button(430, 300, "RULES");
		addChild(buttonRules);
		buttonRules.addEventListener(MouseEvent.CLICK, clickRules);	
	}
	
	
	public function destroy() {}
	
	
	public function clickStart(e:MouseEvent) {
		dispatchEvent(new Event("START")); 
	}	
	
	
	public function clickRules(e:MouseEvent) {
		dispatchEvent(new Event("RULES")); 
	}
	

	
}