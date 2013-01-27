package levels 
{
	import objects.GameTimer;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	
	public class Level5 extends Level
	{
		
		public function Level5()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("tile", 16, 0, layouts.row, true, 1 );
			plats[1] = new Platform("tile", 12, 0, layouts.column, false, 2 );
			plats[2] = new Platform("tile", 5, 4, layouts.row, false, 2 );
			plats[3] = new Platform("tile", 0, 5, layouts.bigColumn, true, 1);
			plats[4] = new Platform("tile", 2, 8, layouts.column, false, 2);
			plats[5] = new Platform("tile", 2, 12, layouts.row, false, 2);
			plats[6] = new Platform("tile", 3, 13, layouts.bigSquare, true, 1);
			plats[7] = new Platform("tile", 7, 16, layouts.row, false, 2);
			plats[8] = new Platform("tile", 11, 16, layouts.row, false, 2);
			plats[9] = new Platform("tile", 15, 13, layouts.bigSquare, false, 2);
			plats[10] = new Platform("tile", 19, 10, layouts.column, false, 2);
			plats[11] = new Platform("tile", 19, 6, layouts.column, false, 2);
			plats[12] = new Platform("tile", 12, 7, layouts.bigSquare, false, 2);
			plats[13] = new Platform("tile", 8, 7, layouts.bigSquare, false, 2);
			plats[14] = new Platform("tile", 5, 8, layouts.checkered, false, 2);
			
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