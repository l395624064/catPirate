package view.luckwheel {
import laya.events.Event;

import manager.UiManager;

import ui.LuckwheelUI;
import view.PanelVo;

public class Luckwheel extends LuckwheelUI implements PanelVo{
    public static var _instance:Luckwheel;
    public function Luckwheel() {
        super();
    }
    public static function get instance():Luckwheel
    {
        return _instance||=new Luckwheel();
    }

    public function openPanel(param:Object=null):void
    {
        this.closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Luckwheel");
        })
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
