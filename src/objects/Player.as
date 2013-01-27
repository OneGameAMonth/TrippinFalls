package objects 
{
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.geom.Rectangle
	
	import starling.events.Event;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.events.KeyboardEvent;
	import starling.core.Starling;
	
	import manager.Assets;
	import Game;
	import objects.Platform;
	
	public class Player extends GameObject
	{	
		private var _arrowKeys:Dictionary = new Dictionary();
		
		private var _startX:int;
		private var _startY:int;
		private var _speed:int;
		private var _isJumping:Boolean;
		private var _isRising:Boolean;
		private var _isDying:Boolean;
		private var _jumpTimer:int;
		private var _maxJumpTimer:int;
		private var _jumpVelocity:int;
		private var _jumpHeight:int;
		private var _maxJumpHeight:int;
		public var standRect:Rectangle;
		public var standPoint:Point
		
		private var idleImage:Image;
		
		public function Player(xPos:int, yPos:int) 
		{
			var atlas:TextureAtlas = Assets.fetchTextureAtlas();
			
			var idleFrames:Texture = atlas.getTexture("player");
			idleImage = new Image(idleFrames);
			
			_speed = 5;
			_jumpVelocity = -5;
			_jumpHeight = 0;
			_maxJumpHeight = 32;
			_jumpTimer = 1;
			_maxJumpTimer = 2;
			
			_startX = xPos;
			_startY = yPos;
			
			this.x = xPos;
			this.y = yPos;
			
			_arrowKeys["up"] = false;
			_arrowKeys["down"] = false;
			_arrowKeys["left"] = false;
			_arrowKeys["right"] = false;
			
			standRect = new Rectangle(this.x, this.y + 32, 32, 32);
			standPoint = new Point((standRect.x / 2), (standRect.y / 2));
			
			addChild(idleImage);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		override protected function updateFrame(e:Event):void
		{
			movePlayer();
			applyJumpForce();
			checkFloor();
			checkForDeath();
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode) {
				case 87:
					_arrowKeys["up"] = true;
					break;
				case 83:
					_arrowKeys["down"] = true;
					break;
				case 65:
					_arrowKeys["left"] = true;
					break;
				case 68:
					_arrowKeys["right"] = true;
					break;
				case 32:
					jump();
					break
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			switch (e.keyCode) {
				case 87:
					_arrowKeys["up"] = false;
					break;
				case 83:
					_arrowKeys["down"] = false;
					break;
				case 65:
					_arrowKeys["left"] = false;
					break;
				case 68:
					_arrowKeys["right"] = false;
					break;
			}
		}
		
		private function movePlayer():void
		{
			if (_isDying == false)
			{
				if (_arrowKeys["up"] == true && _arrowKeys["down"] == false)
				{
					this.y -= _speed;
					if (this.y < 24)
					{
						this.y = 24;
					}
				}
				else if (_arrowKeys["down"] == true && _arrowKeys["up"] == false)
				{
					this.y += _speed;
					if (this.y > stage.stageHeight - this.height)
					{
						this.y = stage.stageHeight - this.height;
					}
				}
				if (_arrowKeys["left"] == true && _arrowKeys["right"] == false)
				{
					this.x -= _speed;
					if (this.x < 0)
					{
						this.x = 0;
					}
				}
				else if (_arrowKeys["right"] == true && _arrowKeys["left"] == false)
				{
					this.x += _speed;
					if (this.x > stage.stageWidth - this.width)
					{
						this.x = stage.stageWidth - this.width;	
					}
				}
				updateStandRect();
			}
		}
		
		private function updateStandRect():void
		{
			standRect.x = this.x;
			standRect.y = this.y + 32;
			standPoint.x = (standRect.x + (standRect.x + standRect.width)) / 2; 
			standPoint.y = (standRect.y + (standRect.y + standRect.height)) / 2;
		}
		
		private function jump():void
		{
			_isJumping = true;
		}
		
		private function land():void
		{
			_isJumping = false;
			_jumpVelocity = -_jumpVelocity;
		}
		
		private function applyJumpForce():void
		{
			if (_isJumping == true)
			{
				_jumpTimer += 1;
				if (_jumpTimer >= _maxJumpTimer) 
				{
					_jumpTimer = 0;
					idleImage.y += _jumpVelocity;
					_jumpHeight += _jumpVelocity;
					if (_jumpHeight < -_maxJumpHeight)
					{
						_jumpVelocity = - _jumpVelocity;
						_isRising = false;
					}
					if (_jumpHeight >= 0 && _isRising == false)
					{
						_jumpHeight = 0;
						land();
					}
				}
			}
		}
		
		private function checkFloor():void
		{
			if (_isJumping == false)
			{
				var isStanding:Boolean = Platform.checkFloor(standPoint);
				Platform.checkObstacleCollision(standPoint);
				if (isStanding == true)
				{
					//trace("YES");
				}
				else if (isStanding == false)
				if (isStanding == false)
				{
					_isDying = true;
				}
			}
		}
		
		private function checkForDeath():void
		{
			if (_isDying == true)
			{
				this.x = _startX;
				this.y = _startY;
				_isDying = false;
				updateStandRect();
			}
		}
	}
}