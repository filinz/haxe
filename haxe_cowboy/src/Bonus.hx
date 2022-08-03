package;

/**
 * Бонусы и финиш
 */
class Bonus extends Entity
{
	public var type:Int; // 1 - финиш, 2 - замедление, 3 - уничтожение

	
	public function new(type:Int) 
	{
		this.type = type;
		switch (type) { 
			case 1: // финиш для героя
				super("bonus/finish");
			case 2: // замедление
				super("bonus/time");
			case 3: // уничтожение всех врагов
				super("bonus/bomb");		
		}
		y = ground;
	}
	
}