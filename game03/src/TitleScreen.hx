package;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;

class TitleScreen extends Sprite
{

	public function new() {
		super();
		trace("new TitleScreen");
		
		var bmp = new Bitmap(Assets.getBitmapData("img/title.png"));
		addChild(bmp);
		
		useHandCursor = true;
		buttonMode = true;
		
		addEventListener(MouseEvent.CLICK, onClick);
		
	}
	
	public function onClick(e:MouseEvent) {
		dispatchEvent(new Event("CLICKED")); // отправляем новый ивент в main
		
	}
	
	public function destroy() {
		trace("destroy TitleScreen");
	}
	
}