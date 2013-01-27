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
			plats[0] = new Platform("carpet", 10, 12, layouts.checkered, true, 0 );
			plats[1] = new Platform("tile", 14, 12, layouts.column, false, 1 );
			plats[2] = new Platform("tile", 20, 12, layouts.row, false, 1 );
			plats[3] = new Platform("carpet", 1, 1, layouts.t, true, 0);
			plats[4] = new Platform("carpet", 5, 6, layouts.l, false, 1);
			plats[5] = new Platform("carpet", 20, 4, layouts.checkered, false, 1);
			plats[6] = new Platform("carpet", 16, 8, layouts.square, true, 0);
			plats[7] = new Platform("carpet", 2, 20, layouts.bigSquare, false, 1);
			//last platform added does not appear
			plats[3].addObstacle("dresser", 0, 2, true);
			
			initPlatforms();
			
			var timer:GameTimer = new GameTimer(13000, game);
			this.addChild(timer);
			
			var player:Player = new Player(0,32, this);
			this.addChild(player);
		}
	}

}