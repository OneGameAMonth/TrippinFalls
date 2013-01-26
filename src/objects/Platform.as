package objects 
{
	import flash.utils.Dictionary;
	import starling.events.Event;
	
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.events.KeyboardEvent;
	import starling.core.Starling;
	import manager.Assets;
	
	public class Platform extends GameObject
	{
		
		//reference textures for each tile
		public var nothingImg:Image;
		public var carpetImg:Image;
		public var floorImg:Image;
		
		public function Platform() 
		{
			var atlas:TextureAtlas = Assets.fetchTextureAtlas();
			
			var nothingHandle:Texture = atlas.getTexture("nothing");
			var carpetHandle:Texture = atlas.getTexture("carpet");
			var floorHandle:Texture = atlas.getTexture("tile");
			
			nothingImg = new Image(nothingHandle);
			carpetImg = new Image(carpetHandle);
			floorImg = new Image(floorHandle);
			addChild(nothingImg);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{ //change texture on keypress
			switch(e.keyCode)
			{
				case 67:
					addChild(carpetImg);
					break;
			}
		}
		
		public function turnOn():void
		{
			
		}
		
		public function turnOff():void
		{
			
		}
		
		public function hintIn():void // hint the player where this platform will appear
		{
			
		}
	}

}