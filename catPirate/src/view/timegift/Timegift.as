package view.timegift {
import control.GameTimeC;

import data.GainnewD;

import laya.events.Event;
import laya.utils.Handler;

import manager.ConfigManager;

import manager.GameEvent;

import manager.GameEventDispatch;
import manager.TimeManager;

import manager.UiManager;

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

        updateTime();
        updateGiftLV();

        Laya.timer.once(500,this,function () {
            GameEventDispatch.instance.event(GameEvent.CheckGiftBoxTime);
        });
    }

    private function giftLVUP():void
    {
        //调取微信分享接口
        GameEventDispatch.instance.event(GameEvent.CheckGiftBoxLVUP);
    }

    private function giftGet():void
    {
        //观看视频
        GameEventDispatch.instance.event(GameEvent.ResetGiftBoxTime);
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

    private function gainGiftBox(handler:Handler):void
    {
        //清理计时器
        var giftMsgArr:Array=ConfigManager.items("cfg_giftbox");
        var lv:int=PlayerInfoM.instance.getGiftLv();

        var gainD:GainnewD=new GainnewD();
        gainD.name=giftMsgArr[lv-1]['name'];
        gainD.res=giftMsgArr[lv-1]['res'];
        gainD.explain_content=giftMsgArr[lv-1]['explain_content'];
        gainD.callback=handler;

        GameEventDispatch.instance.event(GameEvent.GainNewPOP,[gainD]);
    }


    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.UPdateGiftBoxTime,this,updateTime);
        GameEventDispatch.instance.on(GameEvent.UPdateGiftBoxLV,this,updateGiftLV);
        GameEventDispatch.instance.on(GameEvent.GainGiftBox,this,gainGiftBox);
    }
    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.UPdateGiftBoxTime,this,updateTime);
        GameEventDispatch.instance.off(GameEvent.UPdateGiftBoxLV,this,updateGiftLV);
        GameEventDispatch.instance.off(GameEvent.GainGiftBox,this,gainGiftBox);
    }
    public function closePanel():void
    {
        this.visible=false;
    }
    public function clearAllNum():void
    {

    }
}
}
