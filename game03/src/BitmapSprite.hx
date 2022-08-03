package;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;


class BitmapSprite extends Sprite
{
	var bmp:Bitmap;
	
	public function new(imgName:String) 
	{
		super();
		bmp = new Bitmap();
		changeBitmapData(imgName);		
		addChild(bmp);
	}
	
	public function changeBitmapData(imgName:String) {
		bmp.bitmapData = Assets.getBitmapData("img/" + imgName + ".png");
		bmp.x = -bmp.width / 2;
		bmp.y = -bmp.height / 2;
		bmp.smoothing = true;
		
	}
	
}