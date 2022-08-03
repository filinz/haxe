package;
import openfl.Assets;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;

/**
 * ...
 * @author filinz
 */
class PixelTextField extends TextField
{

	public function new(x:Int, y:Int, text:String) 
	{
		super();
		
		this.x = x;
		this.y = y;
		
		var textFormat:TextFormat = new TextFormat();
		textFormat.color = 0xFFFFFF;
		textFormat.size = 12;
		textFormat.font = Assets.getFont("fonts/pixel-cyr-normal.ttf").fontName;
		
		this.defaultTextFormat = textFormat;
		embedFonts = true;
		autoSize = TextFieldAutoSize.LEFT;
		mouseEnabled = false;
		
		this.text = text;
	}
	
}