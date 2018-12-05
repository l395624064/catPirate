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

    private var _weight:int;

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
        playerImg.skin = param['img'];
        playerImg.size(105,105);
        _maxWeight=param['maxweight'];
        _weight=param['weight'];
        playertitle.text=Gamefame.instance.getPlayerTitle(_weight,_maxWeight);
        weightTxt.text=_weight+"kg";

        updatescore(Math.floor(param['weight']));

        if(PlayerInfoM.instance.getNetConfigAD()){
            videoAdBtn.disabled=false;
            videoAdBtn.visible=true;
        }else{
            videoAdBtn.visible=false;
        }
        videoAdBtn.offAll();
        videoAdBtn.on(Event.MOUSE_DOWN,this,function () {
            videoAdBtn.disabled=true;
            WxManager.instance.showVideoAd(Handler.create(this,videoOverAward));//视频-奖励翻倍
        });

        shareBtn.offAll();
        shareBtn.on(Event.MOUSE_DOWN,this,function () {
            WxManager.instance.shareApp();
        })

        getAward.disabled=false;
        getAward.offAll();
        getAward.on(Event.MOUSE_DOWN,this,function () {
            getAward.disabled=true;
            getendAward(_weight);
        });
    }

    private function getendAward(weight:int):void
    {
        var awardTypeArr:Array=[1];
        var awardNumArr:Array=[weight];
        var num:int;
        const plankFloor:int=300;
        const pearlFloor:int=500;
        if(weight>=plankFloor){
            awardTypeArr.push(2);
            num=Math.ceil(weight-plankFloor);
            awardNumArr.push(num);
        }
        if(weight>=pearlFloor){
            awardTypeArr.push(3);
            num=Math.ceil(weight/100);
            awardNumArr.push(num);
        }
        var gainD:GainnewD=new GainnewD();
        gainD.award_type=awardTypeArr;
        gainD.award_num=awardNumArr;
        GameEventDispatch.instance.event(GameEvent.GainNewPOP,[gainD]);
    }

    private function videoOverAward():void
    {
        var doubleWeight:int=_weight*2;
        getendAward(doubleWeight);
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
