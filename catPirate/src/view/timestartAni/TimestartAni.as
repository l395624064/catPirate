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
        ani1.play(0,false);
        ani2.play();
        this.on(Event.MOUSE_DOWN,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameStart);
        })
    }

    public function closePanel():void
    {
        this.visible=false;
    }
    public function clearAllNum():void
    {
        ani1.stop();
        ani2.stop();
    }

    public function register():void
    {

    }
    public function unRegister():void
    {

    }


}
}
