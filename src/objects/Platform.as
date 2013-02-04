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
	import objects.Obstacle;
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
		
		public var hasObstacle:Boolean = false;
		public var obstacle:Obstacle;
		public var platImageVec:Vector.<Image> = new Vector.<Image>;
		
		public var checkOn:Boolean;
		public var beat:int;
		public var frozen:Boolean = false;
		public var frozenByPlayer:Boolean = false;
		
		public function Platform(t:String, unitsRight:int, unitsDown:int, layout:Array, onis:Boolean = true, onBeat:int = 1 ) 
		{
			hasObstacle = false;
			type = t;
			platLayout = layout;
			xCoord = (unitsRight) * 32;
			yCoord = ( (unitsDown ) * 32) + 56;
			checkOn = onis;
			beat = onBeat;
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
			if (checkOn == true) { turnOn(); }
			else { turnOff(); }
		}
		
		public function turnOn():void
		{
			if(!frozen){
				for (var i:int = 0; i < platImageVec.length; i++ )
				{
					platImageVec[i].alpha = 1;
				}
				checkOn = true;
				//if (hasObstacle) { obstacle.img.alpha = 1; }
			}
		}
		
		public function turnOff():void
		{
			if(!frozen){
				for (var i:int = 0; i < platImageVec.length; i++ )
				{
					platImageVec[i].alpha = 0;
				}
				checkOn = false;
				//if (hasObstacle) { obstacle.img.alpha = 0; }
			}
		}
		
		public function hintIn():void // hint the player where this platform will appear
		{
			if(!frozen){
				for (var i:int = 0; i < platImageVec.length; i++ )
				{
					platImageVec[i].alpha = 0.2;
				}
				checkOn = false;
				//if (hasObstacle) { obstacle.img.alpha = 0.2; }
			}
		}
		
		public function setOpacity( alp:Number):void
		{
			if(!frozen){
				for (var i:int = 0; i < platImageVec.length; i++ )
				{
					platImageVec[i].alpha = alp;
				}
			}
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
		
		public function checkObstacleCollision(pnt:Point):int
		{ 
			var obCollision:int = 0;
			if ( hasObstacle )
			{
				obCollision = obstacle.checkCollision( pnt );
			}
			return obCollision;
		}
		
		public function checkFloor(pos:Point):Boolean
		{
			var collision:Boolean = false;
			for (var i:int = 0; i < platImageVec.length; i++)
			{
				var rec:Rectangle = new Rectangle(platImageVec[i].x, platImageVec[i].y, platImageVec[i].width, platImageVec[i].height);
				if (rec.containsPoint(pos) && checkOn)
				{
					collision = true;
				}
			}
			return collision;
		}
		
		//in Relative TILES!!!
		public function addObstacle( type:String, tlX:int, tlY:int, goal:Boolean = false ):void
		{
			hasObstacle = true;
			obstacle = new Obstacle(type);
			obstacle.setPosition( xCoord + ( tlX * 32 ), yCoord + ( tlY * 32 ) );
			addChild(obstacle.img);
			if (goal) { obstacle.setGoal(); }
			if (checkOn == true) { turnOn(); }
			else { turnOff(); }
		}
		
		public function obstacleOpacityMatch():void
		{
			
				if (hasObstacle) { obstacle.img.alpha = platImageVec[0].alpha; }
			
		}
		
		public function freeze(str:String = "default"):Boolean
		{
			var didFreeze:Boolean = false;
			if (!frozen)
			{
				didFreeze = true;
				frozen = true;
				if (str == "player") { frozenByPlayer = true; }
			}
			return didFreeze;
		}
	}

}