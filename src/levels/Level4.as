package levels 
{
	import objects.GameTimer;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	
	public class Level4 extends Level
	{
		
		public function Level4()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("tile", 14, 0, layouts.backwardsBigL, true, 1 );
			plats[1] = new Platform("tile", 17, 2, layouts.checkered, false, 2 );
			plats[2] = new Platform("tile", 10, 2, layouts.checkered, false, 2 );
			plats[3] = new Platform("tile", 8, 6, layouts.backwardsBigL, true, 1);
			plats[4] = new Platform("tile", 8, 10, layouts.checkered, false, 2);
			plats[5] = new Platform("tile", 12, 11, layouts.backwardsBigL, false, 2);
			plats[6] = new Platform("tile", 16, 9, layouts.checkered, true, 1);
			
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