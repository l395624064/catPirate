package model {
import manager.ConfigManager;

public class FishM {
    public static var _instance:FishM;



    public function FishM() {
    }
    public static function get instance():FishM
    {
        return _instance||=new FishM();
    }


    public function get fishobj():Object
    {
        return PlayerInfoM.instance.getFishLvObj();
    }

    public function getFishlvByName(name:String):int
    {
        return fishobj[name];
    }
    public function setFishlvByName(name:String,value:int):void
    {
        fishobj[name]=value;
    }


    public function getFishObjByName(name:String):Object
    {
        var arr:Array=ConfigManager.filter("cfg_fish",function (item) {
            if(item['name']==name) return true;
        })
        return arr[0];
    }
    public function getWeightByName(name:String):Number
    {
        var fishlv:int=getFishlvByName(name);
        var fishObj:Object=getFishObjByName(name);
        return fishObj['weight_num'][fishlv];
    }
    public function getSortIdByName(name:String):int
    {
        var arr:Array=ConfigManager.filter("cfg_fish",function (item) {
            if(item['name']==name) return true;
        })
        return arr[0]['sortId'];
    }

    public function getFishLuckByName(name:String):Number
    {
        var arr:Array=ConfigManager.filter("cfg_fish",function (item) {
            if(item['name']==name) return true;
        })
        return arr[0]['lucky_num'][getFishlvByName(name)];
    }
    public function getFishAppearMaxByName(name:String):Number
    {
        var arr:Array=ConfigManager.filter("cfg_fish",function (item) {
            if(item['name']==name) return true;
        })
        return arr[0]['appearMax_num'];
    }

    public function getOwnfish():Array
    {
        var arr:Array=ConfigManager.filter("cfg_fish",function (item) {
            for(var str:String in fishobj){
                if(fishobj[str]>0 && str==item['name']){
                    return true;
                }
            }
        });
        return arr;
    }

    public function chineseNameTransform(name:String):String
    {
        var logogram:String;
        switch (name){
            case "草莓鱼":logogram="cmy";
                break;
            case "紫薯鱼":logogram="zsy";
                break;
            case "金线鱼":logogram="jxy";
                break;
            case "小丑鱼":logogram="xcy";
                break;
            case "蓝雀鱼":logogram="lqy";
                break;
            case "亲嘴鱼":logogram="qzy";
                break;
            case "苹果鱼":logogram="pgy";
                break;
            case "河豚":logogram="ht";
                break;
            case "白鹦鱼":logogram="byy";
                break;
            case "蜜蜂鱼":logogram="mfy";
                break;
            case "孔雀鱼":logogram="kqy";
                break;
            case "彩虹鱼":logogram="chy";
                break;
            case "红龙鱼":logogram="hly";
                break;
            case "金龙鱼":logogram="jly";
                break;
            case "翻车鱼":logogram="fcy";
                break;
        }
        return logogram;
    }

    public function checkTypeByTypeId(typeId:int):String
    {
        if(typeId==1001){
            return "fish";
        }
        else if(typeId==1000){
            return "bigfish";
        }
        else if(typeId==1002){
            return "pop";
        }

        return "";
    }

    public function checkComboByName(name:String):Boolean
    {
        var arr:Array=ConfigManager.filter("cfg_fish",function (item) {
            if(item['name']==name) return true;
        })
        return arr[0]['comboAdd'];
    }


}
}
