package  {

	import objects.BeatSwitcher;
	import objects.GameObject;
	import flash.display.MovieClip;
	import objects.Platform;
	import objects.Player;
	import objects.GameTimer;
	import starling.core.*
	import starling.display.Sprite;
	import starling.textures.*;
	import starling.display.Image;
	
	public class Game extends GameObject
	{
		private var mainStage:Sprite;
		private var platforms:Array;
		private var beatSwitcher:BeatSwitcher = new BeatSwitcher();
		
		public function Game()
		{
			//level 1
			var plat:Platform = new Platform();
			this.addChild(plat);
			//platforms.push(plat);
			
			var player:Player = new Player();
			this.addChild(player);
			
			var timer:GameTimer = new GameTimer(1000000);
			this.addChild(timer);
			
		}
	}
}