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

		data = '{"name":null,"assets":"aoy4:sizei245664y4:typey5:IMAGEy9:classNamey28:__ASSET__img_9dqzzmwamdu_jpgy2:idy21:img%2F9DqZZmwAMdU.jpggoR0i3079R1R2R3y27:__ASSET__img_bonus_bomb_pngR5y22:img%2Fbonus%2Fbomb.pnggoR0i5162R1R2R3y29:__ASSET__img_bonus_finish_pngR5y24:img%2Fbonus%2Ffinish.pnggoR0i4760R1R2R3y27:__ASSET__img_bonus_time_pngR5y22:img%2Fbonus%2Ftime.pnggoR0i1318R1R2R3y23:__ASSET__img_bullet_pngR5y16:img%2Fbullet.pnggoR0i1328R1R2R3y24:__ASSET__img_bullet2_pngR5y17:img%2Fbullet2.pnggoR0i5621R1R2R3y23:__ASSET__img_button_pngR5y16:img%2Fbutton.pnggoR0i19923R1R2R3y27:__ASSET__img_buttondown_pngR5y20:img%2Fbuttondown.pnggoR0i40660R1R2R3y23:__ASSET__img_desert_pngR5y16:img%2Fdesert.pnggoR0i25834R1R2R3y24:__ASSET__img_desert1_pngR5y17:img%2Fdesert1.pnggoR0i28907R1R2R3y24:__ASSET__img_desert2_pngR5y17:img%2Fdesert2.pnggoR0i39903R1R2R3y24:__ASSET__img_desert3_pngR5y17:img%2Fdesert3.pnggoR0i4421R1R2R3y32:__ASSET__img_enemy_enemy_gun_pngR5y27:img%2Fenemy%2Fenemy_gun.pnggoR0i4625R1R2R3y32:__ASSET__img_enemy_enemy_run_pngR5y27:img%2Fenemy%2Fenemy_run.pnggoR0i40660R1R2R3y21:__ASSET__img_game_pngR5y14:img%2Fgame.pnggoR0i86422R1R2R3y25:__ASSET__img_gameover_pngR5y18:img%2Fgameover.pnggoR0i121908R1R2R3y28:__ASSET__img_gameoverwin_pngR5y21:img%2Fgameoverwin.pnggoR0i508R1R2R3y42:__ASSET__img_hero_hero_idle_with_gun_0_pngR5y37:img%2Fhero%2Fhero_idle_with_gun_0.pnggoR0i508R1R2R3y42:__ASSET__img_hero_hero_idle_with_gun_1_pngR5y37:img%2Fhero%2Fhero_idle_with_gun_1.pnggoR0i508R1R2R3y42:__ASSET__img_hero_hero_idle_with_gun_2_pngR5y37:img%2Fhero%2Fhero_idle_with_gun_2.pnggoR0i508R1R2R3y42:__ASSET__img_hero_hero_idle_with_gun_3_pngR5y37:img%2Fhero%2Fhero_idle_with_gun_3.pnggoR0i517R1R2R3y39:__ASSET__img_hero_hero_jump_shoot_0_pngR5y34:img%2Fhero%2Fhero_jump_shoot_0.pnggoR0i809R1R2R3y39:__ASSET__img_hero_hero_jump_shoot_1_pngR5y34:img%2Fhero%2Fhero_jump_shoot_1.pnggoR0i842R1R2R3y39:__ASSET__img_hero_hero_jump_shoot_2_pngR5y34:img%2Fhero%2Fhero_jump_shoot_2.pnggoR0i769R1R2R3y39:__ASSET__img_hero_hero_jump_shoot_3_pngR5y34:img%2Fhero%2Fhero_jump_shoot_3.pnggoR0i522R1R2R3y42:__ASSET__img_hero_hero_jump_with_gun_0_pngR5y37:img%2Fhero%2Fhero_jump_with_gun_0.pnggoR0i501R1R2R3y34:__ASSET__img_hero_hero_shoot_0_pngR5y29:img%2Fhero%2Fhero_shoot_0.pnggoR0i808R1R2R3y34:__ASSET__img_hero_hero_shoot_1_pngR5y29:img%2Fhero%2Fhero_shoot_1.pnggoR0i822R1R2R3y34:__ASSET__img_hero_hero_shoot_2_pngR5y29:img%2Fhero%2Fhero_shoot_2.pnggoR0i763R1R2R3y34:__ASSET__img_hero_hero_shoot_3_pngR5y29:img%2Fhero%2Fhero_shoot_3.pnggoR0i534R1R2R3y42:__ASSET__img_hero_hero_walk_with_gun_0_pngR5y37:img%2Fhero%2Fhero_walk_with_gun_0.pnggoR0i510R1R2R3y42:__ASSET__img_hero_hero_walk_with_gun_1_pngR5y37:img%2Fhero%2Fhero_walk_with_gun_1.pnggoR0i504R1R2R3y42:__ASSET__img_hero_hero_walk_with_gun_2_pngR5y37:img%2Fhero%2Fhero_walk_with_gun_2.pnggoR0i510R1R2R3y42:__ASSET__img_hero_hero_walk_with_gun_3_pngR5y37:img%2Fhero%2Fhero_walk_with_gun_3.pnggoR0i20036R1R2R3y22:__ASSET__img_pause_pngR5y15:img%2Fpause.pnggoR0i286192R1R2R3y22:__ASSET__img_rules_pngR5y15:img%2Frules.pnggoR0i5158R1R2R3y27:__ASSET__img_scoreboard_pngR5y20:img%2Fscoreboard.pnggoR0i403507R1R2R3y22:__ASSET__img_title_pngR5y15:img%2Ftitle.pnggh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


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
