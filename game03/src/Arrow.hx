package;

class Arrow extends BitmapSprite
{
	public var speedX:Float = 0.0;
	public var speedY:Float = 0.0;
	
	public function new() 
	{
		super("arrow");
	}

	public function updateRotation() {

		var angle = Math.atan2(speedY, speedX);
		rotation = (180.0 / Math.PI) * angle;
	}
}