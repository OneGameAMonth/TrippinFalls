package objects 
{
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.getTimer;
	import starling.textures.Texture;
	import manager.Assets;
	import starling.textures.TextureAtlas;

	public class GameObject extends Sprite
	{
		protected static var objIteration:Number;
		public var label:String;
		protected var isLocked:Boolean = false;
		
		protected var lastFrame:int;
		protected var frameDifference:int;
		
		protected var halfWidth:int;
		protected var halfHeight:int;
		
		public static var atlas:TextureAtlas = Assets.fetchTextureAtlas();
		//For whatever reason, it freaks out when I try to do this in the asset class, so it sits here for now
		
		public function GameObject() 
		{
			initSpriteDimensions();
			this.addEventListener(Event.ENTER_FRAME, updateFrame);
		}
		
		protected function updateFrame(e:Event):void 
		{
			getTime();
		}
		
		protected function getTime():void
		{
			frameDifference = getTimer() - lastFrame;
			lastFrame += frameDifference
		}
		
		protected function initSpriteDimensions():void
		{
			halfWidth = width / 2;
			halfHeight = height / 2;
		}
		
		protected function loadAnimation(name:String, numFrames:int, isFlipped:Boolean, isLoop:Boolean):MovieClip
		{
			var frames:Vector.<Texture> = atlas.getTextures(name);
			var mClip:MovieClip = new MovieClip(frames, numFrames);
			if (isFlipped)
			{
				mClip.pivotX = Math.ceil(mClip.width);
				mClip.scaleX = -1;
			}
			if (isLoop)
			{
				mClip.loop = true;
			}
			return mClip;
		}
		
		protected function loadImage(name:String):Image
		{
			var texture:Texture = atlas.getTexture(name);
			var img:Image = new Image(texture);
			return img;
		}
	}
}