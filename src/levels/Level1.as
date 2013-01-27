package levels 
{
	import objects.Player;
	import objects.Platform;
	import objects.Layouts;
	
	
	public class Level1 extends Level
	{
		public var layouts:Layouts = new Layouts();
		
		public function Level1() 
		{
			super();
		}
		
		override public function readyLevel():void
		{			
			var plat:Platform = new Platform("carpet", 10, 12, layouts.rectangle );
			this.addChild(plat);
			
			var player:Player = new Player();
			this.addChild(player);
		}
	}

}