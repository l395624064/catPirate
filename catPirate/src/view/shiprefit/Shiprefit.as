package view.shiprefit {
import laya.events.Event;

import manager.UiManager;
import ui.ShipRefitUI;
import view.PanelVo;

public class Shiprefit extends ShipRefitUI implements PanelVo{

    public static var _instance:Shiprefit;
    public function Shiprefit() {
        super();
    }

    public static function get instance():Shiprefit
    {
        return _instance || (_instance=new Shiprefit());
    }

    public function openPanel(param:Object=null):void
    {
        initListener();
        initNum();
    }

    private function initListener():void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Shiprefit");
        })

    }
    private function initNum():void
    {

    }


    public function register():void
    {

    }
    public function unRegister():void
    {

    }
    public function closePanel():void
    {
        this.visible = false;
    }
    public function clearAllNum():void
    {

    }
}
}
