package manager
{
    import conf.manifest;

    public class ConfigManager
    {
        public static const allConfigPath:String = "res/config/config.json";
        public static const allConfigPathMini:String = "res/config/config.json";


        public static var sheet_cache:Object = {}

        public function ConfigManager()
        {

        }

        public static function getConfigPath():String
        {
//            if (WxC.isInMiniGame())
//            {
//                return ConfigManager.allConfigPathMini;
//            }
            return ConfigManager.allConfigPath;
        }

        public static function getClazzBySheetName(sheetName:String):Object
        {
            return manifest.cfg_names[sheetName]
        }

        public static function getConfBySheet(sheetName:String):Object
        {
            return sheet_cache[sheetName];
        }

        public static function init():void
        {
            var dicRes:Object = Laya.loader.getRes(allConfigPath);
            //console.log("-config json load complete:",manifest.cfg_names);
            for (var sheetName:String in manifest.cfg_names)
            {
                var a:Object = {};
                var sheetDicRes:Object = dicRes[sheetName];
                //console.log("-[",sheetName,"]:");
                var cfg:Object = getClazzBySheetName(sheetName);
                for (var key:String in sheetDicRes)
                {
                    a[key] = cfg.init(sheetDicRes[key])
                }
                sheet_cache[sheetName] = a
            }
            console.log("-config json load complete");
        }

        public static function getConfObject(sheetName:String, id:*):Object
        {
            return sheet_cache[sheetName][id];
        }

        public static function getConfValue(sheetName:String, id:*, name:String):Object
        {
            return sheet_cache[sheetName][id][name];
        }

        public static function items(cfg_name:String):Array
        {
            var cfgs:Object = sheet_cache[cfg_name]
            var arr:Array = []
            for (var i in cfgs)
            {
                arr.push(cfgs[i])
            }
            return arr
        }

        public static function filter(cfg_name:String, func:Function, func_sort:Function = null):Array
        {
            var items:Array = ConfigManager.items(cfg_name);

            if (!func)
            {
                return items;
            }
            var arr:Array = [];
            for (var i in items)
            {
                if (func(items[i]))
                {
                    arr.push(items[i])
                }
            }
            arr.sort(func_sort)
            return arr
        }

        public static function groupby(cfg_name:String, field:Object):Object
        {
            var items:Array = ConfigManager.items(cfg_name);
            var d:Object = {};

            for (var i in items)
            {
                var item = items[i];

                var value = item[field];
                if (d[value] === undefined)
                {
                    d[value] = [];
                }
                d[value].push(item)
            }
            return d;
        }

        public static function exist_key(sheetName:String, id:*):Boolean
        {
            if (sheet_cache[sheetName])
            {
                if (sheet_cache[sheetName][id])
                {
                    return true
                } else
                {
                    return false
                }
            } else
            {
                return false
            }
        }

    }

}
