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
			plats[0] = new Platform("carpet", 10, 12, layouts.checkered, true, 1 );
			plats[1] = new Platform("tile", 14, 12, layouts.column, false, 2 );
			plats[2] = new Platform("tile", 20, 12, layouts.row, false, 2 );
			plats[3] = new Platform("carpet", 1, 1, layouts.t, true, 1);
			plats[4] = new Platform("carpet", 5, 6, layouts.l, false, 2);
			plats[5] = new Platform("carpet", 20, 4, layouts.checkered, false, 2);
			plats[6] = new Platform("carpet", 16, 8, layouts.square, true, 1);
			plats[7] = new Platform("carpet", 2, 20, layouts.bigSquare, false, 2);
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