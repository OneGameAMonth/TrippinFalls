package levels
{
	import starling.display.Sprite;
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	
	public class Level extends Sprite
	{
		protected var layouts:Layouts = new Layouts();
		protected var levelLength:int;
		public var plats:Vector.<Platform> = new Vector.<Platform>;
		public var gameStage:Game;
		
		public function Level() 
		{
			
		}
		
		public function readyLevel(game:Game):void
		{
			
		}
		
		public function initPlatforms():void
		{
			for (var i:int = 0; i < plats.length; i++)
			{
				this.addChild(plats[i]);
				trace(i);
			}
		}
	}
}