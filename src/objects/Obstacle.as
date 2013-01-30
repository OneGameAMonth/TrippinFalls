package objects 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import manager.Assets;
	
	public class Obstacle extends GameObject
	{
		public var img:Image;
		public var obWidth:int;
		public var obHeight:int;
		public var isGoal:Boolean = false;
		
		public var collisionRec:Rectangle;
		
		public function Obstacle( type:String ) 
		{
			img = loadImage(type);
			obWidth = img.width;
			obHeight = img.height;
		}
		//in pixels
		public function setPosition(tX:int, tY:int):void
		{
			collisionRec = new Rectangle(tX, tY, obWidth, obHeight);
			img.x = tX;
			img.y = tY;
		}
		
		public function checkCollision( pnt:Point ):int
		{
			var test:int = 0;
			if (collisionRec.containsPoint( pnt ) ) { 
				test = 1;
				if (isGoal) { 
					test = 2;
				}
			}
			return test;
		}
		
		public function setGoal():void
		{
			isGoal = true;
		}
		
	}

}