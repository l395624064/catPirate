package model {
public class PlayerInfoM {

    public static var _instance:PlayerInfoM;

    private var _goldNum:Number=1000;
    private var _plankNum:Number=1000;
    private var _pearlNum:Number=1000;

    private var _luckWheelNum:int=1;
    private var _todayADDWheelNumFromShare:int=1;

    private var _giftDelay:int=10;
    private var _quitUnix:int=1541845143000;
    private var _giftLv:int=1;
    private var _giftArr:Array=[
        {id:1,num:1},
        {id:2,num:1},
        {id:3,num:1},
        {id:4,num:1},
        {id:5,num:1}
    ];

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
        翻车鱼:0,
        美人鱼:0
    };

    private var _gameSetting:Object={
        music:true,
        sound:true,
        shake:true
    };

    private var _redPointObj:Object={
        Timegift:false,
        Boxlibs:false,
        Luckwheel:false,
        Friendrank:false
    };

    private var _guideComplete:Boolean=false;

    public function PlayerInfoM() {
    }

    public static function get instance():PlayerInfoM
    {
        return _instance || (_instance=new PlayerInfoM());
    }

    public function getGuide():Boolean
    {
        return _guideComplete;
    }
    public function setGuide(value:Boolean):void
    {
        _guideComplete=value;
    }

    public function getRedPointByName(name:String):Boolean
    {
        return _redPointObj[name];
    }
    public function setRedPointByName(name:String,value:Boolean):void
    {
        _redPointObj[name]=value;
    }
    public function getGameSetting():Object
    {
        return _gameSetting;
    }
    public function setGameSetting(value:Object):Object
    {
        _gameSetting=value;
    }

    public function getGiftArr():Array
    {
        return _giftArr;
    }
    public function getGiftNumById(id:int):int
    {
        return _giftArr[id-1].num;
    }
    public function setGiftNumById(id:int,num:int):void
    {
        _giftArr[id-1].num=num;
    }

    public function getGiftLv():int
    {
        return _giftLv;
    }
    public function setGiftlv(value:int):void
    {
        _giftLv=value;
    }

    public function getGiftDelay():int
    {
        return _giftDelay;
    }
    public function setGiftDelay(value:int):void
    {
        _giftDelay=value;
    }

    public function getQuitUnix():int
    {
        return _quitUnix;
    }
    public function setQuitUnix(value:int):void
    {
        _quitUnix=value;
    }

    public function getTodayADDWheelNumFromShare():int
    {
        return _todayADDWheelNumFromShare;
    }
    public function setTodayADDWheelNumFromShare(value:int):int
    {
        _todayADDWheelNumFromShare=value;
    }


    public function getFishLvObj():Object
    {
        return _fishLvObj;
    }

    public function getLuckWheelNum():int
    {
        return _luckWheelNum;
    }
    public function setLuckWheelNum(value:int):int
    {
        _luckWheelNum=value;
    }


    public function getPearlNum():Number
    {
        return _pearlNum;
    }
    public function setPearlNum(value:Number):void
    {
        _pearlNum=value;
    }

    public function getGoldNum():Number
    {
        return _goldNum;
    }
    public function setGoldNum(value:Number):void
    {
        _goldNum=value;
    }

    public function getPlankNum():Number
    {
        return _plankNum;
    }
    public function setPlankNum(value:Number):void
    {
        _plankNum=value;
    }




}
}
