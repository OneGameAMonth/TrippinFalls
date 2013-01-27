package objects 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.getTimer;

	public class GameObject extends Sprite
	{
		protected static var objIteration:Number;
		public var label:String;
		protected var isLocked:Boolean = false;
		
		protected var lastFrame:int;
		protected var frameDifference:int;
		
		protected var halfWidth:int;
		protected var halfHeight:int;
		
		public function GameObject() 
		{
			halfWidth = width / 2;
			halfHeight = height / 2;
			this.addEventListener(Event.ENTER_FRAME, updateFrame);
		}
		
		protected function updateFrame(e:Event):void 
		{
			getTime();
		}
		
		protected function getTime():void
		{
			frameDifference = getTimer() - lastFrame;
			lastFrame += frameDifference
		}
		
		protected function initSpriteDimensions():void
		{
			halfWidth = width / 2;
			halfHeight = height / 2;
		}
	}
}