package view.friendrank {
import laya.events.Event;

import manager.UiManager;

import ui.FriendRankUI;

import view.PanelVo;

public class Friendrank extends FriendRankUI implements PanelVo{
    public static var _instance:Friendrank;
    public function Friendrank() {
        super();
    }
    public static function get instance():Friendrank
    {
        return _instance||=new Friendrank();
    }

    public function openPanel(param:Object=null):void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Friendrank");
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
