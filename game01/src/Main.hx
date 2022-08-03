package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.events.KeyboardEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * game01 StarWars
 * @author filinz
 */
class Main extends Sprite 
{
	var ship:Sprite;
	
	var planets:Array<Sprite> = [];
	
	var scoreTF:TextField = new TextField();
	
	public function new() {
		super();
		
		ship = new Sprite();
		ship.x = 200;
		ship.y = 200;
		addChild(ship);
		
		var tff = new TextFormat("arial", 12, 0xFFFFFF);
		scoreTF.defaultTextFormat = tff;
		addChild(scoreTF);
		
		var shipBmp = new Bitmap(Assets.getBitmapData("img/ship.png"));
		shipBmp.x = -20;
		shipBmp.y = -20;
		shipBmp.smoothing = true;
		ship.addChild(shipBmp);
		
		addEventListener(Event.ENTER_FRAME, onFrame);
		
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onUp);
		
		addPlanet();

	}
	
	var speed:Float = 0.0;
	var angle:Float = 0.0;
	var score:Int = 0;
	
	public function onFrame(e:Event) {
		if (score >= 20) {
			scoreTF.text = "Победа !!! \nGAME OVER";
			return;
		}
		
		if (isUp) speed += 0.1;
		if (isDown) speed = speed * 0.95 - 0.1;
		
		if (isLeft) angle -= 0.03;
		if (isRight) angle += 0.03;
		
		ship.x += speed * Math.cos(angle);
		ship.y += speed * Math.sin(angle);
		
		ship.rotation = 180.0 * angle / Math.PI;
		
		//speed *= 0.99;
		
		if (ship.x < -20) ship.x = 820;
		if (ship.x > 820) ship.x = -20;
		if (ship.y < -20) ship.y = 500;
		if (ship.y > 500) ship.y = -20;
		
		for (planet in planets) {
			
			if (score % 4 == 0 || score % 4 == 1) planet.x += score / 3; else planet.x -= score / 3;
			if (score % 4 == 0 || score % 4 == 2) planet.y += score / 4; else planet.y -= score / 4;
			
			if (planet.x < -30) planet.x = 830;
			if (planet.x > 830) planet.x = -30;
			if (planet.y < -30) planet.y = 510;
			if (planet.y > 510) planet.y = -30;
			
			planet.rotation += 0.2 + score / 2;
					
			if (distance(ship.x, ship.y, planet.x, planet.y) < 35) {
				planets.remove(planet);
				removeChild(planet);
				score++;
				scoreTF.text = "SCORE: " + score;
				addPlanet();
			}
		}
		
	}
	
	var isUp:Bool = false;
	var isLeft:Bool = false;
	var isRight:Bool = false;
	var isDown:Bool = false;
	
	
	public function onDown(e:KeyboardEvent) { // нажатие кнопки
		if (e.keyCode == 37) isLeft = true;
		if (e.keyCode == 38) isUp = true;
		if (e.keyCode == 39) isRight = true;
		if (e.keyCode == 40) isDown = true;
	}
	
	public function onUp(e:KeyboardEvent) { // отжатие кнопки
		if (e.keyCode == 37) isLeft = false;
		if (e.keyCode == 38) isUp = false;
		if (e.keyCode == 39) isRight = false;
		if (e.keyCode == 40) isDown = false;
	}
	
	public function addPlanet() {
		var planet:Sprite = new Sprite();
		var bmp:Bitmap = new Bitmap(Assets.getBitmapData("img/planet.png"));
		bmp.x = -30;
		bmp.y = -30;
		bmp.smoothing = true;
		planet.addChild(bmp);
		planets.push(planet);
		
		planet.x = 30 + Math.random() * 740;
		planet.y = 30 + Math.random() * 420;
		
		addChild(planet);
	}
	
	function distance(x1:Float, y1:Float, x2:Float = 0, y2:Float = 0) : Float {
		var dx = x1 - x2;
		var dy = y1 - y2;
		return Math.sqrt(dx*dx + dy*dy);
	}
}
