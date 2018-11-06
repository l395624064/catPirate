package control {

import manager.GameEvent;
import manager.GameEventDispatch;
import manager.UiManager;


public class GamemainC {
    public static var _instance:GamemainC;

    public function GamemainC() {
        GameEventDispatch.instance.on(GameEvent.GameLoadOver,this,openGame);
        GameEventDispatch.instance.on(GameEvent.GameReady,this,GameReady);
        GameEventDispatch.instance.on(GameEvent.GameStart,this,GameStart);
        GameEventDispatch.instance.on(GameEvent.GameEnd,this,GameEnd);//时间到
        GameEventDispatch.instance.on(GameEvent.GameOver,this,GameOver);//进入结算
        GameEventDispatch.instance.on(GameEvent.GameTimeout,this,GameTimeout);
    }

    public static function get instance():GamemainC
    {
        return _instance || (_instance=new GamemainC());
    }

    private function openGame():void
    {
        UiManager.instance.loadView("Gamemain");
        //console.log("--GameMainPanelOpen");
    }


    private function GameReady():void
    {
        console.log("--GameReady");
        //新手引导
        UiManager.instance.loadView("TimestartAni",null,0,"UITYPE_ANI");
    }
    private function GameStart():void
    {
        console.log("--GameStart");
        UiManager.instance.closePanel("TimestartAni");
        GameEventDispatch.instance.event(GameEvent.GameMatchStart);
    }
    private function GameTimeout():void
    {
        console.log("--GameTimeout");
        UiManager.instance.loadView("TimeoverAni",null,0,"UITYPE_ANI");
    }

    private function GameEnd():void
    {
        console.log("--GameEnd");
        UiManager.instance.closePanel("TimeoverAni","blackOut");
        UiManager.instance.closePanel("Gamemain","blackOut");
        UiManager.instance.loadView("Gameend");
    }

    private function GameOver():void
    {
        console.log("--GameOver");
        UiManager.instance.closePanel("Gameend");
        openGame();
    }






}
}
