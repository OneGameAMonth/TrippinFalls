package objects 
{
	import flash.utils.Dictionary;
	import flash.geom.Rectangle;
	
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
		
		public static var tiles:Vector.<Rectangle> = new Vector.<Rectangle>;
		
		public function Platform(xLoc:int, yLoc:int, type:int) 
		{
			var atlas:TextureAtlas = Assets.fetchTextureAtlas();
			
			/*var nothingHandle:Texture = atlas.getTexture("nothing");
			var carpetHandle:Texture = atlas.getTexture("carpet");
			var floorHandle:Texture = atlas.getTexture("tile");*/
			
			switch(type) {
				case(0):
					var nothingHandle:Texture = atlas.getTexture("nothing");
					nothingImg = new Image(nothingHandle);
					this.width = nothingImg.width;
					this.height = nothingImg.height;
					addChild(nothingImg);
					break;
				case(1):
					var carpetHandle:Texture = atlas.getTexture("carpet");
					carpetImg = new Image(carpetHandle);
					this.width = carpetHandle.width;
					this.height = carpetHandle.height;
					addChild(carpetImg);
					break;
			}
			
			
			this.x = xLoc;
			this.y = yLoc;
			
			/*nothingImg = new Image(nothingHandle);
			carpetImg = new Image(carpetHandle);
			floorImg = new Image(floorHandle);
			addChild(nothingImg);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);*/
		}
		
		public static function addTile(tile:Rectangle):void
		{
			trace(tile.x, tile.y, tile.width, tile.height);
			tiles.push(tile);
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