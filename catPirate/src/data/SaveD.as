package data {
public class SaveD {

    public var goldNum:int=0;
    public var plankNum:int=0;
    public var pearlNum:int=0;

    public var luckwheelObj:Object={day:0,luckWheelNum:1,todayADDWheelNumFromShare:3,getGiftFromShare:1};

    public var giftDelay:int=100;//退出记录
    public var quitUnix:int=Math.floor(new Date().getTime()/1000);
    public var giftLv:int=1;
    public var giftArr:Array=[
        {id:1,num:0},
        {id:2,num:0},
        {id:3,num:0},
        {id:4,num:0},
        {id:5,num:0}
    ];

    public var fishLvObj:Object={
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

    public var shipEquipDic:Object={body:401,sail:null,tower:null,cabin:null};//body sail tower cabin
    public var shopOwnArr:Array=[15];//已购买 shopId


    public var gameSetting:Object={
        music:true,
        sound:true,
        shake:true
    };

    public var redPointObj:Object={
        Timegift:false,
        Boxlibs:false,
        Luckwheel:false,
        Friendrank:false
    };

    public var guideComplete:Boolean=false;


    public var nickName:String;
    public var gender:int;
    public var avatarUrl:String;
    public var province:String;


    public function SaveD() {
    }



}
}
