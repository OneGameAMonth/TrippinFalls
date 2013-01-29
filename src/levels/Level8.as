package levels 
{
	import objects.GameTimer;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	
	public class Level8 extends Level
	{
		
		public function Level8()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("tile", 0, 0, layouts.backwardsBigL, true, 0 );
			plats[1] = new Platform("tile", 5, 1, layouts.backwardsBigL, false, 1 );
			plats[2] = new Platform("tile", 9, 0, layouts.row, false, 1 );
			plats[3] = new Platform("tile", 17, 0, layouts.column, true, 0);
			plats[4] = new Platform("tile", 19, 0, layouts.bigColumn, false, 1);
			plats[5] = new Platform("tile", 0, 4, layouts.checkered, false, 1);
			plats[6] = new Platform("tile", 0, 10, layouts.bigColumn, true, 0);
			plats[7] = new Platform("tile", 0, 16, layouts.row, false, 1);
			plats[8] = new Platform("tile", 4, 4, layouts.column, false, 1);
			plats[9] = new Platform("tile", 9, 3, layouts.row, false, 1);
			plats[10] = new Platform("tile", 8, 5, layouts.bigSquare, false, 1);
			plats[11] = new Platform("tile", 13, 4, layouts.checkered, false, 1);
			plats[12] = new Platform("tile", 18, 4, layouts.checkered, false, 1);
			plats[13] = new Platform("tile", 21, 8, layouts.backwardsBigL, false, 1);
			plats[14] = new Platform("tile", 12, 10, layouts.backwardsBigL, false, 1);
			plats[15] = new Platform("tile", 12, 24, layouts.row, false, 1);
			plats[16] = new Platform("tile", 19, 24, layouts.row, false, 1);
			plats[17] = new Platform("tile", 24, 10, layouts.column, false, 1);
			
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