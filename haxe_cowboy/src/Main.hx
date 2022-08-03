package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;

/**
 * Cowboy game
 */
class Main extends Sprite 
{
	public var titleScreen:TitleScreen;
	public var rulesScreen:RulesScreen;
	public var gameoverScreen:GameoverScreen;
	
	public var game:Game;
	
	public function new() {
		super();
		
		titleScreen = new TitleScreen();		
		addChild(titleScreen);
		titleScreen.addEventListener("START", clickStart); 
		titleScreen.addEventListener("RULES", clickRules); 
		titleScreen.visible = true;
		
		rulesScreen = new RulesScreen();
		addChild(rulesScreen);
		rulesScreen.addEventListener("BACK", clickBack); 
		rulesScreen.visible = false;
	}

	
	public function clickStart(e:Event) { // старт
		titleScreen.visible = false;
		rulesScreen.visible = false;
		
		game = new Game();

		game.addEventListener("QUIT", clickQuit);
		game.addEventListener("GAMEOVER", gameOver);
		
		addChild(game);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, game.keyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, game.keyUp);
	}
	
	
	public function clickRules(e:Event) { // правила игры
		rulesScreen.visible = true;
		titleScreen.visible = false;
	}
	
	
	public function clickBack(e:Event) { // выход из правил на начальный экран
		titleScreen.visible = true;
		rulesScreen.visible = false;
	}
	
	
	public function clickAgain(e:Event) { // конец игры - запустить игру снова
		if (gameoverScreen != null && contains(gameoverScreen)) {
			removeChild(gameoverScreen); 
			gameoverScreen.destroy();
		}
		
		removeChild(game);
		game.destroy();
		game = null;
		
		clickStart(null);
	}
	
	
	public function clickQuit(e:Event) { // конец игры - выйти на начальный экран
		if (gameoverScreen != null && contains(gameoverScreen)) {
			removeChild(gameoverScreen); 
			gameoverScreen.destroy();
		}
		
		removeChild(game);
		game.destroy();
		game = null;
		
		titleScreen.visible = true;
	}
	
	
	public function gameOver(e:Event) { // конец игры
		var win:Bool = false;
		if (game.hero.health > 0) {
			win = true;
			game.paused = true;
		}
		game.buttonPause.visible = false;
		game.buttonQuit.visible = false;
		game.hud.visible = false;
		
		game.removeEventListener("GAMEOVER", gameOver);
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, game.keyDown);
		stage.removeEventListener(KeyboardEvent.KEY_UP, game.keyUp);
		
		gameoverScreen = new GameoverScreen(win, game.score);
		addChild(gameoverScreen);
		
		gameoverScreen.addEventListener("AGAIN", clickAgain); 
		gameoverScreen.addEventListener("QUIT", clickQuit); 
	}	
}
