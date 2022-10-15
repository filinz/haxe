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
	private var aIDs:Array<Int>;
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
		
		var bData:BitmapData = Assets.getBitmapData("img/91825.png");
		tileset = new Tileset(bData);
		
		tilemap = new Tilemap(stage.stageWidth, stage.stageHeight, tileset);
		addChild(tilemap);
		
		// Adding the graphics
		// from one image file, we are getting parts of it as per defined in the reactangle below
		var i1:Int = tileset.addRect(new Rectangle(1, 3, 24, 58));
		var i2:Int = tileset.addRect(new Rectangle(30, 3, 24, 58));
		var i3:Int = tileset.addRect(new Rectangle(62, 3, 20, 58));
		var i4:Int = tileset.addRect(new Rectangle(90, 3, 20, 58));
		var i5:Int = tileset.addRect(new Rectangle(118, 3, 22, 58));
		var i6:Int = tileset.addRect(new Rectangle(146, 3, 23, 58));
		
		this.aIDs = [];
		this.aIDs.push(i1);
		this.aIDs.push(i2);
		this.aIDs.push(i3);
		this.aIDs.push(i4);
		this.aIDs.push(i5);
		this.aIDs.push(i6);
		
		
		var t1:Tile = new Tile(i1, 100, 100);
		tilemap.addTile(t1);
		
		var t2:Tile = new Tile(i2, 130, 100);
		tilemap.addTile(t2);
		
		var t3:Tile = new Tile(i3, 160, 100);
		tilemap.addTile(t3);
		
		var t4:Tile = new Tile(i4, 184, 100);
		tilemap.addTile(t4);
		
		var t5:Tile = new Tile(i5, 210, 100);
		tilemap.addTile(t5);
		
		var t6:Tile = new Tile(i6, 240, 100);
		tilemap.addTile(t6);
		
		
		// new Tilemap
		var fishData:BitmapData = Assets.getBitmapData("img/fishbaddie_parts.png");
		var fishTileset = new Tileset(fishData);
		
		var fishTilemap:Tilemap = new Tilemap(stage.stageWidth, stage.stageHeight, fishTileset);
		addChild(fishTilemap);
		
		//var fish1:Tile = fishTileset.addRect(new Rectangle(1, 3, 24, 58));
		//fishTilemap.addTile(fish1);
		
		var fish_1_int:Int = fishTileset.addRect(new Rectangle(136, 5, 41, 41)); // get from the position from the sprite-map
		var fish1:Tile = new Tile(fish_1_int, 10, 10);// add and position on screen
		fishTilemap.addTile(fish1);
		
		
		addEventListener(Event.ENTER_FRAME,onEachFrame);
	}
	
	
	private function addNewTiles():Void{
		var a = Math.round(Math.random() * 5);
		var tile:Tile = new Tile(this.aIDs[a], Math.random() * stage.stageWidth, Math.random() * stage.stageHeight);
		
		tile.rotation = Math.random() * 360;
		//tile.scaleX = tile.scaleY = Math.random() * 2;

		tilemap.addTile(tile);
		
		tileCount++;
	}
	
	
	private function onEachFrame(e:Event):Void{
		addNewTiles();
	}
	
}