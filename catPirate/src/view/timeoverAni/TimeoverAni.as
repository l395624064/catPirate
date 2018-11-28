package view.timeoverAni {
import laya.events.Event;

import manager.GameEvent;

import manager.GameEventDispatch;
import manager.GameSoundManager;

import manager.UiManager;

import ui.TimeOverAniUI;

import view.PanelVo;

public class TimeoverAni extends TimeOverAniUI implements PanelVo{
    public static var _instance:TimeoverAni;
    private var _canClick:Boolean=false;
    public function TimeoverAni() {
        super();
    }
    public static function get instance():TimeoverAni
    {
        return _instance||=new TimeoverAni();
    }

    public function openPanel(param:Object=null):void
    {
        GameSoundManager.onPlaySound("timeover");

        into.play(0,false);
        into.offAll();
        into.once(Event.COMPLETE,this,function () {
            _canClick=true;
        });

        this.offAll();
        this.on(Event.MOUSE_DOWN,this,function (e:Event) {
            if(!_canClick) return;
            this.offAll();
            outAni();
        });
    }

    private function outAni():void
    {
        out.play(0,false);
        out.offAll();
        out.once(Event.COMPLETE,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameEnd);
            UiManager.instance.closePanel("TimeoverAni");
        });
    }


    public function closePanel():void
    {
        this.visible=false;
    }
    public function clearAllNum():void
    {
        _canClick=false;
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
