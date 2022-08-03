package;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

/**
 * ...
 * @author filinz
 */
class ShopScreen extends Sprite
{

	public function new() {
		super();
		trace("new Shop");
		
		var bmp = new Bitmap(Assets.getBitmapData("img/shop.png"));
		addChild(bmp);
		
	
	}
	
	public function gameOver(e:MouseEvent) {
		dispatchEvent(new Event("GAMEOVER")); // отправляем новый ивент в main
		

	}
	
	public function destroy() {
		trace("destroy Game");
	}
	
}