package objects 
{
	/**
	 * ...
	 * @author ...
	 */
	public class BeatSwitcher extends GameObject
	{
		public var game:Game;
		
		private var currentBeat:int;
		private var beatsPerCycle:int;
		private var BPM:int = 60;
		
		public function BeatSwitcher(gam:Game, cBeat:int, bpc:int) 
		{
			game = gam;
			currentBeat = cBeat;
			beatsPerCycle = bpc; 
			
		}
		
		public function flipPlats():void
		{
			currentBeat++;
			for (var i:int = 0; i <  game.allLevels[game.levelIndex].plats.length; i++ )
			{
				if (game.allLevels[game.levelIndex].plats[i].beat == currentBeat) { 
					game.allLevels[game.levelIndex].plats[i].turnOn();
				}
				else if (game.allLevels[game.levelIndex].plats[i].beat == currentBeat+1) { 
					game.allLevels[game.levelIndex].plats[i].hintIn();
				}
				else { 
					game.allLevels[game.levelIndex].plats[i].turnOff();
				}
			}
		}
		public function setBeat( b:int ):void
		{
			currentBeat = b;
		}
		
		public function setCycleLength( bpc:int ):void
		{
			beatsPerCycle = bpc;
		}
		public function reset():void
		{
			
		}
		
	}

}