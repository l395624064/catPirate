package view.endaward {
import data.GainnewD;

import laya.events.Event;
import laya.utils.Handler;

import manager.GameEvent;

import manager.GameEventDispatch;
import manager.Gamefame;
import manager.WxManager;

import model.PlayerInfoM;

import ui.EndawardUI;

import view.PanelVo;

public class Endaward extends EndawardUI implements PanelVo{

    public static var _instance:Endaward;
    public static var _maxWeight:Number=0;

    public function Endaward() {
        super();
    }
    public static function get instance():Endaward
    {
        return _instance||=new Endaward();
    }

    public function openPanel(param:Object=null):void
    {
        ani1.play(0,false);

        backBtn.offAll();
        backBtn.on(Event.MOUSE_DOWN,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameOver);
        });
        shareBtn.offAll();
        shareBtn.on(Event.MOUSE_DOWN,this,function () {
            WxManager.instance.shareApp();
            //WxManager.instance.shareApp(Handler.create(this,shareOverAward));
        })

        playerImg.skin = param['img'];
        playerImg.size(105,105);
        _maxWeight=param['maxweight'];
        playertitle.text=Gamefame.instance.getPlayerTitle(param['weight'],_maxWeight);
        weightTxt.text=param['weight']+"kg";

        updatescore(Math.floor(param['weight']));
    }

    private function updatescore(score:int):void
    {
        if(PlayerInfoM.instance.getscore()<score){
            PlayerInfoM.instance.setscore(score);
            WxManager.instance.setUserCloudStorage(score);
        }
    }

    private function shareOverAward():void
    {
        if(Math.random()>.9){
            var typeNum:int=11+Math.floor(Math.random()*3);
            var gainD:GainnewD=new GainnewD();
            gainD.award_type=[typeNum];
            gainD.award_num=[1];
            GameEventDispatch.instance.event(GameEvent.GainNewPOP,[gainD]);
        }else{
            GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:16}]);
        }
    }



    public function clearAllNum():void
    {
        ani1.stop();
    }
    public function closePanel():void
    {
        this.visible=false;
    }
    public function register():void
    {

    }
    public function unRegister():void
    {

    }
}
}
