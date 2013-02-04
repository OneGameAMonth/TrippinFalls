package levels 
{
	import objects.GameTimer;
	import objects.FreezeCounterUI;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class Level6 extends Level
	{
		
		public function Level6()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("tile", 24, 3, layouts.column, true, 0 );
			plats[1] = new Platform("tile", 21, 1, layouts.bigRow, false, 1 );
			plats[2] = new Platform("tile", 21, 3, layouts.column, false, 1 );
			plats[3] = new Platform("tile", 18, 7, layouts.bigRow, true, 0);
			plats[4] = new Platform("tile", 14, 4, layouts.backwardsBigL, false, 1);
			plats[5] = new Platform("tile", 13, 1, layouts.column, false, 1);
			plats[6] = new Platform("tile", 9, 0, layouts.bigRow, true, 0);
			plats[7] = new Platform("tile", 5, 0, layouts.row, false, 1);
			plats[8] = new Platform("tile", 1, 0, layouts.bigRow, false, 1);
			plats[9] = new Platform("tile", 0, 2, layouts.bigL, false, 1);
			plats[10] = new Platform("tile", 5, 4, layouts.checkered, false, 1);
			plats[11] = new Platform("tile", 5, 9, layouts.checkered, false, 1);
			plats[12] = new Platform("tile", 3, 12, layouts.bigColumn, false, 1);
			plats[13] = new Platform("tile", 3, 16, layouts.row, false, 1);
			plats[14] = new Platform("tile", 8, 16, layouts.row, false, 1);
			plats[15] = new Platform("tile", 14, 13, layouts.bigSquare, false, 1);
			plats[16] = new Platform("tile", 20, 13, layouts.bigSquare, false, 1);
			plats[17] = new Platform("tile", 24, 10, layouts.column, false, 1);
			plats[18] = new Platform("tile", 3, 12, layouts.bigColumn, false, 1);
			plats[19] = new Platform("tile", 0, 12, layouts.mediumSquare, true, 0);
			plats[19].freeze();
			plats[20] = new Platform("tile", 9, 7, layouts.mediumSquare, true, 0);
			plats[20].freeze();
			//last platform added does not appear
			plats[19].addObstacle("dresser", 0, 0, true);
			
			initPlatforms();
			
			var timer:GameTimer = new GameTimer(100000, game);
			this.addChild(timer);
			
			counter = new FreezeCounterUI(freezes);
			this.addChild(counter);
			
			var levelText:TextField = new TextField(80, 50 , "Level: 6", "Arial", 16, Color.RED, true);
			levelText.x = 200;
			this.addChild(levelText);
			
			var goalText:TextField = new TextField(270, 50 , "Goal: Get water from the fridge.", "Arial", 16, Color.RED, true);
			goalText.x = 280;
			this.addChild(goalText);
			
			var player:Player = new Player(9*32,(7*32)+56, this);
			this.addChild(player);
		}
	}

}