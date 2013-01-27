package objects 
{
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	import starling.events.Event;
	
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.events.KeyboardEvent;
	import starling.core.Starling;
	import manager.Assets;
	import flash.geom.Point;
	
	public class Platform extends GameObject
	{
		
		//reference textures for each tile
		public var nothingImg:Image;
		public var carpetImg:Image;
		public var floorImg:Image;
		
		public var texImg:Image;
		public var type:String;
		public var platLayout:Array;
		public var xCoord:int;
		public var yCoord:int;
		
		public static var platImageVec:Vector.<Image> = new Vector.<Image>;
		
		public function Platform(t:String, unitsRight:int, unitsDown:int, layout:Array ) 
		{
			type = t;
			platLayout = layout;
			xCoord = (unitsRight-1) * 32;
			yCoord = ( (unitsDown-1) * 32) + 56;
			var atlas:TextureAtlas = Assets.fetchTextureAtlas();
			var count:int = 0;
			//THERE HAS TO BE A BETTER WAY!!!
			for (var i:int = 0; i < layout.length; i++)
			{
				for (var j:int = 0; j < layout.length; j++)
				{
					if (layout[i][j] == 1) { 
						count++;
						var tex:Texture = atlas.getTexture(type);
						var temp:Image = new Image(tex);
						temp.x = xCoord + ( j * 32 );
						temp.y = yCoord + ( i * 32 );
						addChild(temp);
						platImageVec.push( temp );
					}
				}
			}
			trace(layout.length);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{ //change texture on keypress
			switch(e.keyCode)
			{
				case 67:
					turnOff();
					break;
				case 86:
					hintIn();
					break;
				case 88:
					turnOn();
					break;
			}
		}
		
		public function turnOn():void
		{
			texImg.alpha = 1.0;
		}
		
		public function turnOff():void
		{
			texImg.alpha = 0;
		}
		
		public function hintIn():void // hint the player where this platform will appear
		{
			texImg.alpha = 0.2;
		}
		
		public function setOpacity( alp:Number):void
		{
			texImg.alpha = alp;
		}
		
		//in Tiles
		public function movePlatform(dX:int, dY:int):void
		{
			for (var i:int = 0; i < platImageVec.length; i++ )
			{
				platImageVec[i].x += dX * 32;
				platImageVec[i].y += dY * 32;
			}
		}
		
		public function checkCollision(x:int, y:int, w:int, h:int):Boolean
		{
			var collision:Boolean = false;
			var rec:Rectangle = new Rectangle(x, y, w, h);
			for (var i:int = 0; i < platImageVec.length; i++ )
			{
				if ( getBounds(platImageVec[i]).intersects(rec) ) { collision = true; };
			}
			return collision;
		}
		
		public static function checkFloor(pos:Point):Boolean
		{
			var collision:Boolean = false;
			for (var i:int = 0; i < platImageVec.length; i++)
			{
				var rec:Rectangle = new Rectangle(platImageVec[i].x, platImageVec[i].y, platImageVec[i].width, platImageVec[i].height);
				if (rec.containsPoint(pos))
				{
					collision = true;
				}
			}
			return collision;
		}
	}

}