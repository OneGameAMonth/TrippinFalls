package objects 
{
	import starling.events.Event
	import flash.utils.getTimer;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class GameTimer extends GameObject
	{
		private var _timerLength:int;
		private var _textTimer:TextField;
		private const _startTimer:int = getTimer();
		private var _endTimer:int;
		private var _xLoc:int;
		private var _yLoc:int;
		private var game:Game;
		
		private var lastSeconds:int = 0;
		
		public function GameTimer(timerLength:int, gameStage:Game) 
		{
			game = gameStage;
			_xLoc = 1200;
			_yLoc = 20;
			_endTimer = _startTimer + timerLength;
			_textTimer = new TextField(_xLoc, _yLoc , "", "Arial", 16, Color.RED, true);
			//TODO: Change to White when background is black
			addChild(_textTimer);
		}
		
		override protected function updateFrame(e:Event):void
		{
			updateTimer();
		}
		
		private function updateTimer():void
		{
			var timeRemaining:String = parseTimeRemaining();
			_textTimer.text = timeRemaining;
		}
		
		private function parseTimeRemaining():String
		{
			var milliseconds:int = _endTimer - getTimer();
			if (milliseconds <= 0)
			{
				game.restartGame();
			}
			var minutes:int = milliseconds / (1000 * 60);
			var seconds:int = (milliseconds % (1000 * 60)) / 1000;
			return (minutes + ':' + seconds);
		}
		
	}

}