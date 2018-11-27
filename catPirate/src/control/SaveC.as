package control {
import data.SaveD;

import laya.utils.Handler;

import manager.GameEvent;
import manager.GameEventDispatch;
import manager.WxManager;

import model.PlayerInfoM;

import src.GameConfig;

public class SaveC {
    public static var _instance:SaveC;

    private var _openid:String;//不开放
    private var _appid:String;

    private var _localSaveData:Object;
    private var _netSaveData:Object;

    private var _localComplete:Boolean;
    private var _netComplete:Boolean;


    private var _nickName:String;//不开放
    /*URL 最后一个数值代表正方形头像大小（有 0、46、64、96、132 数值可选，
    0 代表 640x640 的正方形头像，
    46 表示 46x46 的正方形头像，
    剩余数值以此类推。默认132）*/
    private var _avatarUrl:String;
    /*0:未知 1:男性 2:女性*/
    private var _gender:int;
    private var _province:String;//省份


    public function SaveC() {
        GameEventDispatch.instance.on(GameEvent.GameSaveInit,this,GameSaveInit);
        GameEventDispatch.instance.on(GameEvent.GameSaveRefresh,this,GameSaveRefresh);
    }

    public static function get instance():SaveC
    {
        return _instance||=new SaveC();
    }

    private function CheckSession():void
    {
        //检测登陆态-更新-登录按钮
        //WxManager.instance.checkSession();
    }

    private function GameSaveInit():void
    {
        if(GameConfig.onWeiXin){
            _localComplete=false;
            _netComplete=false;
            WxManager.instance.clodfunc("login",null,Handler.create(this,getloginInfo));
        }else {
            //本地存储方法
        }
    }

    private function getloginInfo(res):void
    {
        _openid=res.result.OPENID;
        _appid=res.result.APPID;


        /*存档检测顺序
        *先检测本地存档
        * -本地存档不存在-检测网络存档-如果能获取到则覆盖本地存档-无法获取则创建新得存档
        * -本地存档存在-覆盖网络存档
        *
        * */
        checksaveInfo("local");
    }

    private function checksaveInfo(state:String):void
    {
        if(state=="local"){
            WxManager.instance.getStorage(_openid,Handler.create(this,getlocalInfo));//检测本地存档
        }
        else if(state=="net"){
            WxManager.instance.getformData(_openid,Handler.create(this,getnetInof));//检测网络存档
        }
    }
    private function getlocalInfo(data:*):void
    {
        _localSaveData=data;
        if(_localSaveData==-1){
            checksaveInfo("net");
        }else{
            _localComplete=true;
            saveDataSync();
        }
    }

    private function getnetInof(data:*):void
    {
        _netSaveData=data;
        if(_netSaveData==-1){
            console.log("-创建新存档");
            //创建用户信息按钮 获取vi等信息
            WxManager.instance.login(Handler.create(this,clickLoginBtn));
        }else{
            _netComplete=true;
            saveDataSync();
        }
    }

    private function saveDataSync():void
    {
        //code=0 存在  code=1不存在
        if(_localComplete || _netSaveData){
            if(_localSaveData!=-1) {
                delete _localSaveData._id;//云端索引
                delete _localSaveData._openid;//云端保留字段
                console.log("-本地存档存在,同步云端");
                WxManager.instance.setformData(_openid,_localSaveData);//同步至数据库
                initGameData(_localSaveData);
            }
            else if(_netSaveData!=-1) {
                console.log("-云端存档存在,同步本地");
                WxManager.instance.setStorage(_openid,_netSaveData);//同步本地
                initGameData(_netSaveData);
            }else{
                //console.log("-创建新存档");
                //创建用户信息按钮 获取vi等信息
                //WxManager.instance.login(Handler.create(this,clickLoginBtn));
            }
        }
    }

    private function clickLoginBtn(data:Object):void
    {
        //console.log("-userInfo:",data);
        _nickName=data.userInfo.nickName;
        _gender=data.userInfo.gender;
        _avatarUrl=data.userInfo.avatarUrl;
        _province=data.userInfo.province;

        creatNewData();
    }


    private function creatNewData():void
    {
        console.log("-creat new savedata over");
        _localSaveData=new SaveD();

        if(_nickName){
            _localSaveData.nickName=_nickName;
            _localSaveData.gender=_gender;
            _localSaveData.avatarUrl=_avatarUrl;
            _localSaveData.province=_province;
        }

        WxManager.instance.setStorage(_openid,_localSaveData);//同步本地
        WxManager.instance.setformData(_openid,_localSaveData);//同步数据库

        initGameData(_localSaveData);//更新playerInfoM
    }







    private function initGameData(data:Object):void
    {
        PlayerInfoM.instance.setGoldNum(data.goldNum);
        PlayerInfoM.instance.setPlankNum(data.plankNum);
        PlayerInfoM.instance.setPearlNum(data.pearlNum);

        //wheelDate:11,wheelNum:1,addshare:2
        var localDate:Date=new Date();
        var quitDate=data.quitUnix;

        var luckDay:int=data.luckwheelObj['day'];
        if(Math.abs(localDate.getDate()-luckDay)>0){
            data.luckwheelObj={day:localDate.getDate(),luckWheelNum:1,todayADDWheelNumFromShare:3,getGiftFromShare:1};
            PlayerInfoM.instance.setluckwheelObj(data.luckwheelObj);
        }else{
            PlayerInfoM.instance.setluckwheelObj(data.luckwheelObj);
        }

        var delay:int=Math.floor((localDate.getTime()/1000)-quitDate);
        console.log("-delay:",delay);
        if(delay>0){
            if(delay>data.giftDelay){
                PlayerInfoM.instance.setGiftDelay(1);
            }else {
                data.giftDelay-=delay;
                PlayerInfoM.instance.setGiftDelay(data.giftDelay);
            }
        }else{
            PlayerInfoM.instance.setGiftDelay(data.giftDelay);
        }

        PlayerInfoM.instance.setQuitUnix(quitDate);//退出时间

        PlayerInfoM.instance.setGiftlv(data.giftLv);
        PlayerInfoM.instance.setGiftArr(data.giftArr);

        PlayerInfoM.instance.setFishLvObj(data.fishLvObj);

        PlayerInfoM.instance.setshipEquipDic(data.shipEquipDic);
        PlayerInfoM.instance.setshopOwnArr(data.shopOwnArr);

        PlayerInfoM.instance.setGameSetting(data.gameSetting);

        PlayerInfoM.instance.setRedPointObj(data.redPointObj);
        PlayerInfoM.instance.setGuide(data.guideComplete);

        PlayerInfoM.instance.setnickName(data.nickName);
        PlayerInfoM.instance.setgender(data.gender);
        PlayerInfoM.instance.setavatarUrl(data.avatarUrl);
        PlayerInfoM.instance.setprovince(data.province);

        PlayerInfoM.instance.setscore(data.score);

        GameEventDispatch.instance.event(GameEvent.StartLoad);
    }

    private function GameSaveRefresh():void
    {
        var data:SaveD=new SaveD();

        data.goldNum=PlayerInfoM.instance.getGoldNum();
        data.plankNum=PlayerInfoM.instance.getPlankNum();
        data.pearlNum=PlayerInfoM.instance.getPearlNum();

        data.luckwheelObj=PlayerInfoM.instance.getluckwheelObj();

        data.giftDelay=PlayerInfoM.instance.getGiftDelay();
        data.quitUnix=Math.floor(new Date().getTime()/1000);
        data.giftLv=PlayerInfoM.instance.getGiftLv();
        data.giftArr=PlayerInfoM.instance.getGiftArr();

        data.fishLvObj=PlayerInfoM.instance.getFishLvObj();

        data.shipEquipDic=PlayerInfoM.instance.getshipEquipDic();
        data.shopOwnArr=PlayerInfoM.instance.getshopOwnArr();

        data.gameSetting=PlayerInfoM.instance.getGameSetting();

        data.redPointObj=PlayerInfoM.instance.getRedPointObj();
        data.guideComplete=PlayerInfoM.instance.getGuide();

        data.province=PlayerInfoM.instance.getprovince();
        data.avatarUrl=PlayerInfoM.instance.getavatarUrl();
        data.gender=PlayerInfoM.instance.getgender();
        data.nickName=PlayerInfoM.instance.getnickName();

        data.score=PlayerInfoM.instance.getscore();

        WxManager.instance.setStorage(_openid,data);//同步本地
    }
}
}
