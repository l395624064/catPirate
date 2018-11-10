package view.setting {
import laya.events.Event;

import manager.UiManager;

import ui.SettingUI;

import view.PanelVo;

public class Setting extends SettingUI implements PanelVo{

    public static var _instance:Setting;
    public function Setting() {
        super();
    }
    public static function get instance():Setting
    {
        return _instance||=new Setting();
    }

    public function openPanel(param:Object=null):void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Setting");
        })

    }

    public function closePanel():void
    {
        this.visible=false;
    }
    public function clearAllNum():void
    {

    }

    public function unRegister():void
    {

    }
    public function register():void
    {

    }
}
}
