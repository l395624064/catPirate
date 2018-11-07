package view.endaward {
import laya.events.Event;

import manager.GameEvent;

import manager.GameEventDispatch;

import ui.EndawardUI;

import view.PanelVo;

public class Endaward extends EndawardUI implements PanelVo{

    public static var _instance:Endaward;

    public function Endaward() {
        super();
    }
    public static function get instance():Endaward
    {
        return _instance||=new Endaward();
    }

    public function openPanel(param:Object=null):void
    {
        ani1.play(0,false);
        backBtn.on(Event.MOUSE_DOWN,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameOver);
        })
    }

    public function clearAllNum():void
    {
        ani1.stop();
    }
    public function closePanel():void
    {
        this.visible=false;
    }
    public function register():void
    {

    }
    public function unRegister():void
    {

    }
}
}
