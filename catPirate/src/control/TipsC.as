package control {
import manager.GameEvent;
import manager.GameEventDispatch;
import manager.UiManager;

public class TipsC {
    public static var _instance:TipsC;
    public function TipsC() {
        GameEventDispatch.instance.on(GameEvent.ShowTips,this,showTips);
    }
    public static function get instance():TipsC
    {
        return _instance ||=new TipsC();
    }

    private function showTips(param:Object):void
    {
        UiManager.instance.loadView("Tips",param,0,"UITYPE_TIP");
    }

}
}
