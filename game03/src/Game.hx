package;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;

/**
 * ...
 * @author filinz
 */
class Game extends Sprite
{
	var currentArrow:Arrow;
	
	var releaseArrow:Array<Arrow> = [];
	var horsemans:Array<Horseman> = [];
	
	public function new() {
		super();
		trace("new Game");
		
		var bmp = new Bitmap(Assets.getBitmapData("img/game.png"));
		addChild(bmp);
		
		addCurrentArrow();
		
		addEventListener(MouseEvent.MOUSE_MOVE, onMove);
		addEventListener(MouseEvent.MOUSE_DOWN, onDown);
		addEventListener(Event.ENTER_FRAME, onFrame);	
	}
	
	public function addHorseman() {
		var horseman = new Horseman();
		horseman.x = 800;
		horseman.y = 360;
		addChild(horseman);
		horsemans.push(horseman);
	}
	
	public function addCurrentArrow() {
		currentArrow = new Arrow();
		currentArrow.x = 90;
		currentArrow.y = 200;
		addChild(currentArrow);
	}
	
	public function onMove(e:MouseEvent) {
		var dx = e.stageX - currentArrow.x;
		var dy = e.stageY - currentArrow.y;
		var angle = Math.atan2(dy, dx);
		currentArrow.speedX = Math.cos(angle) * 5;
		currentArrow.speedY = Math.sin(angle) * 5;
		currentArrow.updateRotation();
		currentArrow.rotation = (180.0 / Math.PI) * angle;
	}
	
	public function onDown(e:MouseEvent) {
		releaseArrow.push(currentArrow);
		
		addCurrentArrow();
	}
	
	public function onFrame(e:Event) {
		for (arrow in releaseArrow) {
			if (arrow.y < 380) {
				arrow.x += arrow.speedX;
				arrow.y += arrow.speedY;
				arrow.speedY += 0.1;
				arrow.updateRotation();
			}
		}
		
		for (horse in horsemans) {
			if (!horse.dead) {
				horse.x -= horse.speed;
				horse.update();
			}
			
			for (arrow in releaseArrow) {
				if (arrow.y < 380) {
					var dx = arrow.x - horse.x;
					var dy = arrow.y - horse.y;
					var ro = Math.sqrt(dx * dx + dy * dy);
					if (ro < 10) {
						// horseman is dead
						horse.dead = true;
						horse.visible = false;
					}
				}
			}
			
			if (horse.x < 0) gameOver();
		}
		
		if (Math.random() < 0.01) addHorseman();
		
		
	}
	
	public function gameOver() {
		dispatchEvent(new Event("GAMEOVER")); // отправляем новый ивент в main
		

	}
	
	public function destroy() {
		trace("destroy Game");
	}
	
}