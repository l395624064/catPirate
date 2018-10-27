package control {
import manager.GameEvent;
import manager.GameEventDispatch;
import manager.UiManager;

public class GainnewpopC {

    public static var _instance:GainnewpopC;

    public function GainnewpopC() {
        GameEventDispatch.instance.on(GameEvent.GainNewPOP,this,showGainpop);
    }

    public static function get instance():GainnewpopC
    {
        return _instance ||=new GainnewpopC();
    }

    private function showGainpop(param:Object):void
    {
        UiManager.instance.loadView("Gainnewpop",param,0,"UITYPE_GAINNEW");
    }


}
}
