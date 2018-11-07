package model {
import manager.ConfigManager;

public class FishM {
    public static var _instance:FishM;

    private var _fishLvObj:Object={
        草莓鱼:1,
        紫薯鱼:1,
        金线鱼:0,
        小丑鱼:0,
        蓝雀鱼:0,
        亲嘴鱼:0,
        苹果鱼:0,
        河豚:0,
        白鹦鱼:0,
        蜜蜂鱼:0,
        孔雀鱼:0,
        彩虹鱼:0,
        红龙鱼:0,
        黄龙鱼:0,
        翻车鱼:0
    };

    public function FishM() {
    }
    public static function get instance():FishM
    {
        return _instance||=new FishM();
    }

    public function set shopFishLvobj(value:Object):void
    {
        _fishLvObj=value;
    }
    public function get shopFishLvobj():Object
    {
        return _fishLvObj;
    }

    public function getFishlvByName(name:String):int
    {
        return _fishLvObj[name];
    }
    public function setFishlvByName(name:String,value:int):void
    {
        _fishLvObj[name]=value;
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
            for(var str:String in _fishLvObj){
                if(_fishLvObj[str]>0 && str==item['name']){
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

    public function checkTypeByName(typeId:int):String
    {
        if(typeId==1001){
            return "fish";
        }

        return "";
    }


}
}
