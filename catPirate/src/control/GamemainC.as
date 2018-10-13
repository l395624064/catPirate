package control {

import manager.GameEvent;
import manager.GameEventDispatch;


public class GamemainC {
    public static var _instance:GamemainC;

    public function GamemainC() {
        GameEventDispatch.instance.on(GameEvent.GameMainPanelOpen, this, openGame);
    }

    public static function get instance():GamemainC
    {
        return _instance || (_instance=new GamemainC());
    }

    private function openGame():void
    {
        //console.log("--GameMainPanelOpen");
    }




}
}
