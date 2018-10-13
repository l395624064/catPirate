package view.wait {
import laya.events.Event;

import manager.GameEvent;
import manager.GameEventDispatch;

import manager.UiManager;


import ui.WaitUI;

import view.PanelVo;


public class Wait extends WaitUI implements PanelVo{

    public static var _instance:Wait;

    public function Wait() {
        super();
        this.zOrder=UiManager.instance.getUiBaseDepth("UITYPE_WAIT");
    }

    public static function get instance():Wait
    {
        return _instance || (_instance=new Wait());
    }

    public function openPanel(param:Object=null):void
    {
    }

    private function openWait():void
    {
        this.visible=true;
        Laya.stage.addChild(this);
        aniImg.rotation=0;
        this.ani1.play(0,true);

        this.hitTestPrior=false;
        this.bmask.on(Event.CLICK,this,onClickMask);
        console.log("-- openWait");
    }
    private function onClickMask(e:Event):void
    {
        e.stopPropagation();
    }


    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.OpenWait, this, openWait);
        GameEventDispatch.instance.on(GameEvent.CloseWait, this, closePanel);
    }
    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.OpenWait, this, openWait);
        GameEventDispatch.instance.off(GameEvent.CloseWait, this, closePanel);
    }

    public function clearAllNum():void
    {

    }
    public function closePanel():void
    {
        console.log("--close wait");
        this.ani1.stop();
        this.visible=false;
        //this.removeSelf();
    }



}
}
