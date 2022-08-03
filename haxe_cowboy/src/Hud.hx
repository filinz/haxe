package;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * Дисплей игрока с полосой жизни и счетом 
 */
class Hud extends Sprite 
{
	public var healthBar:Sprite = new Sprite();
	
	private var textFormatScore:TextFormat = new TextFormat(); 
	private var textFormatStatus:TextFormat = new TextFormat(); 
	public var textScore:TextField = new TextField();
	public var textStatus:TextField = new TextField();

	
	public function new() {
		super();
		
		x = 20;
		y = 20;
		
		graphics.lineStyle(3, 0x000000);
		graphics.beginFill(0xFF0000, 1); 
		graphics.drawRect(0, 0, 203, 25);
		graphics.lineStyle(0, 0, 0);
		graphics.endFill();
		
		healthBar.graphics.beginFill(0x8db872, 1);
		healthBar.graphics.drawRect(0, 0, 200, 22);
		healthBar.graphics.endFill();
		addChild(healthBar);
		healthBar.x = 2;
		healthBar.y = 2;
		
		textFormatScore.font = "Arial";
		textFormatScore.color = 0x000000;
		textFormatScore.size = 18;
		textFormatScore.bold = true;
		textFormatScore.align = "center";
		
		textScore.defaultTextFormat = textFormatScore;
		textScore.width = 200;
		textScore.x = 0;
		textScore.y = 0;
		addChild(textScore);
		
		textFormatStatus.font = "Arial";
		textFormatStatus.color = 0xFFFFFF;
		textFormatStatus.size = 16;
		textFormatStatus.bold = true;
		textFormatStatus.align = "center";
		
		textStatus.defaultTextFormat = textFormatStatus;
		textStatus.width = 200;
		textStatus.x = 0;
		textStatus.y = 28;
		addChild(textStatus);
	}
	
	
	public function update(score:Int, healthPercent:Float, slow:Int = 0) {
		if (healthPercent < 0) healthPercent = 0;
		if (healthPercent> 100) healthPercent = 100;
		healthBar.scaleX = healthPercent / 100;
		
		textScore.text = "SCORE: " + score; 
		if (slow > 0) textStatus.text = "SLOW MOTION: " + Std.int(slow / 60); else textStatus.text = "";
	}
	
}