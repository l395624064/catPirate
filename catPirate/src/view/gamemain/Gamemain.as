package view.gamemain {
import data.EffectD;

import laya.events.Event;
import laya.maths.Point;
import laya.ui.Box;
import laya.utils.Handler;
import laya.utils.Tween;

import manager.GameEffect;

import manager.GameEvent;
import manager.GameEventDispatch;
import manager.GameMath;

import manager.ShipAniManager;

import model.PlayerInfoM;


import ui.GameMainUI;

import view.PanelVo;

public class Gamemain extends GameMainUI implements PanelVo {

    public static var _instance:Gamemain;
    private var roleDic:Object={};

    private var canDrop:Boolean;
    private var fishhookPoint:Point;

    private const minFishhook:int=75;
    private const maxFishhook:int=530;
    private var fishhookIndex:int=0;

    public function Gamemain() {
        super();
    }
    public static function get instance():Gamemain
    {
        return _instance || (_instance=new Gamemain());
    }




    public function openPanel(param:Object=null):void
    {
        creatRole();
        initSeaWave(shipBox);
        initListener();


        //update view
        changeScoreBoxState("start");
        changeDropFishBoxState("over");

        //update Num
        initNum();
    }

    //creat role
    private function creatRole():void
    {
        var captain:SimpleRole=new SimpleRole();
        captain.init("captain",this.captainImg);

        var shipmate:SimpleRole=new SimpleRole();
        shipmate.init("shipmate",this.shipmateImg);

        var shipchef:SimpleRole=new SimpleRole();
        shipchef.init("shipchef",this.shipchefImg);

        var shipsoldier:SimpleRole=new SimpleRole();
        shipsoldier.init("shipsoldier",this.shipsoldierImg);

        roleDic={"captain":captain,"shipmate":shipmate,"shipchef":shipchef,"shipsoldier":shipsoldier};
    }

    private function getshipRole(name:String):*
    {
        return roleDic[name];
    }

    private function initNum():void
    {

        changeScoreBoxState("update");
    }

    private function initListener():void
    {
        dropSp.on(Event.MOUSE_DOWN,this,function (e:Event) {
            if(!canDrop) return;
            console.log("--dropSp Click");
            e.stopPropagation();
            changeDropFishBoxState("start");
            Laya.stage.once(Event.MOUSE_DOWN,this,function () {
                changeDropFishBoxState("stop");
            })
        });
    }





    private function initSeaWave(shipbox:Box=null,lv:Number=1):void
    {
        if(!ShipAniManager.instance.getShipBox()){
            ShipAniManager.instance.setShipBox(shipbox);
        }
        ShipAniManager.instance.shipAniControl(lv);
    }

    private function changeScoreBoxState(action:String):void
    {
        if(action=="start"){
            scoreBox.visible=true;
        }else if(action=="over"){
            scoreBox.visible=false;
        }else if(action="update"){
            gold_txt.text=PlayerInfoM.instance.getGoldNum() as String;
            plank_txt.text=PlayerInfoM.instance.getPlankNum() as String;
        }
    }


    //鱼钩box状态
    private function changeDropFishBoxState(action:String):void
    {
        if(action=="start"){
            var dxArr:Array=GameMath.instance.gethookColorImg();
            blueImg.x=dxArr[0];
            yellowImg.x=dxArr[1];
            fishhookImg.x=minFishhook;
            fishhookIndex=0;
            canDrop=false;

            dropFishBox.visible=true;
            changeDropFishBoxState("move");
        }else if(action=="move"){
            Tween.to(fishhookImg,{x:(fishhookIndex%2)? minFishhook:maxFishhook},2000,null,Handler.create(this,function () {
                fishhookIndex++;
                changeDropFishBoxState(action);
            }))
        }else if(action=="over"){
            blueImg.x=-100;
            yellowImg.x=-100;
            canDrop=true;

            dropFishBox.visible=false;
            Tween.clearAll(fishhookImg);
        }else if(action=="stop"){

            //over effect
            fishhookPoint=fishhookMask.globalToLocal(dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y)));
            //console.log("--fishhookImg C:",fishhookPoint);
            //get pop
            var efData:EffectD=new EffectD();
            efData.startPoint=fishhookMask.localToGlobal(fishhookPoint);
            efData.endPoint=new Point(scoreBox.x,scoreBox.y);
            GameEffect.instance.creatSignPopMove("plank",efData,Handler.create(this,handerTest));

            Tween.clearAll(fishhookImg);
            Laya.timer.once(1000, this, function () {
                changeDropFishBoxState("over");
            })
        }
    }

    private function handerTest():void
    {
        console.log("--handerTest");
        //GameEffect.instance.clearEffectImg("plank");
    }




    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.GoldRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.on(GameEvent.PlankRefresh,this,changeScoreBoxState,["update"]);
    }

    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.GoldRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.off(GameEvent.PlankRefresh,this,changeScoreBoxState,["update"]);
    }

    public function closePanel():void
    {
        this.visible=false;
    }

    public function clearAllNum():void
    {

    }

}
}
