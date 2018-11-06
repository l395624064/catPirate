package view.timegift {
import laya.events.Event;

import manager.UiManager;
import ui.TimeGiftUI;
import view.PanelVo;

public class Timegift extends TimeGiftUI implements PanelVo{
    public static var _instance:Timegift;
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
    }

    public function register():void
    {

    }
    public function unRegister():void
    {

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
