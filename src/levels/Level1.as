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
		
		override public function readyLevel():void
		{			
			var plat:Platform = new Platform("carpet", 10, 12, layouts.bigSquare );
			plat.addObstacle("dresser", 0, 0);
			this.addChild(plat);
		}
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("carpet", 10, 12, layouts.checkered );
			plats[1] = new Platform("tile", 14, 12, layouts.column );
			plats[2] = new Platform("tile", 20, 12, layouts.row );
			plats[3] = new Platform("carpet", 1, 1, layouts.t);
			plats[4] = new Platform("carpet", 5, 6, layouts.l);
			plats[5] = new Platform("carpet", 20, 4, layouts.checkered);
			plats[6] = new Platform("carpet", 16, 8, layouts.square);
			plats[7] = new Platform("carpet", 2, 20, layouts.bigSquare);
			
			initPlatforms();
			
			var timer:GameTimer = new GameTimer(6000, game);
			this.addChild(timer);
			
			var player:Player = new Player(0,32);
			this.addChild(player);
		}
	}

}