package objects 
{
	import flash.geom.Point;
	import flash.system.ImageDecodingPolicy;
	import flash.utils.Dictionary;
	import flash.geom.Rectangle
	import levels.Level;
	
	import starling.events.Event;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.events.KeyboardEvent;
	import starling.core.Starling;
	import starling.display.MovieClip;
	
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
		public var currentLevel:Level;
		
		private var rightIdle:MovieClip;
		private var leftIdle:MovieClip;
		private var backIdle:MovieClip;
		private var forwardIdle:MovieClip;
		
		private var walkLeftMovie:MovieClip;
		private var walkBackMovie:MovieClip;
		private var walkForwardMovie:MovieClip;
		private var walkRightMovie:MovieClip;
		private var fallMovie:MovieClip;
		private var movieVector:Vector.<MovieClip>;
		private var animationState:int;
		private var newAnimationState:int;
		private const WALK_FORWARD:int = 0;
		private const WALK_BACK:int = 1;
		private const WALK_RIGHT:int = 2;
		private const WALK_LEFT:int = 3;
		private const FALLING:int = 4;
		private const IDLE_FORWARD: int = 5;
		private const IDLE_BACK:int = 6;
		private const IDLE_RIGHT:int = 7;
		private const IDLE_LEFT:int = 8;
		
		
		private var lastPos:Array = new Array(2);
		
		private var idleImage:Image;
		
		public function Player(xPos:int, yPos:int, cLevel:Level) 
		{
			var atlas:TextureAtlas = Assets.fetchTextureAtlas();
			
			var rightFrames:Vector.<Texture> = atlas.getTextures("Side_Walk/000");
			walkRightMovie = new MovieClip(rightFrames, 7);
			walkRightMovie.loop = true;
			
			var leftFrames:Vector.<Texture> = atlas.getTextures("Side_Walk/000");
			walkLeftMovie = new MovieClip(leftFrames, 7);
			var lastP:int = walkLeftMovie.pivotX;
			walkLeftMovie.pivotX = Math.ceil(walkLeftMovie.width);
			walkLeftMovie.scaleX = -1;
			walkLeftMovie.loop = true;
			
			var forwardFrames:Vector.<Texture> = atlas.getTextures("Front_Walk/000");
			walkForwardMovie = new MovieClip(forwardFrames, 6);
			walkForwardMovie.loop = true;
			
			var backFrames:Vector.<Texture> = atlas.getTextures("Back_Walk/000");
			walkBackMovie = new MovieClip(backFrames, 6);
			walkBackMovie.loop = true;
			
			var rightIdleFrames:Vector.<Texture> = atlas.getTextures("Side_Idel/0000");
			rightIdle = new MovieClip(rightIdleFrames, 1);
			rightIdle.loop = false;
			
			var leftIdleFrames:Vector.<Texture> = atlas.getTextures("Side_Idel/0000");
			leftIdle = new MovieClip(leftIdleFrames);
			leftIdle.pivotX = Math.ceil(leftIdle.width);
			leftIdle.scaleX = -1;
			leftIdle.loop = false;
			
			var backIdleFrames:Vector.<Texture> = atlas.getTextures("Front_Idel/0000");
			backIdle = new MovieClip(backIdleFrames, 1);
			backIdle.loop = false;
			
			var forwardIdleFrames:Vector.<Texture> = atlas.getTextures("Back_Idel/0000");
			forwardIdle = new MovieClip(forwardIdleFrames, 1);
			forwardIdle.loop = false;
			
			var fallFrames:Vector.<Texture> = atlas.getTextures("Fall/000");
			fallMovie = new MovieClip(backFrames, 5);
			fallMovie.loop = false;
			
			movieVector = new Vector.<MovieClip>();
			movieVector[WALK_FORWARD] = walkForwardMovie;
			movieVector[WALK_BACK] = walkBackMovie;
			movieVector[WALK_RIGHT] = walkRightMovie;
			movieVector[WALK_LEFT] = walkLeftMovie;
			movieVector[FALLING] = fallMovie;
			movieVector[IDLE_FORWARD] = forwardIdle;
			movieVector[IDLE_BACK] = backIdle;
			movieVector[IDLE_RIGHT] = rightIdle;
			movieVector[IDLE_LEFT] = leftIdle;
			
			animationState = WALK_FORWARD;
			newAnimationState = WALK_FORWARD;
			Starling.juggler.add(movieVector[animationState]);
			
			/*var idleFrames:Texture = atlas.getTexture("player");
			idleImage = new Image(idleFrames);*/
			
			currentLevel = cLevel;
			
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
			addChild(movieVector[animationState]);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		override protected function updateFrame(e:Event):void
		{
			movePlayer();
			applyJumpForce();
			checkFloor();
			checkForDeath();
			changeAnimation();
		}
		
		private function changeAnimation():void
		{
			if (animationState != newAnimationState)
			{
				removeChild(movieVector[animationState]);
				Starling.juggler.remove(movieVector[animationState]);
				
				animationState = newAnimationState;
					addChild(movieVector[animationState]);
				Starling.juggler.add(movieVector[animationState]);
				
			}
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
			var isIdle:Boolean
			if (_arrowKeys["up" ] == false && _arrowKeys["down"] == false
				&& _arrowKeys["left"] == false && _arrowKeys["right"] == false)
				{
					isIdle = true;
				}
			switch (e.keyCode) {
				case 87:
					_arrowKeys["up"] = false;
					if (isIdle = true)
					{
						newAnimationState = 5;
					}
					break;
				case 83:
					_arrowKeys["down"] = false;
					{
						newAnimationState = 6;
					}
					break;
				case 65:
					_arrowKeys["left"] = false;
					{
						newAnimationState = 8;
					}
					break;
				case 68:
					_arrowKeys["right"] = false;
					{
						newAnimationState = 7;
					}
					break;
			}
		}
		
		private function movePlayer():void
		{
			
			if (_isDying == false)
			{
				var move:Boolean = true;
				for (var i:int = 0; i < currentLevel.plats.length; i++ )
				{
					if ( currentLevel.plats[i].checkObstacleCollision(standPoint) == 1 ) { move = false; }
					if ( currentLevel.plats[i].checkObstacleCollision(standPoint) == 2 ) { checkForGoal(); }
				}
				if (move) { lastPos[0] = this.x; lastPos[1] = this.y; }
				if (_arrowKeys["up"] == true && _arrowKeys["down"] == false && move)
				{
					this.y -= _speed;
					newAnimationState = WALK_BACK;
					if (this.y < 24)
					{
						this.y = 24;
					}
					
				}
				else if (_arrowKeys["down"] == true && _arrowKeys["up"] == false)
				{
					this.y += _speed;
					newAnimationState = WALK_FORWARD;
					if (this.y > stage.stageHeight - this.height)
					{
						this.y = stage.stageHeight - this.height;
					}
				}
				if (_arrowKeys["left"] == true && _arrowKeys["right"] == false)
				{
					this.x -= _speed;
					
					newAnimationState = WALK_LEFT;

					if (this.x < 0)
					{
						this.x = 0;
					}
				}
				else if (_arrowKeys["right"] == true && _arrowKeys["left"] == false)
				{
					this.x += _speed;
					newAnimationState = WALK_RIGHT;
					if (this.x > stage.stageWidth - this.width)
					{
						this.x = stage.stageWidth - this.width;	
					}
				}
				updateStandRect();
				if (!move) { this.x = this.lastPos[0]; this.y = this.lastPos[1]; }
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
					movieVector[animationState].y += _jumpVelocity;
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
				var isStanding:Boolean = false;
				if ( animationState == WALK_LEFT ) { standPoint.x -= Math.ceil(walkLeftMovie.width); }
				for (var i:int = 0; i <  currentLevel.plats.length; i++ )
				{
					if ( currentLevel.plats[i].checkFloor(standPoint) ) { isStanding = true; }
					//currentLevel.plats[i].checkObstacleCollision(standPoint);
				}
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
				//newAnimationState = FALLING;
				this.x = _startX;
				this.y = _startY;
				_isDying = false;
				updateStandRect();
			}
		}
		
		private function checkForGoal():void
		{
			Starling.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			Starling.current.stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			currentLevel.goToNextLevel();
		}

	}
}