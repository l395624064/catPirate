package view.explainbook {
import laya.events.Event;

import manager.UiManager;

import ui.ExplainbookUI;

import view.PanelVo;

public class Explainbook extends ExplainbookUI implements PanelVo{
    public static var _instance:Explainbook;
    public function Explainbook() {
        super();
    }
    public static function get instance():Explainbook
    {
        return _instance||=new Explainbook();
    }

    public function openPanel(param:Object=null):void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Explainbook");
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
