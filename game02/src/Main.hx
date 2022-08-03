package;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.Assets;

/**
 * game02 CardGame
 * @author filinz
 */
class Main extends Sprite 
{
	public var mafia:Int = 50;
	public var economics:Int = 55;
	public var demography:Int = 40;
	
	public var mafiaTF:PixelTextField;
	public var economicsTF:PixelTextField;
	public var demographyTF:PixelTextField;
	
	public var cardBmp:Bitmap;
	public var card:Sprite;

	public function new() 
	{
		super();
		
		mafiaTF = new PixelTextField(50, 20, "мафия: 50%");
		economicsTF = new PixelTextField(310, 20, "экономика: 50%");
		demographyTF = new PixelTextField(600, 20, "демография: 50%");
		
		addChild(mafiaTF);
		addChild(economicsTF);
		addChild(demographyTF);
		
		updateMeters();
		
		cardBmp = new Bitmap(Assets.getBitmapData("img/card.png"));
		cardBmp.scaleX = 2;
		cardBmp.scaleY = 2;
		cardBmp.x = -cardBmp.width / 2;
		cardBmp.y = -cardBmp.height / 2;
		addChild(cardBmp);
		
		card = new Sprite();
		card.addChild(cardBmp);
		addChild(card);
		
		
		card.x = Lib.current.stage.stageWidth / 2;
		card.y = Lib.current.stage.stageHeight / 2;
	}
	
	public function updateMeters() {
		mafiaTF.text = "мафия: " + Std.string(mafia) + "%";
		economicsTF.text = "экономика: " + Std.string(economics) + "%";
		demographyTF.text = "демография: " + Std.string(demography) + "%";
	}

}
