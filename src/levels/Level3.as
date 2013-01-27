package levels 
{
	import objects.GameTimer;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	
	public class Level3 extends Level
	{
		
		public function Level3()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("tile", 3, 1, layouts.column, true, 1 );
			plats[1] = new Platform("tile", 3, 7, layouts.column, false, 2 );
			plats[2] = new Platform("tile", 3, 13, layouts.column, false, 2 );
			plats[3] = new Platform("tile", 1, 4, layouts.column, true, 1);
			plats[4] = new Platform("tile", 1, 10, layouts.column, false, 2);
			plats[5] = new Platform("tile", 5, 16, layouts.row, false, 2);
			plats[6] = new Platform("tile", 11, 16, layouts.row, true, 1);
			plats[7] = new Platform("tile", 17, 16, layouts.row, false, 2);
			plats[8] = new Platform("tile", 8, 14, layouts.row, false, 2);
			plats[9] = new Platform("tile", 14, 14, layouts.row, false, 2);
			plats[10] = new Platform("tile", 20, 14, layouts.row, false, 2);
			
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