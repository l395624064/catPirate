

package conf
{
    import manager.ConfigManager;

	public class cfg_currency
	{
        public static function init(sheet:Object):cfg_currency
        {
            var a:cfg_currency = new cfg_currency();

            
            a.res=sheet[0];
            
            a.id=sheet[1];
            
            a.name=sheet[2];
            

			return a;
        }
        public static function instance(key:Object):cfg_currency
		{
            return ConfigManager.getConfObject("cfg_currency",key) as cfg_currency;
		}


        
        public var res:String;
        
        public var id:int;
        
        public var name:String;
        






	}
}