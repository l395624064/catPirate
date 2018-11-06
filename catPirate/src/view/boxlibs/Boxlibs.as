package view.boxlibs {
import laya.events.Event;

import manager.UiManager;

import ui.BoxlibsUI;

import view.PanelVo;

public class Boxlibs extends BoxlibsUI implements PanelVo{
    public static var _instance:Boxlibs;
    public function Boxlibs() {
        super();
    }
    public static function get instance():Boxlibs
    {
        return _instance||=new Boxlibs();
    }

    public function openPanel(param:Object=null):void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Boxlibs");
        })
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
