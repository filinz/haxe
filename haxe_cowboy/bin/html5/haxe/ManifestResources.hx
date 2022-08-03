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

		data = '{"name":null,"assets":"aoy4:pathy21:img%2F9DqZZmwAMdU.jpgy4:sizei245664y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y22:img%2Fbonus%2Fbomb.pngR2i3079R3R4R5R7R6tgoR0y24:img%2Fbonus%2Ffinish.pngR2i5162R3R4R5R8R6tgoR0y22:img%2Fbonus%2Ftime.pngR2i4760R3R4R5R9R6tgoR0y16:img%2Fbullet.pngR2i1318R3R4R5R10R6tgoR0y17:img%2Fbullet2.pngR2i1328R3R4R5R11R6tgoR0y16:img%2Fbutton.pngR2i5621R3R4R5R12R6tgoR0y20:img%2Fbuttondown.pngR2i19923R3R4R5R13R6tgoR0y16:img%2Fdesert.pngR2i40660R3R4R5R14R6tgoR0y17:img%2Fdesert1.pngR2i25834R3R4R5R15R6tgoR0y17:img%2Fdesert2.pngR2i28907R3R4R5R16R6tgoR0y17:img%2Fdesert3.pngR2i39903R3R4R5R17R6tgoR0y27:img%2Fenemy%2Fenemy_gun.pngR2i4421R3R4R5R18R6tgoR0y27:img%2Fenemy%2Fenemy_run.pngR2i4625R3R4R5R19R6tgoR0y14:img%2Fgame.pngR2i40660R3R4R5R20R6tgoR0y18:img%2Fgameover.pngR2i86422R3R4R5R21R6tgoR0y21:img%2Fgameoverwin.pngR2i121908R3R4R5R22R6tgoR0y37:img%2Fhero%2Fhero_idle_with_gun_0.pngR2i508R3R4R5R23R6tgoR0y37:img%2Fhero%2Fhero_idle_with_gun_1.pngR2i508R3R4R5R24R6tgoR0y37:img%2Fhero%2Fhero_idle_with_gun_2.pngR2i508R3R4R5R25R6tgoR0y37:img%2Fhero%2Fhero_idle_with_gun_3.pngR2i508R3R4R5R26R6tgoR0y34:img%2Fhero%2Fhero_jump_shoot_0.pngR2i517R3R4R5R27R6tgoR0y34:img%2Fhero%2Fhero_jump_shoot_1.pngR2i809R3R4R5R28R6tgoR0y34:img%2Fhero%2Fhero_jump_shoot_2.pngR2i842R3R4R5R29R6tgoR0y34:img%2Fhero%2Fhero_jump_shoot_3.pngR2i769R3R4R5R30R6tgoR0y37:img%2Fhero%2Fhero_jump_with_gun_0.pngR2i522R3R4R5R31R6tgoR0y29:img%2Fhero%2Fhero_shoot_0.pngR2i501R3R4R5R32R6tgoR0y29:img%2Fhero%2Fhero_shoot_1.pngR2i808R3R4R5R33R6tgoR0y29:img%2Fhero%2Fhero_shoot_2.pngR2i822R3R4R5R34R6tgoR0y29:img%2Fhero%2Fhero_shoot_3.pngR2i763R3R4R5R35R6tgoR0y37:img%2Fhero%2Fhero_walk_with_gun_0.pngR2i534R3R4R5R36R6tgoR0y37:img%2Fhero%2Fhero_walk_with_gun_1.pngR2i510R3R4R5R37R6tgoR0y37:img%2Fhero%2Fhero_walk_with_gun_2.pngR2i504R3R4R5R38R6tgoR0y37:img%2Fhero%2Fhero_walk_with_gun_3.pngR2i510R3R4R5R39R6tgoR0y15:img%2Fpause.pngR2i20036R3R4R5R40R6tgoR0y15:img%2Frules.pngR2i286192R3R4R5R41R6tgoR0y20:img%2Fscoreboard.pngR2i5158R3R4R5R42R6tgoR0y15:img%2Ftitle.pngR2i403507R3R4R5R43R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_9dqzzmwamdu_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_bonus_bomb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_bonus_finish_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_bonus_time_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_bullet2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_buttondown_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_desert_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_desert1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_desert2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_desert3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_enemy_enemy_gun_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_enemy_enemy_run_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_game_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_gameoverwin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_idle_with_gun_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_idle_with_gun_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_idle_with_gun_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_idle_with_gun_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_jump_shoot_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_jump_shoot_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_jump_shoot_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_jump_shoot_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_jump_with_gun_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_shoot_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_shoot_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_shoot_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_shoot_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_walk_with_gun_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_walk_with_gun_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_walk_with_gun_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_hero_hero_walk_with_gun_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_pause_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_rules_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_scoreboard_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__img_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("assets/img/9DqZZmwAMdU.jpg") @:noCompletion #if display private #end class __ASSET__img_9dqzzmwamdu_jpg extends lime.graphics.Image {}
@:keep @:image("assets/img/bonus/bomb.png") @:noCompletion #if display private #end class __ASSET__img_bonus_bomb_png extends lime.graphics.Image {}
@:keep @:image("assets/img/bonus/finish.png") @:noCompletion #if display private #end class __ASSET__img_bonus_finish_png extends lime.graphics.Image {}
@:keep @:image("assets/img/bonus/time.png") @:noCompletion #if display private #end class __ASSET__img_bonus_time_png extends lime.graphics.Image {}
@:keep @:image("assets/img/bullet.png") @:noCompletion #if display private #end class __ASSET__img_bullet_png extends lime.graphics.Image {}
@:keep @:image("assets/img/bullet2.png") @:noCompletion #if display private #end class __ASSET__img_bullet2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/button.png") @:noCompletion #if display private #end class __ASSET__img_button_png extends lime.graphics.Image {}
@:keep @:image("assets/img/buttondown.png") @:noCompletion #if display private #end class __ASSET__img_buttondown_png extends lime.graphics.Image {}
@:keep @:image("assets/img/desert.png") @:noCompletion #if display private #end class __ASSET__img_desert_png extends lime.graphics.Image {}
@:keep @:image("assets/img/desert1.png") @:noCompletion #if display private #end class __ASSET__img_desert1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/desert2.png") @:noCompletion #if display private #end class __ASSET__img_desert2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/desert3.png") @:noCompletion #if display private #end class __ASSET__img_desert3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/enemy/enemy_gun.png") @:noCompletion #if display private #end class __ASSET__img_enemy_enemy_gun_png extends lime.graphics.Image {}
@:keep @:image("assets/img/enemy/enemy_run.png") @:noCompletion #if display private #end class __ASSET__img_enemy_enemy_run_png extends lime.graphics.Image {}
@:keep @:image("assets/img/game.png") @:noCompletion #if display private #end class __ASSET__img_game_png extends lime.graphics.Image {}
@:keep @:image("assets/img/gameover.png") @:noCompletion #if display private #end class __ASSET__img_gameover_png extends lime.graphics.Image {}
@:keep @:image("assets/img/gameoverwin.png") @:noCompletion #if display private #end class __ASSET__img_gameoverwin_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_idle_with_gun_0.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_idle_with_gun_0_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_idle_with_gun_1.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_idle_with_gun_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_idle_with_gun_2.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_idle_with_gun_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_idle_with_gun_3.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_idle_with_gun_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_jump_shoot_0.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_jump_shoot_0_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_jump_shoot_1.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_jump_shoot_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_jump_shoot_2.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_jump_shoot_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_jump_shoot_3.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_jump_shoot_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_jump_with_gun_0.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_jump_with_gun_0_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_shoot_0.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_shoot_0_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_shoot_1.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_shoot_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_shoot_2.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_shoot_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_shoot_3.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_shoot_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_walk_with_gun_0.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_walk_with_gun_0_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_walk_with_gun_1.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_walk_with_gun_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_walk_with_gun_2.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_walk_with_gun_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/hero/hero_walk_with_gun_3.png") @:noCompletion #if display private #end class __ASSET__img_hero_hero_walk_with_gun_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pause.png") @:noCompletion #if display private #end class __ASSET__img_pause_png extends lime.graphics.Image {}
@:keep @:image("assets/img/rules.png") @:noCompletion #if display private #end class __ASSET__img_rules_png extends lime.graphics.Image {}
@:keep @:image("assets/img/scoreboard.png") @:noCompletion #if display private #end class __ASSET__img_scoreboard_png extends lime.graphics.Image {}
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
