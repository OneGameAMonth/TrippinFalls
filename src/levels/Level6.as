package levels 
{
	import objects.GameTimer;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	
	public class Level6 extends Level
	{
		
		public function Level6()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("tile", 24, 3, layouts.column, true, 1 );
			plats[1] = new Platform("tile", 21, 1, layouts.bigRow, false, 2 );
			plats[2] = new Platform("tile", 21, 3, layouts.column, false, 2 );
			plats[3] = new Platform("tile", 18, 7, layouts.bigColumn, true, 1);
			plats[4] = new Platform("tile", 14, 4, layouts.backwardsBigL, false, 2);
			plats[5] = new Platform("tile", 13, 1, layouts.column, false, 2);
			plats[6] = new Platform("tile", 9, 0, layouts.bigRow, true, 1);
			plats[7] = new Platform("tile", 5, 0, layouts.row, false, 2);
			plats[8] = new Platform("tile", 1, 0, layouts.bigRow, false, 2);
			plats[9] = new Platform("tile", 0, 2, layouts.bigL, false, 2);
			plats[10] = new Platform("tile", 5, 4, layouts.checkered, false, 2);
			plats[11] = new Platform("tile", 5, 9, layouts.checkered, false, 2);
			plats[12] = new Platform("tile", 3, 12, layouts.bigColumn, false, 2);
			plats[13] = new Platform("tile", 3, 16, layouts.row, false, 2);
			plats[14] = new Platform("tile", 8, 16, layouts.row, false, 2);
			plats[15] = new Platform("tile", 14, 13, layouts.bigSquare, false, 2);
			plats[16] = new Platform("tile", 20, 13, layouts.bigSquare, false, 2);
			plats[17] = new Platform("tile", 24, 10, layouts.column, false, 2);
			
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