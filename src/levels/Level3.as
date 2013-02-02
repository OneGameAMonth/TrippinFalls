package levels 
{
	import objects.GameTimer;
	import objects.FreezeCounterUI;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class Level3 extends Level
	{
		
		public function Level3()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("carpet", 0, 0, layouts.square, true, 0 );
			plats[0].freeze();
			plats[1] = new Platform("carpet", 3, 1, layouts.column, true, 0 );
			plats[2] = new Platform("carpet", 3, 7, layouts.column, true, 0 );
			plats[3] = new Platform("carpet", 3, 13, layouts.column, true, 0 );
			plats[4] = new Platform("carpet", 1, 4, layouts.column, false, 1);
			plats[5] = new Platform("carpet", 1, 10, layouts.column, false, 1);
			plats[6] = new Platform("carpet", 5, 16, layouts.row, false, 1);
			plats[7] = new Platform("carpet", 11, 16, layouts.row, false, 1);
			plats[8] = new Platform("carpet", 17, 16, layouts.row, false, 1);
			plats[9] = new Platform("carpet", 8, 14, layouts.row, true, 0);
			plats[10] = new Platform("carpet", 14, 14, layouts.row, true, 0);
			plats[11] = new Platform("carpet", 20, 14, layouts.row, true, 0);
			plats[12] = new Platform("carpet", 23, 15, layouts.square, true, 0);
			plats[12].addObstacle("hatrack", 0, 0, true);
			plats[12].freeze();
			
			initPlatforms();
			
			freezes = 0;
			var timer:GameTimer = new GameTimer(100000, game);
			this.addChild(timer);
			
			counter = new FreezeCounterUI(freezes);
			this.addChild(counter);
			
			var levelText:TextField = new TextField(80, 50 , "Level: 3", "Arial", 16, Color.RED, true);
			levelText.x = 200;
			this.addChild(levelText);
			
			var goalText:TextField = new TextField(270, 50 , "Goal: Get water from the fridge.", "Arial", 16, Color.RED, true);
			goalText.x = 280;
			this.addChild(goalText);
			
			var player:Player = new Player(0*32,(0*32)+56, this);
			this.addChild(player);
		}
	}

}