package;

class Horseman extends BitmapSprite
{
	public var dead:Bool = false;
	public var speed:Float = 1;

	public function new() 
	{
		super("horse");
		
		speed = 1 + 2 * Math.random();
	}
	
	var frame:Int = 0;
	public function update() {
		frame++;
		changeBitmapData("horse" + Std.string(Std.int(frame/3) % 14 + 1));
	}
}