package levels 
{
	import objects.GameTimer;
	import objects.FreezeCounterUI;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class Level5 extends Level
	{
		
		public function Level5()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("tile", 17, 0, layouts.row, true, 0 );
			plats[1] = new Platform("tile", 12, 0, layouts.row, true, 0 );
			plats[2] = new Platform("tile", 8, 0, layouts.bigSquare, false, 1 );
			plats[3] = new Platform("tile", 5, 4, layouts.row, true, 0);
			plats[4] = new Platform("tile", 1, 4, layouts.row, true, 0);
			plats[5] = new Platform("tile", 0, 5, layouts.bigColumn, false, 1);
			plats[6] = new Platform("tile", 2, 8, layouts.column, true, 0);
			plats[7] = new Platform("tile", 2, 12, layouts.column, true, 0);
			plats[8] = new Platform("tile", 3, 13, layouts.bigSquare, false, 1);
			plats[9] = new Platform("tile", 7, 16, layouts.row, true, 0);
			plats[10] = new Platform("tile", 11, 16, layouts.row, true, 0);
			
			plats[11] = new Platform("tile", 15, 12, layouts.bigSquare, false, 1);
			plats[12] = new Platform("tile", 19, 9, layouts.column, true, 0);
			plats[13] = new Platform("tile", 19, 5, layouts.column, true, 0);
			plats[14] = new Platform("tile", 15, 2, layouts.bigSquare, false, 1);
			plats[15] = new Platform("tile", 12, 6, layouts.row, true, 0);
			plats[16] = new Platform("tile", 8, 6, layouts.row, true, 0);
			plats[17] = new Platform("tile", 5, 7, layouts.checkered, true, 0);
			
			plats[18] = new Platform("tile", 21, 0, layouts.backwardsBigL, true, 0);
			plats[18].freeze();
			plats[19] = new Platform("tile", 9, 7, layouts.square, true, 0);
			plats[19].freeze();
			//last platform added does not appear
			plats[19].addObstacle("microwave", 2, 2, true);
			
			initPlatforms();
			
			var timer:GameTimer = new GameTimer(100000, game);
			this.addChild(timer);
			
			counter = new FreezeCounterUI(freezes);
			this.addChild(counter);
			
			var levelText:TextField = new TextField(80, 50 , "Level: 5", "Arial", 16, Color.RED, true);
			levelText.x = 200;
			this.addChild(levelText);
			
			var goalText:TextField = new TextField(270, 50 , "Goal: Get water from the fridge.", "Arial", 16, Color.RED, true);
			goalText.x = 280;
			this.addChild(goalText);
			
			var player:Player = new Player(24*32,(2*32)+56, this);
			this.addChild(player);
		}
	}

}