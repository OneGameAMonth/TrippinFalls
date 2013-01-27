package objects 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import manager.Assets;
	/**
	 * ...
	 * @author ...
	 */
	public class Obstacle 
	{
		public var img:Image;
		public var obWidth:int;
		public var obHeight:int;
		public var isGoal:Boolean;
		
		public var collisionRec:Rectangle;
		
		public function Obstacle( type:String ) 
		{
			var atlas:TextureAtlas = Assets.fetchTextureAtlas();

			var tex:Texture = atlas.getTexture(type);
			obWidth = tex.width
			obHeight = tex.height;
			img = new Image(tex);
			
			if ( type == "goal") { isGoal = true;  }
		}
		//in pixels
		public function setPosition(tX:int, tY:int):void
		{
			collisionRec = new Rectangle(tX, tY, obWidth, obHeight);
			img.x = tX;
			img.y = tY;
		}
		
		public function checkCollision( pnt:Point ):Boolean
		{
			var test:Boolean = false;
			test = collisionRec.containsPoint( pnt );
			if (test) { trace("WOOHOO");  }
			return test;
		}
		
	}

}