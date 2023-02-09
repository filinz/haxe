package;

//import openfl.Lib;
import openfl.display.Sprite;
import openfl.Assets;
//import openfl.display.Bitmap;
import openfl.events.Event;

class Main extends Sprite 
{

	public var view:View;
	
	public function new() {	
		super();
				
		view = new View();
		addChild(view);
		
		//view.appScreen.visible = true;
		
		
		
		addEventListener(Event.ENTER_FRAME, enterFrame);
		
	}

	
	public function enterFrame(e:Event) {
		
		view.appScreen.checkClock();
		
	}
	
}
