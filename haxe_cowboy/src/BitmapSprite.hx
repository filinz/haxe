package;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.utils.Assets;

/**
 * Спрайт с указанием имени файла и с центрированием
 */
class BitmapSprite extends Sprite
{
	var bmp:Bitmap;

	
	public function new(imgName:String) 
	{
		super();
		bmp = new Bitmap();
		changeImg(imgName);		
		addChild(bmp);
	}
	
	
	public function changeImg(imgName:String) {
		bmp.bitmapData = Assets.getBitmapData("img/" + imgName + ".png");
		bmp.x = -bmp.width / 2;
		bmp.y = -bmp.height / 2;
		//bmp.smoothing = true;
		
	}
	
}