package view.timestartAni {
import laya.events.Event;

import manager.GameEvent;

import manager.GameEventDispatch;

import manager.UiManager;

import ui.TimeStartAniUI;

import view.PanelVo;

public class TimestartAni extends TimeStartAniUI implements PanelVo{

    public static var _instance:TimestartAni;

    public function TimestartAni() {
        super();
    }

    public static function get instance():TimestartAni
    {
        return _instance||=new TimestartAni();
    }

    public function openPanel(param:Object=null):void
    {
        into.play(0,false);
        into.offAll();
        into.once(Event.COMPLETE,this,function () {
            Laya.timer.once(1500,this,outAni);
        });
        this.hitTestPrior=true;
        this.on(Event.MOUSE_DOWN,this,function (e:Event) {
            e.stopPropagation();
        })
    }

    private function outAni():void
    {
        out.play(0,false);
        out.offAll();
        out.once(Event.COMPLETE,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameStart);
            UiManager.instance.closePanel("TimestartAni");
        });
    }

    public function closePanel():void
    {
        this.visible=false;
    }
    public function clearAllNum():void
    {
        into.stop();
        out.stop();
    }

    public function register():void
    {

    }
    public function unRegister():void
    {

    }


}
}
