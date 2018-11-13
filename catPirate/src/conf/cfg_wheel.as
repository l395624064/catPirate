

package conf
{
    import manager.ConfigManager;

	public class cfg_wheel
	{
        public static function init(sheet:Object):cfg_wheel
        {
            var a:cfg_wheel = new cfg_wheel();

            
            a.typeId=sheet[0];
            
            a.name=sheet[1];
            
            a.wheel_Id=sheet[2];
            
            a.res=sheet[3];
            
            a.award_type=sheet[4];
            
            a.id=sheet[5];
            
            a.award_num=sheet[6];
            

			return a;
        }
        public static function instance(key:Object):cfg_wheel
		{
            return ConfigManager.getConfObject("cfg_wheel",key) as cfg_wheel;
		}


        
        public var typeId:int;
        
        public var name:String;
        
        public var wheel_Id:Array;
        
        public var res:String;
        
        public var award_type:Array;
        
        public var id:int;
        
        public var award_num:Array;
        






	}
}