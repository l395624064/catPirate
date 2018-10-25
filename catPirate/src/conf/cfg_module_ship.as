

package conf
{
    import manager.ConfigManager;

	public class cfg_module_ship
	{
        public static function init(sheet:Object):cfg_module_ship
        {
            var a:cfg_module_ship = new cfg_module_ship();

            
            a.typeId=sheet[0];
            
            a.property_num=sheet[1];
            
            a.name=sheet[2];
            
            a.res=sheet[3];
            
            a.cost_type=sheet[4];
            
            a.cost_num=sheet[5];
            
            a.property_type=sheet[6];
            
            a.id=sheet[7];
            

			return a;
        }
        public static function instance(key:Object):cfg_module_ship
		{
            return ConfigManager.getConfObject("cfg_module_ship",key) as cfg_module_ship;
		}


        
        public var typeId:int;
        
        public var property_num:Array;
        
        public var name:String;
        
        public var res:String;
        
        public var cost_type:Array;
        
        public var cost_num:Array;
        
        public var property_type:String;
        
        public var id:int;
        






	}
}