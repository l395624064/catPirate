package view.gamemain {
import laya.events.Event;
import laya.ui.Box;
import laya.utils.Handler;
import laya.utils.Tween;

import manager.GameEvent;
import manager.GameEventDispatch;

import src.manager.ShipAniManager;
import src.model.PlayerInfoM;
import src.view.gamemain.SimpleRole;

import ui.GameMainUI;

import view.PanelVo;

public class Gamemain extends GameMainUI implements PanelVo {

    public static var _instance:Gamemain;
    private var roleDic:Object={};

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
        initRole();
        initSeaWave(shipBox);

        initScoreBox(true);
        initDropFishBox(false);

        updateScore();
        initListener();
    }

    //creat role
    private function initRole():void
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

    private function getshipRole(name:String):void
    {
        return roleDic[name];
    }

    private function initListener():void
    {
        dropSp.once(Event.MOUSE_DOWN,this,onAngling);
    }




    private function onAngling(e:Event):void
    {
        e.stopPropagation();
        initDropFishBox(true);

        fishhookImg.x=minFishhook;
        fishhookIndex=0;



        fishhookMove();
        Laya.stage.once(Event.MOUSE_DOWN,this,function () {
            Tween.clearAll(fishhookImg);
            //over effect
            dropSp.once(Event.MOUSE_DOWN,this,onAngling);
        })
    }
    private function fishhookMove():void
    {
        console.log("-fishhookIndex 2:",fishhookIndex);
        Tween.to(fishhookImg,{x:(fishhookIndex%2)? minFishhook:maxFishhook},2000,null,Handler.create(this,function () {
            fishhookIndex++;
            fishhookMove();
        }))
    }





    private function initSeaWave(shipbox:Box=null,lv:Number=1):void
    {
        if(!ShipAniManager.instance.getShipBox()){
            ShipAniManager.instance.setShipBox(shipbox);
        }
        ShipAniManager.instance.shipAniControl(lv);
    }

    private function initScoreBox(ifShow:Boolean):void
    {
        if(ifShow){
            scoreBox.visible=true;
        }else{
            scoreBox.visible=false;
        }
    }
    private function updateScore():void
    {
        gold_txt.text=PlayerInfoM.instance.getGoldNum() as String;
        plank_txt.text=PlayerInfoM.instance.getPlankNum() as String;
    }


    private function initDropFishBox(ifShow:Boolean):void
    {
        if(ifShow){
            dropFishBox.visible=true;
        }else{
            dropFishBox.visible=false;
        }
    }



    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.GoldRefresh,this,updateScore);
        GameEventDispatch.instance.on(GameEvent.PlankRefresh,this,updateScore);
    }

    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.GoldRefresh,this,updateScore);
        GameEventDispatch.instance.off(GameEvent.PlankRefresh,this,updateScore);
    }

    public function closePanel():void
    {
        this.removeSelf();
    }

    public function clearAll():void
    {

    }

}
}
