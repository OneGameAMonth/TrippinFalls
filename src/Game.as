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
		private var levelIndex:int = 0;
		
		public var beatSwitcher:BeatSwitcher = new BeatSwitcher();
		public var layouts:Layouts = new Layouts();
		
		public static var playerX:int;
		public static var playerY:int;
		
		public function Game()
		{
			Assets.playBackground();
			initGame();
		}
		
		private function initGame():void
		{
			allLevels[0] = new Level1;
			allLevels[1] = new Level2;
			allLevels[2] = new Level3;
			
			startLevel();
		}
		
		private function startLevel():void
		{
			trace("WHOA");
			this.addChild(allLevels[levelIndex]);
			allLevels[levelIndex].readyLevel(this);
		}
		
		private function nextLevel():void
		{
			removeChild(allLevels[levelIndex]);
			levelIndex++;
			startLevel();
		}
		
		public function restartGame():void
		{
			removeChild(allLevels[levelIndex]);
			levelIndex = 0;
			initGame();
			//TODO: WHY THE FUCK AM I GETTING A NULL ERROR ON PLAYER??!?!!?!
		}
	}
}