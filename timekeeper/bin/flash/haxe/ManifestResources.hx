package;

import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
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

		data = '{"name":null,"assets":"aoy4:sizei4341y4:typey5:IMAGEy9:classNamey26:__ASSET__img_appscreen_pngy2:idy19:img%2Fappscreen.pnggoR0i3820R1R2R3y27:__ASSET__img_flipscreen_pngR5y20:img%2Fflipscreen.pnggoR0i21825R1R2R3y26:__ASSET__img_pilotgray_pngR5y19:img%2Fpilotgray.pnggoR0i4769R1R2R3y27:__ASSET__img_pomoscreen_pngR5y20:img%2Fpomoscreen.pnggoR0i4616R1R2R3y27:__ASSET__img_statscreen_pngR5y20:img%2Fstatscreen.pnggoR0i14798R1R2R3y28:__ASSET__img_tablescreen_pngR5y21:img%2Ftablescreen.pnggh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_appscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_flipscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_pilotgray_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_pomoscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_statscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_tablescreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


#elseif (desktop || cpp)

@:keep @:image("assets/img/appscreen.png") @:noCompletion #if display private #end class __ASSET__img_appscreen_png extends lime.graphics.Image {}
@:keep @:image("assets/img/flipscreen.png") @:noCompletion #if display private #end class __ASSET__img_flipscreen_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pilotgray.png") @:noCompletion #if display private #end class __ASSET__img_pilotgray_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pomoscreen.png") @:noCompletion #if display private #end class __ASSET__img_pomoscreen_png extends lime.graphics.Image {}
@:keep @:image("assets/img/statscreen.png") @:noCompletion #if display private #end class __ASSET__img_statscreen_png extends lime.graphics.Image {}
@:keep @:image("assets/img/tablescreen.png") @:noCompletion #if display private #end class __ASSET__img_tablescreen_png extends lime.graphics.Image {}
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

#end