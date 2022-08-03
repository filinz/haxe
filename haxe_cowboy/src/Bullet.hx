package;

/**
 * Пуля
 */

class Bullet extends Entity
{
	public var side:Int;
		
	
	public function new(owner:Entity, side:Int) {
		
		if (side == 1) {
			super("bullet");
			x = owner.x + 4 * owner.direction;
			y = owner.y + 8;
			speed = 10;
		} else {
			super("bullet2");	
			x = owner.x + 24 * owner.direction;
			y = owner.y - 4;
			speed = 5;
		}
		direction = owner.direction;
		this.side = side;
		updateModel();
	}
	
	
	public function destroy() {}
	
	
	public function fly():Void {
		x += direction * speed * slow;
	}	
	
	override public function updateModel() {
		switch (this.side) { 
			case 1: changeImg("bullet");
			case 2: changeImg("bullet2");
		}
		scaleX = direction; 
	}
	
}