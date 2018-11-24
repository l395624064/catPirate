package control {

import manager.GameEvent;
import manager.GameEventDispatch;
import manager.GameInit;
import manager.UiManager;

import model.GamemainM;
import model.PlayerInfoM;


public class GamemainC {
    public static var _instance:GamemainC;

    public function GamemainC() {
        GameEventDispatch.instance.on(GameEvent.GameLoad,this,Gameload);
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

    private function Gameload():void
    {
        GameEventDispatch.instance.event(GameEvent.GameSaveInit);//获得存档
        UiManager.instance.loadView("Loadview", null, 1);
    }

    private function openGame():void
    {
        UiManager.instance.loadView("Gamemain",null,2);

        GameEventDispatch.instance.event(GameEvent.StartLoopTime);// gift time
        GameEventDispatch.instance.event(GameEvent.StartSaveTime);// save time

        var _guideComplete:Boolean=PlayerInfoM.instance.getGuide();
        if(!_guideComplete){
            //新手引导
            Laya.timer.once(200,this,function () {
                UiManager.instance.loadView("Gameguide",null,0,"UITYPE_ANI");
            });
        }
    }


    private function GameReady():void
    {
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
        GameEventDispatch.instance.event(GameEvent.ClearClick);
        UiManager.instance.loadView("TimeoverAni",null,0,"UITYPE_ANI");
    }

    private function GameEnd():void
    {
        UiManager.instance.closePanel("TimeoverAni","blackOut");
        UiManager.instance.closePanel("Gamemain","blackOut");
        UiManager.instance.loadView("Gameend");
    }

    private function BossComingMode():void
    {

    }

    private function GameEndAward(_param:Object):void
    {
        var param:Object={
            img:PlayerInfoM.instance.getavatarUrl(),
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
