package control {

import manager.GameEvent;
import manager.GameEventDispatch;
import manager.UiManager;

import model.GamemainM;


public class GamemainC {
    public static var _instance:GamemainC;

    public function GamemainC() {
        GameEventDispatch.instance.on(GameEvent.GameLoadOver,this,openGame);
        GameEventDispatch.instance.on(GameEvent.GameReady,this,GameReady);
        GameEventDispatch.instance.on(GameEvent.GameStart,this,GameStart);
        GameEventDispatch.instance.on(GameEvent.GameEnd,this,GameEnd);//时间到
        GameEventDispatch.instance.on(GameEvent.GameOver,this,GameOver);//进入结束页
        GameEventDispatch.instance.on(GameEvent.GameEndAward,this,GameEndAward);//结算
        GameEventDispatch.instance.on(GameEvent.GameTimeout,this,GameTimeout);
    }

    public static function get instance():GamemainC
    {
        return _instance || (_instance=new GamemainC());
    }

    private function openGame():void
    {
        UiManager.instance.loadView("Gamemain",null,1);
        //console.log("--GameMainPanelOpen");

        //init local obj

        //init local time
        GameEventDispatch.instance.event(GameEvent.LoginTime);
    }


    private function GameReady():void
    {
        //新手引导
        UiManager.instance.loadView("TimestartAni",null,0,"UITYPE_ANI");
    }
    private function GameStart():void
    {
        GamemainM.instance.clearLastDrop();
        GamemainM.instance.clearFishBox();//gameEnd页会使用
        UiManager.instance.closePanel("TimestartAni");
        GameEventDispatch.instance.event(GameEvent.GameMatchStart);
    }
    private function GameTimeout():void
    {
        UiManager.instance.loadView("TimeoverAni",null,0,"UITYPE_ANI");
    }

    private function GameEnd():void
    {
        UiManager.instance.closePanel("TimeoverAni","blackOut");
        UiManager.instance.closePanel("Gamemain","blackOut");
        UiManager.instance.loadView("Gameend");
    }

    private function GameEndAward(_param:Object):void
    {
        var param:Object={
            img:"ui/common_ex/ico1.png",
            maxweight:_param['maxweight'],
            weight:_param['weight']
        };
        UiManager.instance.loadView("Endaward",param,0,"UITYPE_NORMAL");
    }

    private function GameOver():void
    {
        UiManager.instance.closePanel("Endaward");
        UiManager.instance.closePanel("Gameend");
        openGame();
    }






}
}
