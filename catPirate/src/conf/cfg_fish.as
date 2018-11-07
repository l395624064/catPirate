

package conf
{
    import manager.ConfigManager;

	public class cfg_fish
	{
        public static function init(sheet:Object):cfg_fish
        {
            var a:cfg_fish = new cfg_fish();

            
            a.typeId=sheet[0];
            
            a.weight_num=sheet[1];
            
            a.name=sheet[2];
            
            a.appearMax_num=sheet[3];
            
            a.lucky_num=sheet[4];
            
            a.res=sheet[5];
            
            a.sortId=sheet[6];
            
            a.getAward=sheet[7];
            
            a.award_type=sheet[8];
            
            a.anchor_pos=sheet[9];
            
            a.id=sheet[10];
            
            a.award_num=sheet[11];
            

			return a;
        }
        public static function instance(key:Object):cfg_fish
		{
            return ConfigManager.getConfObject("cfg_fish",key) as cfg_fish;
		}


        
        public var typeId:int;
        
        public var weight_num:Array;
        
        public var name:String;
        
        public var appearMax_num:int;
        
        public var lucky_num:Array;
        
        public var res:String;
        
        public var sortId:int;
        
        public var getAward:int;
        
        public var award_type:Array;
        
        public var anchor_pos:Array;
        
        public var id:int;
        
        public var award_num:Array;
        






	}
}