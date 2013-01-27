package levels 
{
	import objects.GameTimer;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	
	public class Level7 extends Level
	{
		
		public function Level7()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("tile", 0, 4, layouts.checkered, true, 1 );
			plats[1] = new Platform("tile", 7, 4, layouts.checkered, false, 2 );
			plats[2] = new Platform("tile", 12, 4, layouts.column, false, 2 );
			plats[3] = new Platform("tile", 14, 1, layouts.checkered, true, 1);
			plats[4] = new Platform("tile", 19, 0, layouts.backwardsBigL, false, 2);
			plats[5] = new Platform("tile", 24, 3, layouts.column, false, 2);
			plats[6] = new Platform("tile", 21, 8, layouts.checkered, true, 1);
			plats[7] = new Platform("tile", 19, 12, layouts.backwardsBigL, false, 2);
			plats[8] = new Platform("tile", 17, 12, layouts.column, false, 2);
			plats[9] = new Platform("tile", 11, 12, layouts.row, false, 2);
			plats[10] = new Platform("tile", 0, 12, layouts.checkered, false, 2);
			plats[11] = new Platform("tile", 0, 16, layouts.checkered, false, 2);

			
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