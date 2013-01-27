package levels 
{
	import objects.GameTimer;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	
	public class Level1 extends Level
	{
		
		public function Level1()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{ 
			gameStage = game;
			
			plats[0] = new Platform("tile", 0, 15, layouts.bigRow, true, 0 );
			plats[0].freeze();
			plats[1] = new Platform("tile", 0, 11, layouts.rectangle, true, 0 );
			plats[2] = new Platform("tile", 0, 9, layouts.bigRow, false, 1 );
			plats[3] = new Platform("tile", 4, 9, layouts.square, false, 1 );
			plats[4] = new Platform("tile", 4, 6, layouts.backwardsBigL, true, 0);
			plats[5] = new Platform("tile", 6, 10, layouts.bigL, false, 1);
			plats[6] = new Platform("tile", 4, 2, layouts.bigColumn, false, 1);
			plats[7] = new Platform("tile", 10, 12, layouts.bigRow, true, 0);
			plats[8] = new Platform("tile", 14, 12, layouts.bigRow, false, 1);
			plats[9] = new Platform("tile", 18, 12, layouts.bigRow, false, 1);
			plats[10] = new Platform("tile", 20, 8, layouts.bigColumn, false, 1);
			plats[11] = new Platform("tile", 18, 6, layouts.bigColumn, false, 1);
			plats[12] = new Platform("tile", 18, 2, layouts.bigColumn, false, 1);
			plats[13] = new Platform("tile", 20, 0, layouts.bigSquare, true, 1);
			plats[13].freeze();
			plats[13].addObstacle("refrigerator", 0, 0, true);
			//last platform added does not appear
			plats[4].addObstacle("hatrack", 0, 0, false);
			
			initPlatforms();
			
			var timer:GameTimer = new GameTimer(13000, game);
			this.addChild(timer);
			
			var player:Player = new Player(0,536, this);
			this.addChild(player);
		}
	}

}