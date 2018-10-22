package model 
{
	/**
	 * ...
	 * @author ...
	 */
	public class GamemapM 
	{
		public static var _instance:GamemapM;
		public function GamemapM() 
		{
			
		}
		
		public static function get instance():GamemapM
		{
			return _instance || (_instance = new GamemapM());
		}
		
	}

}