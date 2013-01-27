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
			allLevels[3] = new Level4;
			allLevels[4] = new Level5;
			allLevels[5] = new Level6;
			allLevels[6] = new Level7;
			allLevels[7] = new Level8;
			
			//A testament to great programming
			/*allLevels[0] = new Level1;
			allLevels[1] = new Level2;
			allLevels[2] = new Level3;
			allLevels[3] = new Level3;
			allLevels[4] = new Level4;
			allLevels[5] = new Level4;
			allLevels[6] = new Level4;
			allLevels[7] = new Level4;
			allLevels[8] = new Level5;
			allLevels[9] = new Level5;
			allLevels[10] = new Level5;
			allLevels[11] = new Level5;
			allLevels[12] = new Level5;
			allLevels[13] = new Level5;
			allLevels[14] = new Level5;
			allLevels[15] = new Level5;
						allLevels[16] = new Level5;
			allLevels[17] = new Level5;
			allLevels[18] = new Level5;
			allLevels[19] = new Level5;
			allLevels[20] = new Level5;
			allLevels[21] = new Level5;
			allLevels[22] = new Level5;
			allLevels[23] = new Level5;
						allLevels[24] = new Level5;
			allLevels[25] = new Level5;
			allLevels[26] = new Level5;
			allLevels[27] = new Level5;
			allLevels[28] = new Level5;
			allLevels[29] = new Level5;
			allLevels[30] = new Level5;
			allLevels[31] = new Level6;
						allLevels[16] = new Level5;
			allLevels[32] = new Level5;
			allLevels[33] = new Level5;
			allLevels[34] = new Level5;
			allLevels[35] = new Level5;
			allLevels[36] = new Level5;
			allLevels[37] = new Level5;
			allLevels[38] = new Level5;
						allLevels[39] = new Level5;
			allLevels[40] = new Level5;
			allLevels[41] = new Level5;
			allLevels[42] = new Level5;
			allLevels[43] = new Level5;
			allLevels[44] = new Level5;
			allLevels[45] = new Level5;
			allLevels[46] = new Level6;
						allLevels[47] = new Level5;
			allLevels[48] = new Level5;
			allLevels[49] = new Level5;
			allLevels[50] = new Level5;
			allLevels[51] = new Level5;
			allLevels[52] = new Level5;
			allLevels[53] = new Level5;
			allLevels[54] = new Level5;
						allLevels[24] = new Level5;
			allLevels[55] = new Level5;
			allLevels[56] = new Level5;
			allLevels[57] = new Level5;
			allLevels[58] = new Level5;
			allLevels[59] = new Level5;
			allLevels[60] = new Level5;
			allLevels[61] = new Level5;
			allLevels[62] = new Level5;
			allLevels[63] = new Level7;
						allLevels[64] = new Level1;
			allLevels[65] = new Level2;
			allLevels[66] = new Level3;
			allLevels[67] = new Level3;
			allLevels[68] = new Level4;
			allLevels[69] = new Level4;
			allLevels[70] = new Level4;
			allLevels[71] = new Level4;
			allLevels[72] = new Level5;
			allLevels[73] = new Level5;
			allLevels[74] = new Level5;
			allLevels[75] = new Level5;
			allLevels[76] = new Level5;
			allLevels[77] = new Level5;
			allLevels[78] = new Level5;
			allLevels[79] = new Level5;
			allLevels[80] = new Level5;
			allLevels[81] = new Level5;
			allLevels[82] = new Level5;
			allLevels[83] = new Level5;
			allLevels[84] = new Level5;
			allLevels[85] = new Level5;
			allLevels[86] = new Level5;
			allLevels[87] = new Level5;
			allLevels[88] = new Level5;
			allLevels[89] = new Level5;
			allLevels[90] = new Level5;
			allLevels[91] = new Level5;
			allLevels[92] = new Level5;
			allLevels[93] = new Level6;
			allLevels[94] = new Level5;
			allLevels[95] = new Level5;
			allLevels[96] = new Level5;
			allLevels[97] = new Level5;
			allLevels[98] = new Level5;
			allLevels[99] = new Level5;
			allLevels[100] = new Level5;
			allLevels[101] = new Level5;
			allLevels[102] = new Level5;
			allLevels[103] = new Level5;
			allLevels[104] = new Level5;
			allLevels[105] = new Level5;
			allLevels[106] = new Level5;
			allLevels[107] = new Level6;
			allLevels[108] = new Level5;
			allLevels[109] = new Level5;
			allLevels[110] = new Level5;
			allLevels[111] = new Level5;
			allLevels[112] = new Level5;
			allLevels[113] = new Level5;
			allLevels[114] = new Level5;
			allLevels[115] = new Level5;
			allLevels[116] = new Level5;
			allLevels[117] = new Level5;
			allLevels[118] = new Level5;
			allLevels[119] = new Level5;
			allLevels[120] = new Level5;
			allLevels[121] = new Level5;
			allLevels[122] = new Level5;
			allLevels[123] = new Level7;
			allLevels[124] = new Level8;
			allLevels[125] = new Level8;
			allLevels[126] = new Level8;
			allLevels[127] = new Level8;
			allLevels[128] = new Level8;
			allLevels[129] = new Level8;
			allLevels[130] = new Level8;
			allLevels[131] = new Level8;
			allLevels[132] = new Level8;*/
			
			
			startLevel();
		}
		
		private function startLevel():void
		{
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
			initGame();
			//TODO: WHY THE FUCK AM I GETTING A NULL ERROR ON PLAYER??!?!!?!
		}
	}
}