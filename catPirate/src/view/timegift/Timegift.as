package view.timegift {
import conf.cfg_giftbox;
import conf.cfg_tip;

import control.GameTimeC;

import data.GainnewD;

import laya.events.Event;
import laya.utils.Handler;

import manager.ConfigManager;

import manager.GameEvent;

import manager.GameEventDispatch;
import manager.TimeManager;

import manager.UiManager;
import manager.WxManager;

import model.PlayerInfoM;

import ui.TimeGiftUI;
import view.PanelVo;

public class Timegift extends TimeGiftUI implements PanelVo{
    public static var _instance:Timegift;

    private var _delay:int=0;

    public function Timegift() {
        super();
    }
    public static function get instance():Timegift
    {
        return _instance||=new Timegift();
    }

    public function openPanel(param:Object=null):void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Timegift");
        });

        lvupBtn.on(Event.MOUSE_DOWN,this,giftLVUP);
        getBtn.on(Event.MOUSE_DOWN,this,giftGet);

        updateTime();//初始化
        updateGiftLV();
        Laya.timer.once(200,this,function () {
            //GameEventDispatch.instance.event(GameEvent.CheckGiftBoxTime);
            GameEventDispatch.instance.event(GameEvent.StartLoopTime);
        });
    }

    private function giftLVUP():void
    {
        //调取微信分享接口-完成后
        checkGiftBoxLVUP();
    }

    private function giftGet():void
    {
        WxManager.instance.shareApp(Handler.create(this,function () {
            GameEventDispatch.instance.event(GameEvent.MinusBoxTime);
            GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:12}]);
        }))
        //观看视频-完成后
    }

    private function checkGiftResetTime():void
    {
        GameEventDispatch.instance.event(GameEvent.StopGiftBoxTime);
        gainGiftBox(Handler.create(this,resetGiftBoxTime));
    }



    private function checkGiftBoxLVUP():void
    {
        var giftMsgArr:Array=ConfigManager.items("cfg_giftbox");
        var lv:int=PlayerInfoM.instance.getGiftLv();

        if(lv>=giftMsgArr.length){
            GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:8}]);
        }else{
            GameEventDispatch.instance.event(GameEvent.StopGiftBoxTime);
            PlayerInfoM.instance.setGiftDelay(0);
            gainGiftBox(Handler.create(this,giftBoxLVUP));
        }
    }
    private function giftBoxLVUP():void
    {
        var lv:int=PlayerInfoM.instance.getGiftLv();
        lv++;
        PlayerInfoM.instance.setGiftlv(lv);//升级礼包等级
        updateGiftLV();
        resetGiftBoxTime();//重置礼包时间
    }
    private function resetGiftBoxTime():void
    {
        var lv:int=PlayerInfoM.instance.getGiftLv();
        var newTime:int=cfg_giftbox.instance(lv+"").delay_time;
        PlayerInfoM.instance.setGiftDelay(newTime);

        GameEventDispatch.instance.event(GameEvent.StartLoopTime,"start");
    }




    private function gainGiftBox(handler:Handler):void
    {
        var giftMsgArr:Array=ConfigManager.items("cfg_giftbox");
        var lv:int=PlayerInfoM.instance.getGiftLv();

        var gainD:GainnewD=new GainnewD();
        gainD.award_type=[(10+lv)];
        gainD.award_num=[1];
        gainD.callback=handler;

        GameEventDispatch.instance.event(GameEvent.GainNewPOP,[gainD]);
    }


    private function updateTime():void
    {
        _delay=PlayerInfoM.instance.getGiftDelay();
        timetxt.text=TimeManager.instance.getTimeStr(_delay);
    }
    private function updateGiftLV():void
    {
        boxlv.text="LV."+PlayerInfoM.instance.getGiftLv();
    }

    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.UPdateGiftBoxTime,this,updateTime);
        GameEventDispatch.instance.on(GameEvent.CheckGiftResetTime,this,checkGiftResetTime);
    }
    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.UPdateGiftBoxTime,this,updateTime);
        GameEventDispatch.instance.off(GameEvent.CheckGiftResetTime,this,checkGiftResetTime);
    }
    public function closePanel():void
    {
        this.visible=false;
        GameEventDispatch.instance.event(GameEvent.RemoveRedPoint,"Timegift");
    }
    public function clearAllNum():void
    {

    }
}
}
