package model {
import data.SaveD;

public class PlayerInfoM {

    public static var _instance:PlayerInfoM;

    private var _goldNum:int=0;
    private var _plankNum:int=0;
    private var _pearlNum:int=0;

    private var _luckwheelObj:Object={
        day:0,
        luckWheelNum:0,
        todayADDWheelNumFromShare:0,
        getGiftFromShare:0
    };

    private var _giftDelay:int=100;//退出记录
    private var _quitUnix:int;
    private var _giftLv:int=1;
    private var _giftArr:Array=[
        {id:1,num:0},
        {id:2,num:0},
        {id:3,num:0},
        {id:4,num:0},
        {id:5,num:0}
    ];

    private var _fishLvObj:Object={
        草莓鱼:1,
        紫薯鱼:0,
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
        金龙鱼:0,
        翻车鱼:0,
        美人鱼:0
    };

    private var _shipEquipDic:Object={body:401,sail:null,tower:null,cabin:null,fishhook:501};//body sail tower cabin
    private var _shopOwnArr:Array=[15,36];//已购买 shopId



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


    private var _nickName:String;
    private var _gender:int;
    private var _avatarUrl:String;
    private var _province:String;

    private var _score:int=0;

    private var _configShare:Boolean=false;
    private var _configAD:Boolean=true;

    public function PlayerInfoM() {
    }

    public static function get instance():PlayerInfoM
    {
        return _instance || (_instance=new PlayerInfoM());
    }



    public function initConfig(data:Object):void
    {
        _nickName=data.nickName;
        _gender=data.gender;
        _avatarUrl=data.avatarUrl;
        _province=data.province;
    }








    public function getNetConfigShare():Boolean
    {
        return _configShare;
    }
    public function setNetConfigShare(value:Boolean):void
    {
        _configShare=value;
    }
    public function getNetConfigAD():Boolean
    {
        return _configAD;
    }
    public function setNetConfigAD(value:Boolean):void
    {
        _configAD=value;
    }


    public function getscore():int
    {
        return _score;
    }
    public function setscore(value:int):int
    {
        _score=value;
    }
    public function setgender(value:int):void
    {
        _gender=value;
    }
    public function getgender():int
    {
        return _gender;
    }

    public function setavatarUrl(value:String):void
    {
        _avatarUrl=value;
    }
    public function getavatarUrl():String
    {
        return _avatarUrl;
    }

    public function setprovince(value:String):void
    {
        _province=value;
    }
    public function getprovince():String
    {
        return _province;
    }

    public function setnickName(value:String):void
    {
        _nickName=value;
    }
    public function getnickName():String
    {
        return _nickName;
    }




    //set new equip free
    private function checkNewEquip(value:Object):Object
    {
        //add free  fishhook,shopid:36
        if(!value.hasOwnProperty('fishhook')){
            value.fishhook=501;
        }
        return value;
    }
    public function getshipEquipDic():Object
    {
        return _shipEquipDic;
    }
    public function setshipEquipDic(value:Object):void
    {
        _shipEquipDic=checkNewEquip(value);
    }

    public function getshipEquipIdByName(name:String):int
    {
        return _shipEquipDic[name];
    }
    public function setshipEquipIdByName(name:String,shopId:int):void
    {
        if(!_shipEquipDic.hasOwnProperty(name)){
            throw new Error("cant set shipEquip!shipEquip name not fond!");
        }
        _shipEquipDic[name]=shopId;
    }



    //give new shop free pop
    private function giveNewFree(value:Array):Array
    {
        //add free  fishhook,shopid:36
        if(value.indexOf(36)==-1){
            value.push(36);
        }
        return value;
    }
    public function setshopOwnArr(value:Array):void
    {
        _shopOwnArr=giveNewFree(value);
    }
    public function getshopOwnArr():Array
    {
        return _shopOwnArr;
    }
    public function addshopOwn(shopid:int):void
    {
        if(_shopOwnArr.indexOf(shopid)==-1){
            _shopOwnArr.push(shopid);
        }
    }





    public function getGuide():Boolean
    {
        return _guideComplete;
    }
    public function setGuide(value:Boolean):void
    {
        _guideComplete=value;
    }


    public function setRedPointObj(value:Object):void
    {
        _redPointObj=value;
    }
    public function getRedPointObj():Object
    {
        return _redPointObj;
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
    public function setGameSetting(value:Object):void
    {
        _gameSetting=value;
    }

    public function setGiftArr(value:Array):void
    {
        _giftArr=value;
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


    public function setluckwheelObj(value:Object):void
    {
        _luckwheelObj=value;
    }
    public function getluckwheelObj():Object
    {
        return _luckwheelObj;
    }
    public function getTodayADDWheelNumFromShare():int
    {
        return _luckwheelObj['todayADDWheelNumFromShare'];
    }
    public function setTodayADDWheelNumFromShare(value:int):int
    {
        _luckwheelObj['todayADDWheelNumFromShare']=value;
    }
    public function getGiftFromShare():int
    {
        return _luckwheelObj['getGiftFromShare'];
    }
    public function setGiftFromShare(value:int):void
    {
        _luckwheelObj['getGiftFromShare']=value;
    }



    public function setFishLvObj(value:Object):void
    {
        _fishLvObj=value;
    }
    public function getFishLvObj():Object
    {
        return _fishLvObj;
    }

    public function getLuckWheelNum():int
    {
        return _luckwheelObj['luckWheelNum'];
    }
    public function setLuckWheelNum(value:int):void
    {
        _luckwheelObj['luckWheelNum']=value;
    }


    public function getPearlNum():int
    {
        return _pearlNum;
    }
    public function setPearlNum(value:int):void
    {
        _pearlNum=value;
    }

    public function getGoldNum():int
    {
        return _goldNum;
    }
    public function setGoldNum(value:int):void
    {
        _goldNum=value;
    }

    public function getPlankNum():int
    {
        return _plankNum;
    }
    public function setPlankNum(value:int):void
    {
        _plankNum=value;
    }




}
}
