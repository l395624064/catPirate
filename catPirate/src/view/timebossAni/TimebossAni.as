package view.timebossAni {
import manager.GameEvent;
import manager.GameEventDispatch;
import manager.UiManager;

import ui.TimeBossAniUI;
import view.PanelVo;

public class TimebossAni extends TimeBossAniUI implements PanelVo{
    public static var _instance:TimebossAni;
    public function TimebossAni() {
        super();
    }
    public static function get instance():TimebossAni
    {
        return _instance||=new TimebossAni();
    }

    public function openPanel(param:Object=null):void
    {
        this.ani1.play(0,false);
        Laya.timer.once(1000,this,function () {
            GameEventDispatch.instance.event(GameEvent.BossComIngMode);
            UiManager.instance.closePanel("TimebossAni");
        })
    }

    public function closePanel():void
    {
        this.visible=false;
        this.ani1.stop();
    }
    public function clearAllNum():void
    {

    }
    public function register():void
    {

    }
    public function unRegister():void
    {

    }

}
}
