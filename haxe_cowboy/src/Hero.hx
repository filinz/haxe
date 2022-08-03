package;

/**
 * Герой
 */
class Hero extends Entity
{
	public var healthStart = 300;
	
	
	public function new() 
	{
		super("hero/hero_idle_with_gun_0");
		health = healthStart;
		speed = 4;
		x = 400;
		y = ground;
		reloadShoot = 12;
		updateModel();
	}
	
	override public function updateModel() {
		
		var tickIdle:Int = 0; // номер кадра без выстрела
		var tickFire:Int = 0; // номер кадра в зависимости от момента выстрела
		var fireFrame:Int = frame - lastShotFrame; 
		
		if (fireFrame < 24) { // недавно стреляли
			isFiring = true;
			if (fireFrame >= 16) { tickFire = 3; }
			else if (fireFrame >= 8) { tickFire = 2; }
			else if (fireFrame >= 4) { tickFire = 1; }
			else { tickFire = 0; }
		} else {
			isFiring = false;
			tickIdle = Std.int(frame / 6) % 4;
		}
		
		if (!isMoving && !isJumping && !isFiring) changeImg("hero/hero_idle_with_gun_" + tickIdle); // без движения
		else if (isJumping && !isFiring) changeImg("hero/hero_jump_with_gun_0"); // прыжок, ходьба+прыжок 
		else if (isMoving && !isJumping && !isFiring) changeImg("hero/hero_walk_with_gun_" + tickIdle); // ходьба
		else if (!isJumping && isFiring) changeImg("hero/hero_shoot_" + tickFire); // стрельба, ходьба+стрельба 
		else if (isJumping && isFiring) changeImg("hero/hero_jump_shoot_" + tickFire); // прыжок+стрельба, ходьба+прыжок+стрельба
		
		scaleX = direction; // направление взгляда
	}
}