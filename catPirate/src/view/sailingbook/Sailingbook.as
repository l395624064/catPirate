package view.sailingbook {
import laya.events.Event;

import manager.UiManager;

import ui.SailingBookUI;

import view.PanelVo;

public class Sailingbook extends SailingBookUI implements PanelVo{

    public static var _instance:Sailingbook;
    public function Sailingbook() {
        super();
    }

    public static function get instance():Sailingbook
    {
        return _instance ||=new Sailingbook();
    }

    public function openPanel(param:Object=null):void
    {
        initListener();
        initNum();
    }

    private function initListener():void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Sailingbook");
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
        this.visible=false;
    }
    public function clearAllNum():void
    {

    }

}
}
