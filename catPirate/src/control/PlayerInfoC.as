package control {
import conf.cfg_giftbox;

import data.GainnewD;

import laya.utils.Handler;

import manager.ConfigManager;
import manager.GameEvent;
import manager.GameEventDispatch;
import manager.TimeManager;

import model.PlayerInfoM;

public class PlayerInfoC {

    public static var _instance:PlayerInfoC;


    public function PlayerInfoC() {
        //需要存储的信息
        GameEventDispatch.instance.on(GameEvent.ADDwheelNum,this,addWheelNum);
        GameEventDispatch.instance.on(GameEvent.MinuswheelNum,this,minusWheelNum);
        GameEventDispatch.instance.on(GameEvent.ADDwheelNumFromShare,this,addwheelNumFromShare);
        GameEventDispatch.instance.on(GameEvent.ResetwheelNumFromShare,this,resetwheelNumFromShare);

        //计时器
        GameEventDispatch.instance.on(GameEvent.CheckGiftBoxLVUP,this,checkGiftBoxLVUP);
        GameEventDispatch.instance.on(GameEvent.ResetGiftBoxTime,this,checkResetGiftTime);
        GameEventDispatch.instance.on(GameEvent.LoginTime,this,changeGiftBoxTimeState,["start"]);
        GameEventDispatch.instance.on(GameEvent.CheckGiftBoxTime,this,changeGiftBoxTimeState,["update"]);
    }

    public static function get instance():PlayerInfoC
    {
        return _instance||=new PlayerInfoC();
    }


    private function changeGiftBoxTimeState(action:String):void
    {
        if(action=="start"){
            Laya.timer.loop(1000,this,changeGiftBoxTimeState,["update"]);
        }
        else if(action=="update"){
            var _boxDelay:int=PlayerInfoM.instance.getGiftDelay();
            _boxDelay-=1;
            console.log("-_boxDelay:",_boxDelay);
            if(_boxDelay<=0){
                checkResetGiftTime();
            }else{
                PlayerInfoM.instance.setGiftDelay(_boxDelay);
                GameEventDispatch.instance.event(GameEvent.UPdateGiftBoxTime);
            }
        }
        else if(action=="over"){
            var endD:Date=new Date();
            PlayerInfoM.instance.setQuitUnix(endD.getTime());
            Laya.timer.clear(this,changeGiftBoxTimeState);
        }
    }




    private function checkGiftBoxLVUP():void
    {
        var giftMsgArr:Array=ConfigManager.items("cfg_giftbox");
        var lv:int=PlayerInfoM.instance.getGiftLv();

        if(lv>giftMsgArr.length){
            GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:8}]);
        }else{
            PlayerInfoM.instance.setGiftDelay(0);
            Laya.timer.clear(this,changeGiftBoxTimeState);
            GameEventDispatch.instance.event(GameEvent.GainGiftBox,new Handler(this,giftBoxLVUP));
        }
    }
    private function checkResetGiftTime():void
    {
        PlayerInfoM.instance.setGiftDelay(0);
        Laya.timer.clear(this,changeGiftBoxTimeState);
        GameEventDispatch.instance.event(GameEvent.GainGiftBox,new Handler(this,resetGiftBoxTime));
    }


    private function giftBoxLVUP():void
    {
        var lv:int=PlayerInfoM.instance.getGiftLv();
        lv++;
        PlayerInfoM.instance.setGiftlv(lv);//升级礼包等级
        resetGiftBoxTime();//重置礼包时间
        GameEventDispatch.instance.event(GameEvent.UPdateGiftBoxLV);

        changeGiftBoxTimeState("start");
    }

    private function resetGiftBoxTime():void
    {
        var lv:int=PlayerInfoM.instance.getGiftLv();
        var newTime:int=cfg_giftbox.instance(lv+"").delay_time;
        PlayerInfoM.instance.setGiftDelay(newTime);

        changeGiftBoxTimeState("start");
    }







    private function addwheelNumFromShare():void
    {
        //通过分享获得转盘次数
        if(PlayerInfoM.instance.getTodayADDWheelNumFromShare()){
            PlayerInfoM.instance.setTodayADDWheelNumFromShare(0);
            addWheelNum();
        }else{
            GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:6}]);
        }
    }
    private function resetwheelNumFromShare():void
    {
        //重置今日分享
        PlayerInfoM.instance.setTodayADDWheelNumFromShare(1);
    }

    private function addWheelNum():void
    {
        var num:int=PlayerInfoM.instance.getLuckWheelNum();
        num+=1;
        PlayerInfoM.instance.setLuckWheelNum(num);
    }
    private function minusWheelNum():void
    {
        var num:int=PlayerInfoM.instance.getLuckWheelNum();
        num-=1;
        if(num<=0) num=0;
        PlayerInfoM.instance.setLuckWheelNum(num);
    }



}
}
