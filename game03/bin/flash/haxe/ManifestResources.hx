package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:sizei974y4:typey5:IMAGEy9:classNamey22:__ASSET__img_arrow_pngy2:idy15:img%2Farrow.pnggoR0i228808R1R2R3y21:__ASSET__img_game_pngR5y14:img%2Fgame.pnggoR0i5529R1R2R3y22:__ASSET__img_horse_pngR5y15:img%2Fhorse.pnggoR0i5352R1R2R3y23:__ASSET__img_horse1_pngR5y16:img%2Fhorse1.pnggoR0i5434R1R2R3y24:__ASSET__img_horse10_pngR5y17:img%2Fhorse10.pnggoR0i5385R1R2R3y24:__ASSET__img_horse11_pngR5y17:img%2Fhorse11.pnggoR0i5354R1R2R3y24:__ASSET__img_horse12_pngR5y17:img%2Fhorse12.pnggoR0i5608R1R2R3y24:__ASSET__img_horse13_pngR5y17:img%2Fhorse13.pnggoR0i5663R1R2R3y24:__ASSET__img_horse14_pngR5y17:img%2Fhorse14.pnggoR0i5268R1R2R3y23:__ASSET__img_horse2_pngR5y16:img%2Fhorse2.pnggoR0i5219R1R2R3y23:__ASSET__img_horse3_pngR5y16:img%2Fhorse3.pnggoR0i5205R1R2R3y23:__ASSET__img_horse4_pngR5y16:img%2Fhorse4.pnggoR0i5011R1R2R3y23:__ASSET__img_horse5_pngR5y16:img%2Fhorse5.pnggoR0i5228R1R2R3y23:__ASSET__img_horse6_pngR5y16:img%2Fhorse6.pnggoR0i5613R1R2R3y23:__ASSET__img_horse7_pngR5y16:img%2Fhorse7.pnggoR0i5545R1R2R3y23:__ASSET__img_horse8_pngR5y16:img%2Fhorse8.pnggoR0i5421R1R2R3y23:__ASSET__img_horse9_pngR5y16:img%2Fhorse9.pnggoR0i12832R1R2R3y21:__ASSET__img_shop_pngR5y14:img%2Fshop.pnggoR0i335038R1R2R3y22:__ASSET__img_title_pngR5y15:img%2Ftitle.pnggh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_game_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse13_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse14_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_horse9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_shop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


#elseif (desktop || cpp)

@:keep @:image("assets/img/arrow.png") @:noCompletion #if display private #end class __ASSET__img_arrow_png extends lime.graphics.Image {}
@:keep @:image("assets/img/game.png") @:noCompletion #if display private #end class __ASSET__img_game_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse.png") @:noCompletion #if display private #end class __ASSET__img_horse_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse1.png") @:noCompletion #if display private #end class __ASSET__img_horse1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse10.png") @:noCompletion #if display private #end class __ASSET__img_horse10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse11.png") @:noCompletion #if display private #end class __ASSET__img_horse11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse12.png") @:noCompletion #if display private #end class __ASSET__img_horse12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse13.png") @:noCompletion #if display private #end class __ASSET__img_horse13_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse14.png") @:noCompletion #if display private #end class __ASSET__img_horse14_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse2.png") @:noCompletion #if display private #end class __ASSET__img_horse2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse3.png") @:noCompletion #if display private #end class __ASSET__img_horse3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse4.png") @:noCompletion #if display private #end class __ASSET__img_horse4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse5.png") @:noCompletion #if display private #end class __ASSET__img_horse5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse6.png") @:noCompletion #if display private #end class __ASSET__img_horse6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse7.png") @:noCompletion #if display private #end class __ASSET__img_horse7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse8.png") @:noCompletion #if display private #end class __ASSET__img_horse8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/horse9.png") @:noCompletion #if display private #end class __ASSET__img_horse9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/shop.png") @:noCompletion #if display private #end class __ASSET__img_shop_png extends lime.graphics.Image {}
@:keep @:image("assets/img/title.png") @:noCompletion #if display private #end class __ASSET__img_title_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)

#if html5

#else

#end

#end
#end

#end
