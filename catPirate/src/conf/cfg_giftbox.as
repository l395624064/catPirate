

package conf
{
    import manager.ConfigManager;

	public class cfg_giftbox
	{
        public static function init(sheet:Object):cfg_giftbox
        {
            var a:cfg_giftbox = new cfg_giftbox();

            
            a.explain_content=sheet[0];
            
            a.typeId=sheet[1];
            
            a.name=sheet[2];
            
            a.res=sheet[3];
            
            a.award_type=sheet[4];
            
            a.delay_time=sheet[5];
            
            a.id=sheet[6];
            
            a.award_num=sheet[7];
            

			return a;
        }
        public static function instance(key:Object):cfg_giftbox
		{
            return ConfigManager.getConfObject("cfg_giftbox",key) as cfg_giftbox;
		}


        
        public var explain_content:String;
        
        public var typeId:int;
        
        public var name:String;
        
        public var res:String;
        
        public var award_type:Array;
        
        public var delay_time:int;
        
        public var id:int;
        
        public var award_num:Array;
        






	}
}