package  {

	import objects.GameObject;
	import flash.display.MovieClip;
	import objects.Player;
	import starling.core.*
	import starling.display.Sprite;
	import starling.textures.*;
	import starling.display.Image;
	
	public class Game extends GameObject
	{
		private var mainStage:Sprite;
		
		public function Game()
		{
			var player:Player = new Player();
			this.addChild(player);

		}
	}
}