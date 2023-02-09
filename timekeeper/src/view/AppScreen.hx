package view;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;

class AppScreen extends Screen
{
	public var now:Date;
	var nowDate:String = "";
	var nowClock:String = "";
	
	var bmpBackground:Bitmap;
	
	public var textDate:TextField;
	public var textClock:TextField;

	
	public function new() {
		super();
		
		bmpBackground = outBmp(0, 0, "appscreen.png");
		
		textDate = outText(30, 18, nowDate, "date");
		
		textClock = outText(310, 15, nowClock, "clock");
		
		// закладки экранов

	}
	
	
	public function checkClock() {
			
		now = Date.now();
		
		nowClock = DateTools.format(now, "%H:%M:%S");
		
		if (textClock.text != nowClock) {
			textClock.text = nowClock;
		}
		
		var monthNames:Array<String> = ["января", "февраля", "марта", "апреля", "мая", "июня", 
			"июля", "августа", "сентября", "октября", "ноября", "декабря"];
			
		nowDate = Std.string(now.getDate() + " " + monthNames[now.getMonth()] + " " + now.getFullYear());
		
		
		if (textDate.text != nowDate) {
			textDate.text = nowDate;
		}
		
	}
	
	
	
}