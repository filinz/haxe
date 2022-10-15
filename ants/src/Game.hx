package;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Tile;
import openfl.display.Tilemap;
import openfl.display.Tileset;
import openfl.geom.Rectangle;

import openfl.events.Event;
import openfl.events.MouseEvent;

import openfl.Assets;

/**
 * ...
 */

class Game extends Sprite 
{
	private var tilemap:Tilemap;
	private var tileset:Tileset;
	private var id:Array<Int>;
	private var tileCount:Int;
	
	
	public function new() {
		
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}
	
	
	private function onAddedToStage(e:Event):Void{
		init();
	}
	
	
	public function init():Void{
		
		tileCount = 0;
		
		var bData:BitmapData = Assets.getBitmapData("img/ant.png");
		tileset = new Tileset(bData);
		
		tilemap = new Tilemap(stage.stageWidth, stage.stageHeight, tileset);
		addChild(tilemap);
		
		// Adding the graphics
		// from one image file, we are getting parts of it as per defined in the reactangle below
		var i1:Int = tileset.addRect(new Rectangle(1, 1, 202, 248));
		var i2:Int = tileset.addRect(new Rectangle(1, 249, 202, 248));
		var i3:Int = tileset.addRect(new Rectangle(1, 497, 202, 248));
		var i4:Int = tileset.addRect(new Rectangle(1, 745, 202, 248));
		var i5:Int = tileset.addRect(new Rectangle(1, 993, 202, 248));
		var i6:Int = tileset.addRect(new Rectangle(1, 1241, 202, 248));
		
		this.id = [];
		
		this.id.push(i1);
		this.id.push(i2);
		this.id.push(i3);
		this.id.push(i4);
		this.id.push(i5);
		this.id.push(i6);
		
		
		var t1:Tile = new Tile(i1, 100, 100);
		tilemap.addTile(t1);
		
		var t2:Tile = new Tile(i2, 200, 100);
		tilemap.addTile(t2);
		
		var t3:Tile = new Tile(i3, 300, 100);
		tilemap.addTile(t3);
		
		var t4:Tile = new Tile(i4, 400, 100);
		tilemap.addTile(t4);
		
		var t5:Tile = new Tile(i5, 500, 100);
		tilemap.addTile(t5);
		
		var t6:Tile = new Tile(i6, 600, 100);
		tilemap.addTile(t6);
		
		
		addEventListener(Event.ENTER_FRAME,onEachFrame);
	}
	
	
	private function addNewTiles():Void{
		var a = Math.round(Math.random() * 5);
		var tile:Tile = new Tile(this.id[a], Math.random() * stage.stageWidth, Math.random() * stage.stageHeight);
		
		tile.rotation = Math.random() * 360;
		//tile.scaleX = tile.scaleY = Math.random() * 2;

		tilemap.addTile(tile);
		
		tileCount++;
	}
	
	
	private function onEachFrame(e:Event):Void{
		//addNewTiles();
	}
	
}