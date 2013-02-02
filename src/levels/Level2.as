package levels 
{
	import objects.GameTimer;
	import objects.FreezeCounterUI;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class Level2 extends Level
	{
		
		public function Level2()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("carpet", 0, 0, layouts.bigRow, true, 0 );
			plats[0].freeze();
			plats[1] = new Platform("carpet", 4, 0, layouts.square, true, 0 );
			plats[1].freeze();
			plats[2] = new Platform("carpet", 3, 2, layouts.column, false, 1 );
			plats[3] = new Platform("carpet", 4, 5, layouts.backwardsBigL, true, 0);
			plats[4] = new Platform("carpet", 4, 9, layouts.bigRow, false, 1);
			plats[5] = new Platform("carpet", 3, 10, layouts.column, true, 0);
			plats[6] = new Platform("carpet", 4, 13, layouts.bigL, true, 0);
			plats[7] = new Platform("carpet", 8, 16, layouts.row, true, 0);
			plats[8] = new Platform("carpet", 11, 14, layouts.bigRow, false, 1);
			plats[9] = new Platform("carpet", 15, 11, layouts.column, true, 0);
			plats[10] = new Platform("carpet", 16, 10, layouts.bigRow, false, 1);
			plats[11] = new Platform("carpet", 20, 7, layouts.column, true, 0);
			plats[12] = new Platform("carpet", 21, 4, layouts.bigL2, false, 1);
			plats[13] = new Platform("carpet", 23, 0, layouts.bigColumn, true, 0);
			plats[13].freeze();
			plats[14] = new Platform("carpet", 19, 0, layouts.bigRow, true, 0);
			plats[15] = new Platform("carpet", 7, 0, layouts.checkered, true, 0);
			plats[16] = new Platform("carpet", 11, 0, layouts.checkered, false, 1);
			plats[17] = new Platform("carpet", 15, 0, layouts.checkered, true, 0);
			
			//last platform added does not appear
			plats[0].addObstacle("dresser", 0, 0, true);
			
			initPlatforms();
			
			var timer:GameTimer = new GameTimer(100000, game);
			this.addChild(timer);
			
			counter = new FreezeCounterUI(freezes);
			this.addChild(counter);
			
			var levelText:TextField = new TextField(80, 50 , "Level: 2", "Arial", 16, Color.RED, true);
			levelText.x = 200;
			this.addChild(levelText);
			
			var goalText:TextField = new TextField(270, 50 , "Goal: Get water from the fridge.", "Arial", 16, Color.RED, true);
			goalText.x = 280;
			this.addChild(goalText);
			
			var player:Player = new Player(24*32,(0*32)+56, this);
			this.addChild(player);
		}
	}

}