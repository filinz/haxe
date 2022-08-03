package;

/**
 * Основная сущность живых объектов
 */

class Entity extends BitmapSprite
{
	public var health:Int = 1;
	
	public var frame:Int = 0; // общий счетчик фреймов
	public var slow:Float = 1.0; // коэффициент замедленности
		
	public var ground:Int = 322; // уровень земли
	public var speed:Float = 0; // смещение по X при движении
	
	public var direction:Int = 1; // 1 - смотрит направо, -1 - налево
	public var gravity:Float = 0; // положительная - падаем, отрицательная - взлетаем (прыжок)
	public var floor:Int; // Y текущей опоры
	
	public var isMoving:Bool = false;
	public var isJumping:Bool = false;
	public var isFiring:Bool = false;
	
	public var lastShotFrame:Int = -100;
	public var reloadShoot:Int = 12;
	
	
	public function new(imgName:String) 
	{
		super(imgName);
		
		floor = ground;
		updateModel();
	}
	
	
	public function updateModel() {}
	
	
	public function jump() {
		if (y == floor) gravity = -12;
	}
	
	
	public function registerShot() : Bool {
		if (frame - lastShotFrame > reloadShoot) {
			lastShotFrame = frame;
			return true;
		} else return false;
	}
	
	
	public function goLeft() {
		isMoving = true;
		direction = -1;
		x -= speed * slow;
	}
	
	
	public function goRight() {
		isMoving = true;
		direction = 1;
		x += speed * slow;
	}
	
	
	public function doGravity() {
		y += gravity * slow;
		if (y < floor) gravity += slow; else {
			gravity = 0;
			y = floor; 
			isJumping = false;
		}
	}

}