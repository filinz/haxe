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
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_pixel_cyr_normal_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:sizei2647y4:typey5:IMAGEy9:classNamey21:__ASSET__img_card_pngy2:idy14:img%2Fcard.pnggoR0i53004R1y4:FONTR3y35:__ASSET__fonts_pixel_cyr_normal_ttfR5y28:fonts%2Fpixel-cyr-normal.ttfgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_card_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__fonts_pixel_cyr_normal_ttf extends flash.text.Font { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


#elseif (desktop || cpp)

@:keep @:image("assets/img/card.png") @:noCompletion #if display private #end class __ASSET__img_card_png extends lime.graphics.Image {}
@:keep @:font("assets/fonts/pixel-cyr-normal.ttf") @:noCompletion #if display private #end class __ASSET__fonts_pixel_cyr_normal_ttf extends lime.text.Font {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__fonts_pixel_cyr_normal_ttf') @:noCompletion #if display private #end class __ASSET__fonts_pixel_cyr_normal_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "fonts/pixel-cyr-normal.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Pixel Cyr Normal"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__fonts_pixel_cyr_normal_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__fonts_pixel_cyr_normal_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__fonts_pixel_cyr_normal_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__fonts_pixel_cyr_normal_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__fonts_pixel_cyr_normal_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__fonts_pixel_cyr_normal_ttf ()); super (); }}

#end

#end
#end

#end
