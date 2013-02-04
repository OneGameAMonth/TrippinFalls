package objects 
{
	import starling.text.TextField;
	import starling.utils.Color;
	import starling.utils.HAlign;
	/**
	 * ...
	 * @author ...
	 */
	public class FreezeCounterUI extends GameObject 
	{
		private var textWidth:int;
		private var textHeight:int;
		private var freezes:int;
		private var textFreezes:TextField;
		
		public function FreezeCounterUI(num:int) 
		{
			textWidth = 100;
			textHeight = 50;
			textFreezes = new TextField(textWidth, textHeight , "", "Arial", 16, Color.RED, true);
			textFreezes.text = "Freezes: " + num;
			textFreezes.hAlign = HAlign.LEFT;
			textFreezes.x = 100;
			freezes = num;
			addChild(textFreezes);
		}
		
		public function setFreezes( num:int ):void
		{
			freezes = num;
			textFreezes.text = "Freezes: " + freezes;
		}
		public function getFreezes():int
		{
			return freezes;
		}
		
		public function decrement():void
		{
			freezes -= 1;
			textFreezes.text = "Freezes: " + freezes;
		}
		
	}

}