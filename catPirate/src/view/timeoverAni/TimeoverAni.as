package view.timeoverAni {
import laya.events.Event;

import manager.GameEvent;

import manager.GameEventDispatch;

import manager.UiManager;

import ui.TimeOverAniUI;

import view.PanelVo;

public class TimeoverAni extends TimeOverAniUI implements PanelVo{
    public static var _instance:TimeoverAni;
    public function TimeoverAni() {
        super();
    }
    public static function get instance():TimeoverAni
    {
        return _instance||=new TimeoverAni();
    }

    public function openPanel(param:Object=null):void
    {
        ani1.play(0,false);
        ani2.play();
        this.on(Event.MOUSE_DOWN,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameEnd);
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
