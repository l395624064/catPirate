

package conf
{
    import manager.ConfigManager;

	public class cfg_fishhook
	{
        public static function init(sheet:Object):cfg_fishhook
        {
            var a:cfg_fishhook = new cfg_fishhook();

            
            a.typeId=sheet[0];
            
            a.name=sheet[1];
            
            a.bossBaseSpd=sheet[2];
            
            a.res=sheet[3];
            
            a.matchAddSpd=sheet[4];
            
            a.sortId=sheet[5];
            
            a.typeName=sheet[6];
            
            a.freeTime=sheet[7];
            
            a.normalBaseSpd=sheet[8];
            
            a.id=sheet[9];
            
            a.matchBaseSpd=sheet[10];
            

			return a;
        }
        public static function instance(key:Object):cfg_fishhook
		{
            return ConfigManager.getConfObject("cfg_fishhook",key) as cfg_fishhook;
		}


        
        public var typeId:int;
        
        public var name:String;
        
        public var bossBaseSpd:Number;
        
        public var res:String;
        
        public var matchAddSpd:Number;
        
        public var sortId:int;
        
        public var typeName:String;
        
        public var freeTime:int;
        
        public var normalBaseSpd:Number;
        
        public var id:int;
        
        public var matchBaseSpd:Number;
        






	}
}