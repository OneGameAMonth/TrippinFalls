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
		
		public function Player() 
		{
			var atlas:TextureAtlas = Assets.fetchTextureAtlas();
			
			var idleFrames:Texture = atlas.getTexture("player");
			var idleImage:Image = new Image(idleFrames);
			
			_speed = 5;
			
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
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			trace("DUDE");
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
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			trace("WHOA");
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
			trace(this.x + ' ' + this.y);
			if (_arrowKeys["up"] == true && _arrowKeys["down"] == false)
			{
				this.y -= _speed;
			}
			else if (_arrowKeys["down"] == true && _arrowKeys["up"] == false)
			{
				this.y += _speed;
			}
			if (_arrowKeys["left"] == true && _arrowKeys["right"] == false)
			{
				this.x -= _speed;
			}
			else if (_arrowKeys["right"] == true && _arrowKeys["left"] == false)
			{
				this.x += _speed;
			}
		}
	}

}