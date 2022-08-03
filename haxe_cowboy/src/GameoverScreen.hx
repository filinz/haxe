package;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;

class GameoverScreen extends Sprite
{
	
	public function new(win:Bool, score:Int) {
		super();
		
		var img:String = "img/gameover.png";
		if (win) img = "img/gameoverwin.png";
		
		var bmp = new Bitmap(Assets.getBitmapData(img));
		addChild(bmp);
		
		img = "img/scoreboard.png";
		bmp = new Bitmap(Assets.getBitmapData(img));
		addChild(bmp);
		bmp.x = 290;
		bmp.y = 40;
		
		var textField = new TextField();
		var textFormat = new TextFormat();
		
		textFormat.font = "Arial";
		textFormat.color = 0xFFFFFF;
		textFormat.size = 18;
		textFormat.bold = true;
		textFormat.align = "center";

		textField.mouseEnabled = false;
		textField.width = this.width;
		textField.defaultTextFormat = textFormat;
		textField.text = "SCORE: " + score;
		textField.y = 54;
		addChild(textField);
		
		var buttonAgain = new Button(240, 300, "TRY AGAIN");
		addChild(buttonAgain);
		buttonAgain.addEventListener(MouseEvent.CLICK, clickAgain);
		
		var buttonQuit = new Button(430, 300, "QUIT");
		addChild(buttonQuit);
		buttonQuit.addEventListener(MouseEvent.CLICK, clickQuit);
	}
	
	
	public function destroy() {}
	
	
	public function clickAgain(e:MouseEvent) {
		dispatchEvent(new Event("AGAIN")); 
	}
	
	
	public function clickQuit(e:MouseEvent) {
		dispatchEvent(new Event("QUIT")); 
	}
}