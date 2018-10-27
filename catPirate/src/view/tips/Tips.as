package view.tips {
import laya.events.Event;
import laya.utils.Handler;

import manager.GameEvent;

import manager.GameEventDispatch;

import manager.UiManager;

import ui.TipsUI;

import view.PanelVo;

public class Tips extends TipsUI implements PanelVo{

    public static var _instance:Tips;

    private var _content:String;
    private var _aotoCloseTime:int;
    private var _aotoClose:Boolean;

    private var _confirmCallback:Handler=null;
    private var _conFirmEvent:String;
    private var _conFirmArgs:Object;

    private var _buySucceedCallback:Handler;

    public function Tips() {
        super();
    }
    public static function get instance():Tips
    {
        return _instance ||=new Tips();
    }

    private function checkMsg(param:Object):void
    {
        if(param.hasOwnProperty('content')){
            _content=param['content'];
            contenttxt.text=_content;
        }
        if(param.hasOwnProperty('aotoClose')){
            _aotoClose=param['aotoClose'];
            if(_aotoClose){
                _aotoCloseTime=param['autoCloseTime'];
                changeAotoTimeState("start");
            }else{
                changeAotoTimeState("undisplay");
            }
        }
        if(param.hasOwnProperty('confirmCallback'))_confirmCallback=param['confirmCallback'];
        if(param.hasOwnProperty('conFirmEvent')){
            _conFirmEvent=param['conFirmEvent'];
            if(_conFirmEvent==GameEvent.ShopBuy){
                _buySucceedCallback=param['buySucceedCallback'];
            }
        }
        if(param.hasOwnProperty('conFirmArgs'))_conFirmArgs=param['conFirmArgs'];
    }

    public function openPanel(param:Object=null):void
    {
        checkMsg(param);
        confirmBtn.on(Event.MOUSE_DOWN,this,onConfirm);
        cancelBtn.on(Event.MOUSE_DOWN,this,onCancel);
        closeBtn.on(Event.MOUSE_DOWN,this,onCancel);
    }

    private function changeAotoTimeState(action:String):void
    {
        if(action=="start"){
            timetxt.visible=true;
            timetxt.text="(剩余"+_aotoCloseTime+"秒)";
            Laya.timer.loop(1000,this,changeAotoTimeState,["update"]);
        }else if(action=="over"){
            Laya.timer.clear(this,changeAotoTimeState);
            onCancel();
        }else if(action=="update"){
            _aotoCloseTime--;
            if(_aotoCloseTime<=0)changeAotoTimeState("over");
            else timetxt.text="(剩余"+_aotoCloseTime+"秒)";
        }else if(action=="undisplay"){
            timetxt.visible=false;
        }
    }


    private function onConfirm():void
    {
        if(_confirmCallback){
            if(_conFirmArgs) _confirmCallback.runWith(_conFirmArgs);
            else _confirmCallback.run();
        }else if(_conFirmEvent){
            if(_buySucceedCallback){
                _conFirmArgs['buySucceedCallback']=_buySucceedCallback;
                GameEventDispatch.instance.event(GameEvent.ShopBuy,_conFirmArgs);
            }
            else if(_conFirmArgs) GameEventDispatch.instance.event(_conFirmEvent,_conFirmArgs);
            else GameEventDispatch.instance.event(_conFirmEvent);
        }
        changeAotoTimeState("over");
    }

    private function onCancel():void
    {
        UiManager.instance.closePanel("Tips");
    }

    public function register():void
    {

    }
    public function unRegister():void
    {

    }
    public function clearAllNum():void
    {

    }
    public function closePanel():void
    {
        this.visible=false;
    }
}
}
