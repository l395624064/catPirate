

package conf
{
    import manager.ConfigManager;

	public class cfg_shop
	{
        public static function init(sheet:Object):cfg_shop
        {
            var a:cfg_shop = new cfg_shop();

            
            a.explain_content=sheet[0];
            
            a.typeId=sheet[1];
            
            a.cost1_num=sheet[2];
            
            a.name=sheet[3];
            
            a.res=sheet[4];
            
            a.cost_type=sheet[5];
            
            a.buyshow=sheet[6];
            
            a.cost2_num=sheet[7];
            
            a.id=sheet[8];
            

			return a;
        }
        public static function instance(key:Object):cfg_shop
		{
            return ConfigManager.getConfObject("cfg_shop",key) as cfg_shop;
		}


        
        public var explain_content:String;
        
        public var typeId:int;
        
        public var cost1_num:Array;
        
        public var name:String;
        
        public var res:String;
        
        public var cost_type:Array;
        
        public var buyshow:int;
        
        public var cost2_num:Array;
        
        public var id:int;
        






	}
}