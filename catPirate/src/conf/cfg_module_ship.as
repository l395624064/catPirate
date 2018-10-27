

package conf
{
    import manager.ConfigManager;

	public class cfg_module_ship
	{
        public static function init(sheet:Object):cfg_module_ship
        {
            var a:cfg_module_ship = new cfg_module_ship();

            
            a.explain_content=sheet[0];
            
            a.typeId=sheet[1];
            
            a.property_num=sheet[2];
            
            a.buyshow=sheet[3];
            
            a.name=sheet[4];
            
            a.res=sheet[5];
            
            a.cost_type=sheet[6];
            
            a.cost_num=sheet[7];
            
            a.property_type=sheet[8];
            
            a.id=sheet[9];
            

			return a;
        }
        public static function instance(key:Object):cfg_module_ship
		{
            return ConfigManager.getConfObject("cfg_module_ship",key) as cfg_module_ship;
		}


        
        public var explain_content:String;
        
        public var typeId:int;
        
        public var property_num:Array;
        
        public var buyshow:int;
        
        public var name:String;
        
        public var res:String;
        
        public var cost_type:Array;
        
        public var cost_num:Array;
        
        public var property_type:String;
        
        public var id:int;
        






	}
}