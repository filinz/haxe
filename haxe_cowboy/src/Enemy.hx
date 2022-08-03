package;

/**
 * Враги
 */
class Enemy extends Entity
{
	public var type:Int = 1;
	
	public function new(type:Int) {
		switch (type) { 
			case 1: // бегун
				super("enemy/enemy_run");
				speed = 3;
				
			case 2: // стрелок
				super("enemy/enemy_gun");
				speed = 1;
		}
		
		this.type = type;
		y = ground;
		direction = -1;
		reloadShoot = 36;
		
		updateModel();
	}
	
	override public function updateModel() {
		switch (this.type) { 
			case 1: changeImg("enemy/enemy_run");
			case 2: changeImg("enemy/enemy_gun");
		}
		scaleX = direction; // направление взгляда
	}
}