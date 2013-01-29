package levels 
{
	import objects.GameTimer;
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
			plats[0] = new Platform("tile", 3, 2, layouts.column, true, 0 );
			plats[1] = new Platform("tile", 5, 4, layouts.backwardsBigL, false, 1 );
			plats[2] = new Platform("tile", 4, 9, layouts.bigColumn, false, 1 );
			plats[3] = new Platform("tile", 4, 13, layouts.bigRow, true, 0);
			plats[4] = new Platform("tile", 3, 10, layouts.column, false, 1);
			plats[5] = new Platform("tile", 4, 13, layouts.bigL, false, 1);
			plats[6] = new Platform("tile", 8, 16, layouts.row, true, 0);
			plats[7] = new Platform("tile", 11, 14, layouts.bigRow, false, 1);
			plats[8] = new Platform("tile", 15, 11, layouts.column, false, 1);
			plats[9] = new Platform("tile", 20, 7, layouts.bigRow, false, 1);
			plats[10] = new Platform("tile", 21, 4, layouts.backwardsBigL, false, 1);
			plats[11] = new Platform("tile", 7, 0, layouts.checkered, false, 1);
			plats[11] = new Platform("tile", 11, 0, layouts.checkered, false, 1);
			plats[11] = new Platform("tile", 15, 0, layouts.checkered, false, 1);
			plats[11] = new Platform("tile", 19, 0, layouts.bigRow, false, 1);
			//plats[12] = new Platform("tile", 2, 20, layouts.bigSquare, false, 2);
			
			//last platform added does not appear
			plats[3].addObstacle("dresser", 0, 0, true);
			
			initPlatforms();
			
			var timer:GameTimer = new GameTimer(13000, game);
			this.addChild(timer);
			
			var player:Player = new Player(0,32, this);
			this.addChild(player);
		}
	}

}