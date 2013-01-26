package manager{
	
	import flash.display.Bitmap;
	import flash.media.Sound;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets
	{	
		[Embed(source = "../../assets/img.xml", mimeType = "application/octet-stream")] 
		public static const AtlasXml:Class;
		 
		[Embed(source = "../../assets/img.png")] 
		public static const AtlasTexture:Class;
		
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
	}
}