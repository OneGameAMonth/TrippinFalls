package levels 
{
	import objects.GameTimer;
	import objects.FreezeCounterUI;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class Level4 extends Level
	{
		
		public function Level4()
		{
			super();
		}
		
		override public function readyLevel(game:Game):void
		{	
			gameStage = game;
			plats[0] = new Platform("carpet", 14, 0, layouts.bigL3, false, 1 );
			plats[1] = new Platform("carpet", 17, 2, layouts.checkered, true, 0 );
			plats[2] = new Platform("carpet", 10, 2, layouts.checkered, true, 0 );
			plats[3] = new Platform("carpet", 8, 6, layouts.bigL3, false, 1);
			plats[4] = new Platform("carpet", 8, 10, layouts.checkered, true, 0);
			plats[5] = new Platform("carpet", 12, 11, layouts.bigL2, false, 1);
			plats[6] = new Platform("carpet", 16, 9, layouts.checkered, true, 0);
			plats[7] = new Platform("carpet", 21, 12, layouts.backwardsBigL, true, 0);
			plats[7].freeze();
			plats[8] = new Platform("carpet", 21, 0, layouts.bigL, true, 0);
			plats[8].freeze();
			
			//last platform added does not appear
			plats[8].addObstacle("dresser", 0, 0, true);
			
			initPlatforms();
			
			var timer:GameTimer = new GameTimer(100000, game);
			this.addChild(timer);
			
			counter = new FreezeCounterUI(freezes);
			this.addChild(counter);
			
			var levelText:TextField = new TextField(80, 50 , "Level: 4", "Arial", 16, Color.RED, true);
			levelText.x = 200;
			this.addChild(levelText);
			
			var goalText:TextField = new TextField(270, 50 , "Goal: Get water from the fridge.", "Arial", 16, Color.RED, true);
			goalText.x = 280;
			this.addChild(goalText);
			
			var player:Player = new Player(24*32,(14*32)+56, this);
			this.addChild(player);
		}
	}

}