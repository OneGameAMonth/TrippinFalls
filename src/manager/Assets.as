package manager{
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.media.Sound;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import starling.display.Image;
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets
	{	
		[Embed(source = "../../assets/art/img.xml", mimeType = "application/octet-stream")] 
		public static const AtlasXml:Class;
		 
		[Embed(source = "../../assets/art/img.png")] 
		public static const AtlasTexture:Class;
		
		[Embed(source="../../assets/audio/Trippin' Falls Non-Loop.mp3")]
		public static const snd:Class;
		
		public static var background:Sound = new snd() as Sound; 
        public static var sndChannel:SoundChannel;
		
		public static var titleBackground:Image;
		
		private static var _textures:Dictionary = new Dictionary();
		private static var _textureAtlas:TextureAtlas;
		
		public static function fetchTexture(textureName:String):Texture
		{
			if (_textures[textureName] == undefined)
			{
				if (_textures[textureName] == undefined)
				{
					var data:Object = new Assets[textureName]();
					
					if (data is Bitmap)
					{
						_textures[textureName] = Texture.fromBitmap(data as Bitmap);
					}
					else if (data is ByteArray)
					{
						_textures[textureName] = Texture.fromAtfData(data as ByteArray);
					}
				}
			}
			return _textures[textureName];
		}
		
		public static function fetchTextureAtlas():TextureAtlas
		{
			if (_textureAtlas == null)
			{
				var texture:Texture = fetchTexture("AtlasTexture");
				var xml:XML = XML(new AtlasXml());
				_textureAtlas = new TextureAtlas(texture, xml);
			}
			
			return _textureAtlas;
		}
		
		public static function playBackground():void
		{
			sndChannel = background.play(0, 9999);
		}
		
		public static function stopBackground():void
		{
			sndChannel.stop();
		}
		
		/*public static function loadImage(str:String):void
		{
			var loader:Loader = new Loader();

			// load the texture
			loader.load ( new URLRequest (str) );

			// when texture is loaded
			loader.contentLoaderInfo.addEventListener (, onComplete );
		}
		function onComplete ( e : Event ):void
		{
			// grab the loaded bitmap
			var loadedBitmap:Bitmap = e.currentTarget.loader.content as Bitmap;

			// create a texture from the loaded bitmap
			var texture:Texture = Texture.fromBitmap ( loadedBitmap )
		}*/
	}
}