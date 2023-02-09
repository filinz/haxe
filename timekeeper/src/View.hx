package;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import view.AppScreen;
import view.FlipScreen;
import view.Screen;
import view.TableScreen;
import view.PomoScreen;
import view.StatScreen;
import view.Tab;
import openfl.text.TextField;
import openfl.text.TextFormat;


class View extends Sprite 
{
	public var maxX = 480;
	public var maxY = 800;
	
	public var appScreen: AppScreen;
	public var flipScreen: FlipScreen;
	public var tableScreen: TableScreen;
	public var pomoScreen: PomoScreen;
	public var statScreen: StatScreen;
	
	public var tabs:Array<Tab> = [];
	
	
	public function new() {
		super();
		
		appScreen = new AppScreen();
		addChild(appScreen);
		appScreen.visible = true;
		
		flipScreen = new FlipScreen();
		addChild(flipScreen);
		flipScreen.visible = true;
		
		tableScreen = new TableScreen();
		addChild(tableScreen);
		tableScreen.visible = false;
		
		pomoScreen = new PomoScreen();
		addChild(pomoScreen);
		pomoScreen.visible = false;
		
		statScreen = new StatScreen();
		addChild(statScreen);
		statScreen.visible = false;
		
		graphics.lineStyle(3, 0xFFFF00);
		graphics.moveTo(0, 100);
		graphics.lineTo(maxX, 100);
		
		for (i in 0...4) {
			tabs[i] = new Tab(i);
			addChild(tabs[i]);
		}
		tabs[0].active = true;
		
	}
	
	
	
	public function outText(x:Int, y:Int, text:String, style:String):TextField {
		
		var textField = new TextField();
		var textFormat = new TextFormat();
		
		switch style {
			case "date": {
				textFormat.font = "Arial";
				textFormat.color = 0xffff66;
				textFormat.size = 24;
				textFormat.bold = false;
				//textFormat.align = "center";
			}
			case "clock": {
				textFormat.font = "Arial";
				textFormat.color = 0xffffff;
				textFormat.size = 32;
				textFormat.bold = true;
				//textFormat.align = "center";
			}
			case "tab_a": {
				textFormat.font = "Arial";
				textFormat.color = 0xffffff;
				textFormat.size = 20;
				textFormat.bold = true;
				//textFormat.align = "center";
			}
			case "tab_p": {
				textFormat.font = "Arial";
				textFormat.color = 0xffff00;
				textFormat.size = 20;
				textFormat.bold = true;
				//textFormat.align = "center";
			}
			default: {
				textFormat.font = "Arial";
				textFormat.color = 0x000000;
				textFormat.size = 12;
				textFormat.bold = false;
				//textFormat.align = "center";
			}
		}
		
		textField.mouseEnabled = false;
		textField.width = this.width;
		textField.defaultTextFormat = textFormat;
		textField.text = text;
		textField.x = x;
		textField.y = y;
		
		addChild(textField);
		
		return textField;
		
		
	}
	
	
}