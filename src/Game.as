package  {
	import flash.utils.getTimer;
	import flash.events.AccelerometerEvent;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
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
	import starling.events.EnterFrameEvent;
	import starling.textures.*;
	import starling.display.Image;
	import manager.Assets;
	
	public class Game extends Sprite
	{
		
		public var allLevels:Vector.<Level> = new Vector.<Level>;
		public var levelIndex:int = 0;
		
		public var beatSwitcher:BeatSwitcher;
		public var layouts:Layouts = new Layouts();
		
		public static var playerX:int;
		public static var playerY:int;
		
		public var startTime:int = getTimer();
		public var lastMod:int = 0;
		public var lastThird:int = 0;
		public var thirdCount:int = 0;
		
		public function Game()
		{
			Assets.playBackground();
			beatSwitcher = new BeatSwitcher(this, 1, 2);
			addEventListener(EnterFrameEvent.ENTER_FRAME,beatTimer);
			initGame();
		}
		
		public function beatTimer(e:starling.events.Event):void
		{
			var elapsedTime:int = getTimer() - startTime;
			var modTime:int = elapsedTime % 1000;
			var thirdTime:int = elapsedTime % 333;
			if ( modTime < lastMod ) { beatSwitcher.flipPlats(); }
			//if ( thirdTime < lastThird ) { thirdCount++; if( thirdCount % 3 == 0){ beatSwitcher.disappearPlats(); } }
			lastMod = modTime;
			lastThird = thirdTime;
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
		
		public function nextLevel():void
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