package;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;

class Parallax extends Sprite 
{
	public var leftBmp:Bitmap;
	public var centerBmp:Bitmap;
	public var rightBmp:Bitmap;
	
	
	public function new(imageName:String) {
		super();
		
		centerBmp = new Bitmap(Assets.getBitmapData("img/" + imageName + ".png"));
		leftBmp = new Bitmap(Assets.getBitmapData("img/" + imageName + ".png" ));
		rightBmp = new Bitmap(Assets.getBitmapData("img/" + imageName + ".png"));
		
		leftBmp.x = -centerBmp.width;
		rightBmp.x = centerBmp.width;
		
		addChild(leftBmp);		
		addChild(centerBmp);
		addChild(rightBmp);
	}
	
	
	public function shift(delta:Float = 0) {
		leftBmp.x -= delta;
		centerBmp.x -= delta;
		rightBmp.x -= delta;
		
		if (delta > 0) {
			if (centerBmp.x < -centerBmp.width) {
				leftBmp.x += leftBmp.width * 2;
				centerBmp.x += centerBmp.width * 2;
				rightBmp.x += rightBmp.width * 2;
			}
		} else {
			if (centerBmp.x > centerBmp.width) {
				leftBmp.x -= leftBmp.width * 2;
				centerBmp.x -= centerBmp.width * 2;
				rightBmp.x -= rightBmp.width * 2;
			}
		}
		
	}
	

}

