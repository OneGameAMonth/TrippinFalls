package  {
	import flash.geom.Rectangle;
	import levels.*;
	import objects.BeatSwitcher;
	import objects.GameObject;
	import flash.display.MovieClip;
	import objects.Layouts;
	import objects.Platform;
	import objects.Player;
	import objects.GameTimer;
	import starling.core.*
	import starling.display.Sprite;
	import starling.textures.*;
	import starling.display.Image;
	import manager.Assets;
	
	public class Game extends Sprite
	{
		
		private var allLevels:Vector.<Level> = new Vector.<Level>;
		private var level1:Level1 = new Level1();
		private var level2:Level2 = new Level2();
		private var level3:Level3 = new Level3();
		
		private var level:Level = new Level();
		
		public var beatSwitcher:BeatSwitcher = new BeatSwitcher();
		public var layouts:Layouts = new Layouts();
		
		public function Game()
		{
			Assets.playBackground();
			
			var plat:Platform = new Platform("carpet", 10, 12, layouts.rectangle );
			this.addChild(plat);
			
			allLevels.push(level);
			
			startLevel();
			
			
			//level 1
			
			/*var plat:Platform = new Platform(0, 56, 1);
			var plat2:Platform = new Platform(0, 88, 0);
			var plat3:Platform = new Platform(32, 88, 1);
			var plat4:Platform = new Platform(32, 120, 0);
			var plat5:Platform = new Platform(64, 120, 0);
			
			Platform.addTile(new Rectangle(plat.x, plat.y, plat.width, plat.height));
			Platform.addTile(new Rectangle(plat2.x, plat2.y, plat2.width, plat2.height))
			Platform.addTile(new Rectangle(plat3.x, plat3.y, plat3.width, plat3.height))
			Platform.addTile(new Rectangle(plat4.x, plat4.y, plat4.width, plat4.height))
			Platform.addTile(new Rectangle(plat5.x, plat5.y, plat5.width, plat5.height))
			
			*/
			var player:Player = new Player();
			this.addChild(player);
			
			/*var timer:GameTimer = new GameTimer(60000);
			this.addChild(timer);*/
		}
		
		private function startLevel():void
		{
			this.addChild(allLevels[0]);
			allLevels[0].readyLevel();
		}
	}
}