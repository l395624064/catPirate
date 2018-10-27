package control {
import manager.GameEvent;
import manager.GameEventDispatch;
import manager.UiManager;

public class SmallTipsC {
    public static var _instance:SmallTipsC;
    public function SmallTipsC() {
        GameEventDispatch.instance.on(GameEvent.ShowStips,this,showStips);
    }
    public static function get instance():SmallTipsC
    {
        return _instance||=new SmallTipsC();
    }

    private function showStips(param:Object):void
    {
        UiManager.instance.loadView("Smalltips",param,0,"UITYPE_STIP");
    }


}
}
