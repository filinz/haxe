package;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;

/**
 * Основной экран игры
 */
class Game extends Sprite
{
	public var score:Int = 0; // очки героя
	
	public var paused:Bool = false; // пауза
	public var slowFrame:Int = 0; // фрейм, до которого замедление

	var leftKey:Bool = false;
	var rightKey:Bool = false;
	var upKey:Bool = false;
	var fireKey:Bool = false;
	
	var mouseKeyDown:Bool = false;
	
	public var hero:Hero;
	
	public var hud:Hud;
	
	var finish1:Bonus;
	var finish2:Bonus;
	
	public var parallaxFar:Parallax;
	public var parallaxMed:Parallax;
	public var parallaxNear:Parallax;
	
	public var camera:Sprite;
	
	public var bullets:Array<Bullet> = []; // массив пуль
	public var enemies:Array<Enemy> = []; // массив врагов
	public var bonuses:Array<Bonus> = []; // массив бонусов 
	
	public var buttonPause:Button;
	public var buttonQuit:Button;
	
	
	public function new() {
		super();
		
		// задний фон
		parallaxFar = new Parallax("desert1");
		addChild(parallaxFar);
		parallaxMed = new Parallax("desert2");
		addChild(parallaxMed);
		parallaxNear = new Parallax("desert3");
		addChild(parallaxNear);
		
		// игровая сцена
		camera = new Sprite();
		addChild(camera);
		
		// кнопки на игровом экране
		buttonPause = new Button(550, 10, "PAUSE");
		addChild(buttonPause);
		buttonPause.addEventListener(MouseEvent.CLICK, clickPause);
		
		buttonQuit = new Button(670, 10, "QUIT");
		addChild(buttonQuit);
		buttonQuit.addEventListener(MouseEvent.CLICK, clickQuit);
		
		// дисплей
		hud = new Hud();
		addChild(hud);
		
		// главный герой
		hero = new Hero();
		camera.addChild(hero);
		
		// финиши для героя
		finish1 = new Bonus(1);
		finish1.x = 10000;
		finish1.y = 0;
		camera.addChild(finish1);
		bonuses.push(finish1);
		
		finish2 = new Bonus(1);
		finish2.x = -10000;
		finish2.y = 0;
		camera.addChild(finish2);
		bonuses.push(finish2);
		
		addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		addEventListener(Event.ENTER_FRAME, enterFrame);
	}
	
	
	public function destroy() {
		buttonPause.removeEventListener(MouseEvent.CLICK, clickPause);
		buttonQuit.removeEventListener(MouseEvent.CLICK, clickQuit);
		removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		removeEventListener(Event.ENTER_FRAME, enterFrame);
	}

	
	public function enterFrame(e:Event) {
		if (paused) return; // проверка на паузу
		
		if (slowFrame > hero.frame) { // проверка на замедленность
			hero.slow = 0.5;
			for (enemy in enemies) { enemy.slow = 0.25; }
			for (bullet in bullets) { bullet.slow = 0.25; }
		} else {
			hero.slow = 1;
			for (enemy in enemies) { enemy.slow = 1; }
			for (bullet in bullets) { bullet.slow = 1; }
		}
		
		// клавиатура
		if (leftKey) {
			hero.goLeft();
			camera.x += hero.speed * hero.slow;
			parallaxNear.shift(-hero.speed * hero.slow);
			parallaxMed.shift(-hero.speed * hero.slow / 4);
		}
		if (rightKey) {
			hero.goRight();
			camera.x -= hero.speed * hero.slow;
			parallaxNear.shift(hero.speed * hero.slow);
			parallaxMed.shift(hero.speed * hero.slow / 4);
		}
		
		if (upKey) hero.jump(); 
		
		if (fireKey && hero.registerShot()) { // выстрел героя
			var bullet = new Bullet(hero, 1);
			camera.addChild(bullet);
			bullets.push(bullet);
		}; 
		
		for (bullet in bullets) { // перебор пуль
			bullet.fly();	
			
			if (Math.abs(hero.x - bullet.x) > 420) { // пули за пределами экрана
				bullet.health = 0;
			}
			
			if (bullet.side == 2 && distance(bullet.x, bullet.y, hero.x, hero.y) < 10) { // столкновение героя с вражеской пулей
				hero.health -= 5;
				bullet.health -= 1;
			}
		
			if (bullet.health <= 0) { // удаление поломанных пуль
				bullets.remove(bullet);
				camera.removeChild(bullet);
				bullet = null;				
			}
		}
		
		for (enemy in enemies) { // перебор врагов
			
			// движение к герою
			if ((enemy.direction == 1) && (hero.x - enemy.x < -50)) enemy.direction = -1;
			if ((enemy.direction == -1) && (hero.x - enemy.x > 50)) enemy.direction = 1;
			enemy.x += enemy.speed * enemy.slow * enemy.direction;
						
			// иногда прыгать
			if (Math.random() >= 0.95) enemy.jump();
			
			// иногда стрелять
			if ((enemy.type == 2) && (Math.random() >= 0.95) && enemy.registerShot()) {
				var bullet = new Bullet(enemy, 2);
				camera.addChild(bullet);
				bullets.push(bullet);
			}; 
		
			// столкновение врага с пулей
			for (bullet in bullets) {
				if (bullet.side == 1 && distance(bullet.x, bullet.y, enemy.x, enemy.y) < enemy.width / 1.5) {
					enemy.health -= 1;
					bullet.health -= 1;
				}
			}
			
			// столкновение врага с гером
			if (distance(hero.x, hero.y, enemy.x, enemy.y) < (hero.width + enemy.width) / 2) {
				hero.health -= 1;
			}
			
			enemy.frame++;
			enemy.doGravity();
			enemy.updateModel();
			
			// удаление убитых врагов
			if (enemy.health <= 0) {
				score += 1;
				if (Math.random() > 0.8) { // иногда выпадают бонусы
					var type:Int;
					if (Math.random() >= 0.5) type = 2; else type = 3;
					var bonus:Bonus = new Bonus(type);
					bonus.x = enemy.x;
					bonus.y = enemy.y;
					camera.addChild(bonus);
					bonuses.push(bonus);	
				}		
				enemies.remove(enemy);
				camera.removeChild(enemy);
			}
		}
		
		for (bonus in bonuses) { // перебор финишей и бонусов
			if (distance(hero.x, hero.y, bonus.x, bonus.y) < (hero.width + bonus.width) / 4) {
				switch (bonus.type) {
					case 1: dispatchEvent(new Event("GAMEOVER")); 
					case 2: slow();
					case 3: bomb();
				}		
				bonuses.remove(bonus);
				camera.removeChild(bonus);
			}
			bonus.doGravity();
		}
		
		// добавление врагов
		if (hero.frame % Std.int(300 * (1 - hero.frame / (hero.frame + 1800))) == 0) {
			var enemy:Enemy;
			if ((Math.random() - 0.5) >= 0) enemy = new Enemy(1); else enemy = new Enemy(2);
			if ((Math.random() - 0.5) >= 0) enemy.x = hero.x + 420; else enemy.x = hero.x - 420;
			camera.addChild(enemy);
			enemies.push(enemy); 
		}
		
		hero.frame++;
		hero.doGravity();
		hero.updateModel();
		hud.update(score, hero.health / hero.healthStart * 100, slowFrame - hero.frame); 
	
		// смерть игрока
		if (hero.health <= 0) {
			dispatchEvent(new Event("GAMEOVER")); 
		}
	}
	
	
	public function mouseDown(e:MouseEvent) { 
		fireKey = true;
		if (e.localX < 400) hero.direction = -1; else hero.direction = 1;
	}
	
	
	public function mouseUp(e:MouseEvent) { 
		fireKey = false;
	}
	
	
	public function keyDown(e:KeyboardEvent) { // движение, прыжок, стрельба, перекл.оружия 
		switch (e.keyCode) {
			case 37, 65: leftKey = true; 
			case 39, 68: rightKey = true; 
			case 38, 87: 
				upKey = true;
				hero.isJumping = true;
			case 32: // пробел
				fireKey = true;
			case 19: clickPause(null); 
			
			// для тестирования, на цифровой клавиатуре [1] - победа, [0] - проигрыш, [.] - добавить врага
			case 35: dispatchEvent(new Event("GAMEOVER")); 
			case 45: hero.health = 0;
			case 46: {
				var enemy:Enemy;
				if ((Math.random() - 0.5) >= 0) enemy = new Enemy(1); else enemy = new Enemy(2);
				if ((Math.random() - 0.5) >= 0) enemy.x = hero.x + 420; else enemy.x = hero.x - 420;
				camera.addChild(enemy);
				enemies.push(enemy); 
			}
		}
	}
	
	
	public function keyUp(e:KeyboardEvent) {
		switch (e.keyCode) {
			case 37, 65: 
				leftKey = false; 
				hero.isMoving = false;
			case 39, 68: 
				rightKey = false;
				hero.isMoving = false;
			case 38, 87: 
				upKey = false;
			case 32: 
				fireKey = false;
		}
	}
	
	
	public function clickFire(e:MouseEvent) { 
		fireKey = true;
	}

	
	public function clickPause(e:MouseEvent) {
		paused = !paused;	
	}	
	
	
	public function clickQuit(e:MouseEvent) {
		dispatchEvent(new Event("QUIT")); 
	}
	
	
	public function distance(x1:Float, y1:Float, x2:Float = 0, y2:Float = 0) : Float { // дистанция между точками
		var dx = x1 - x2;
		var dy = y1 - y2;
		return Math.sqrt(dx * dx + dy * dy);
	}
	
	
	function bomb() { // уничтожить всех врагов
		for (enemy in enemies) {
			enemy.health = 0;	
		}
	}
	
	
	function slow() { // установка времени замедления
		if (slowFrame > hero.frame) slowFrame = slowFrame + 600; else slowFrame = hero.frame + 600; 
	}
}