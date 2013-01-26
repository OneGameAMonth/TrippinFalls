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
	
	public class Player extends GameObject
	{	
		private var _arrowKeys:Dictionary = new Dictionary();
		
		private var _speed:int;
		private var _isJumping:Boolean;
		private var _isRising:Boolean;
		private var _jumpVelocity:int;
		private var _jumpHeight:int;
		private var _maxJumpHeight:int;
		
		private var idleImage:Image;
		
		public function Player() 
		{
			var atlas:TextureAtlas = Assets.fetchTextureAtlas();
			
			var idleFrames:Texture = atlas.getTexture("player");
			idleImage = new Image(idleFrames);
			
			_speed = 5;
			_jumpVelocity = -3
			
			this.x = 100;
			this.y = 100;
			_arrowKeys["up"] = false;
			_arrowKeys["down"] = false;
			_arrowKeys["left"] = false;
			_arrowKeys["right"] = false;
			
			addChild(idleImage);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		override protected function updateFrame(e:Event):void
		{
			movePlayer();
			applyJumpForce();
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
			if (_arrowKeys["up"] == true && _arrowKeys["down"] == false)
			{
				this.y -= _speed;
				if (this.y < 0)
				{
					this.y = 0;
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
		}
		
		private function jump():void
		{
			_jumpVelocity = -3;
			_isJumping = true;
		}
		
		private function land():void
		{
			_isJumping = false;
		}
		
		private function applyJumpForce():void
		{
			if (_isJumping == true)
			{
				idleImage.y += _jumpVelocity;
				_jumpHeight += _jumpVelocity;
				if (_jumpHeight < -_jumpHeight)
				{
					_isRising = false;
				}
				if (_isRising = true)
				{
					_jumpVelocity -= _jumpVelocity / 2;
				}
				else if (_isRising = false)
				{
					_jumpVelocity
				}
				if (_jumpHeight == 0)
				{
					land();
				}
			}
		}
	}

}