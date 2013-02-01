package levels 
{
	import objects.GameTimer;
	import objects.FreezeCounterUI;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	
	public class Level2 extends Level
	{
		
		public function Level2()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("tile", 0, 0, layouts.bigRow, true, 0 );
			plats[0].freeze();
			plats[1] = new Platform("tile", 4, 0, layouts.square, true, 0 );
			plats[1].freeze();
			plats[2] = new Platform("tile", 3, 2, layouts.column, false, 1 );
			plats[3] = new Platform("tile", 4, 5, layouts.backwardsBigL, true, 0);
			plats[4] = new Platform("tile", 4, 9, layouts.bigRow, false, 1);
			plats[5] = new Platform("tile", 3, 10, layouts.column, true, 0);
			plats[6] = new Platform("tile", 4, 13, layouts.bigL, true, 0);
			plats[7] = new Platform("tile", 8, 16, layouts.row, true, 0);
			plats[8] = new Platform("tile", 11, 14, layouts.bigRow, false, 1);
			plats[9] = new Platform("tile", 15, 11, layouts.column, true, 0);
			plats[10] = new Platform("tile", 16, 10, layouts.bigRow, false, 1);
			plats[11] = new Platform("tile", 20, 7, layouts.column, true, 0);
			plats[12] = new Platform("tile", 21, 4, layouts.bigL2, false, 1);
			plats[13] = new Platform("tile", 23, 0, layouts.bigColumn, true, 0);
			plats[13].freeze();
			plats[14] = new Platform("tile", 19, 0, layouts.bigRow, true, 0);
			plats[15] = new Platform("tile", 7, 0, layouts.checkered, true, 0);
			plats[16] = new Platform("tile", 11, 0, layouts.checkered, false, 1);
			plats[17] = new Platform("tile", 15, 0, layouts.checkered, true, 0);
			
			//last platform added does not appear
			plats[0].addObstacle("dresser", 0, 0, true);
			
			initPlatforms();
			
			var timer:GameTimer = new GameTimer(100000, game);
			this.addChild(timer);
			
			counter = new FreezeCounterUI(freezes);
			this.addChild(counter);
			
			var player:Player = new Player(24*32,(0*32)+56, this);
			this.addChild(player);
		}
	}

}