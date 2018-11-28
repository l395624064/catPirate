package view.timebossAni {
import laya.events.Event;

import manager.GameEvent;
import manager.GameEventDispatch;
import manager.GameSoundManager;
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

    public function openPanel(param:Object=null):void {
        GameSoundManager.onPlaySound("get4");

        into.play(0, false);
        into.offAll();
        into.once(Event.COMPLETE, this, function () {
            Laya.timer.once(1300, this, outAni);
        });
        this.hitTestPrior=true;
        this.on(Event.MOUSE_DOWN,this,function (e:Event) {
            e.stopPropagation();
        })
    }
    private function outAni():void
    {
        out.play(0,false);
        out.offAll();
        out.once(Event.COMPLETE,this,function () {
            GameEventDispatch.instance.event(GameEvent.BossComIngMode);
            UiManager.instance.closePanel("TimebossAni");
        });
    }
    public function closePanel():void
    {
        this.visible=false;
    }
    public function clearAllNum():void
    {
        into.stop();
        out.stop();
    }
    public function register():void
    {

    }
    public function unRegister():void
    {

    }

}
}
