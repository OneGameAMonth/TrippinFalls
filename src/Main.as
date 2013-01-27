package{

import flash.display.Sprite;
import starling.core.Starling;
import Game;

[SWF(width=800, height=600, frameRate="60", backgroundColor="#ffffff")]
public class Main extends Sprite
	{
		private var _starling:Starling;

		public function Main()
		{
			_starling = new Starling(Game, stage);
			_starling.start();
		}
	}
}