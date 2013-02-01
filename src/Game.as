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
	import objects.FreezeCounterUI;
	import starling.core.*
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.KeyboardEvent;
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
		
		public var titleBG:Image;
		public var controlsImg:Image;
		
		public function Game()
		{
			initGame();
		}
		
		public function beatTimer(e:starling.events.Event):void
		{
			var elapsedTime:int = getTimer() - startTime;
			var modTime:int = elapsedTime % 1000;
			var thirdTime:int = elapsedTime % 333;
			if ( modTime < lastMod ) { beatSwitcher.flipPlats(); }
			lastMod = modTime;
			lastThird = thirdTime;
		}
		
		private function initGame():void
		{
			allLevels[0] = new Level1;
			allLevels[1] = new Level2;
			allLevels[2] = new Level3;
			allLevels[3] = new Level4;
			allLevels[4] = new Level5;
			allLevels[5] = new Level6;
			allLevels[6] = new Level7;
			allLevels[7] = new Level8;
			
			titleScreen();
			
		}
		
		private function titleScreen():void
		{
			var atlas:TextureAtlas = Assets.fetchTextureAtlas();
			var title:Texture = atlas.getTexture("titlescreen");
			titleBG = new Image(title);
			var controls:Texture = atlas.getTexture("controls");
			controlsImg = new Image(controls);
			controlsImg.x = 215;
			controlsImg.y = 316;
			addChild(titleBG);
			addChild(controlsImg);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, checkKeys);
			//startLevel();
		}
		
		private function checkKeys(e:KeyboardEvent):void
		{
			switch(e.keyCode) {
				case 13:
					Starling.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, checkKeys);
					removeChild(titleBG);
					removeChild(controlsImg);
					Assets.playBackground();
					beatSwitcher = new BeatSwitcher(this, 1, 2);
					startLevel();
					break;
			}
		}
		
		private function startLevel():void
		{
			addEventListener(EnterFrameEvent.ENTER_FRAME,beatTimer);
			this.addChild(allLevels[levelIndex]);
			allLevels[levelIndex].readyLevel(this);
		}
		
		public function nextLevel():void
		{
			removeChild(allLevels[levelIndex]);
			levelIndex++;
			trace(levelIndex + " WHOA" );
			startLevel();
		}
		
		public function restartGame():void
		{
			removeChild(allLevels[levelIndex]);
			levelIndex = 0;
			Assets.stopBackground();
			initGame();
			//TODO: WHY THE FUCK AM I GETTING A NULL ERROR ON PLAYER??!?!!?!
		}
	}
}