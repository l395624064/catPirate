package view.gamemain {
import data.EffectD;
import view.gamemap.Gamemap;

import laya.display.Sprite;

import laya.events.Event;
import laya.map.TiledMap;
import laya.maths.Point;
import laya.maths.Rectangle;
import laya.ui.Box;
import laya.utils.Browser;
import laya.utils.Ease;
import laya.utils.Handler;
import laya.utils.Tween;

import manager.GameEffect;

import manager.GameEvent;
import manager.GameEventDispatch;
import manager.GameMath;

import manager.ShipAniManager;
import manager.UiManager;

import model.PlayerInfoM;

import src.GameConfig;


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
        canDrop=true;
        changeScoreBoxState("update");
    }



    private function initListener():void
    {
        mapBtn.on(Event.MOUSE_DOWN,this,function (e:Event) {
            if(!checkDropfish) return;
            e.stopPropagation();
            UiManager.instance.loadView("Gamemap", null, 0, "UITYPE_NORMAL");
        });

        remouldBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.loadView("Shiprefit", null, 0, "UITYPE_NORMAL");
        })
        
        dropSp.on(Event.MOUSE_DOWN,this,function (e:Event) {
            if(!checkDropfish) return;
            //console.log("--dropSp Click");
            e.stopPropagation();
            changeDropFishBoxState("start");
            Laya.stage.once(Event.MOUSE_DOWN,this,function () {
                //console.log("--stage click");
                changeDropFishBoxState("stop");
            })
        });
    }

    private function get checkDropfish():Boolean
    {
        return canDrop;
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
            coloursImg.x=dxArr[2];
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
            coloursImg.x=-100;
            getScoreClip.pos(600,0);

            dropFishBox.visible=false;
            Tween.clearAll(fishhookImg);
        }else if(action=="stop"){
            //fishhook stop Move
            Tween.clearAll(fishhookImg);
            Laya.timer.once(1000, this, function () {
                changeDropFishBoxState("over");
            })

            //get pop
            fishhookPoint=fishhookMask.globalToLocal(dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y)));

            var colorImgArr:Array=[blueImg,yellowImg,coloursImg];
            var popObject:Object=GameMath.instance.getdropPopNum(fishhookPoint,colorImgArr);

            //fontClip
            getScoreClip.alpha=1;
            getScoreClip.x=fishhookImg.x;
            getScoreClip.value="+"+popObject.num+"";
            Tween.to(getScoreClip,{y:-80,alpha:0},900);

            //over effect
            var efData:EffectD=new EffectD();
            efData.startPoint=fishhookMask.localToGlobal(fishhookPoint);
            efData.endPoint=new Point(GameConfig.width/2,GameConfig.height/2);
            GameEffect.instance.creatSignPopMove(popObject.name,efData,Handler.create(this,function () {
                efData.startPoint=efData.endPoint;
                var p:Point;
                if(popObject.name=="plank"){
                    p=new Point(plankScoreImg.x,plankScoreImg.y);
                }else if(popObject.name=="gold"){
                    p=new Point(goldScoreImg.x,goldScoreImg.y);
                }else{
                    p=new Point(plankScoreImg.x,plankScoreImg.y);
                }
                efData.endPoint=scoreBox.localToGlobal(p);
                GameEffect.instance.creatBezierMove(popObject.name,efData,popObject.num,Handler.create(this,function () {
                    console.log("--canDrop true");
                    canDrop=true;
                }));
            }));


        }
    }








    private function addScoreNum(type:String):void
    {
        if(type=="plank"){
            var planknum:int=PlayerInfoM.instance.getPlankNum();
            planknum++;
            PlayerInfoM.instance.setPlankNum(planknum);
        }
        else if(type=="gold"){
            var goldnum:int=PlayerInfoM.instance.getGoldNum();
            goldnum++;
            PlayerInfoM.instance.setGoldNum(goldnum);
        }
        changeScoreBoxState("update");
    }

    private const scoreAniSize:Number=1.2;
    private const scoreAniTime:Number=300;
    private function PlankScoreANI(scaleNum:Number):void
    {
        Tween.to(plankScoreImg,{scaleX:scaleNum,scaleY:scaleNum},scoreAniTime,Ease.backOut,Handler.create(this,function () {
            if(plankScoreImg.scaleX!=1){
                PlankScoreANI(1);
            }
        }),0,true);

        if(scaleNum==1) return;
        addScoreNum("plank");
    }
    private function GoldScoreANI(scaleNum:Number):void
    {
        Tween.to(goldScoreImg,{scaleX:scaleNum,scaleY:scaleNum},scoreAniTime,Ease.backOut,Handler.create(this,function () {
            if(goldScoreImg.scaleX!=1){
                GoldScoreANI(1);
            }
        }),0,true);

        if(scaleNum==1) return;
        addScoreNum("gold");
    }


    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.GoldRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.on(GameEvent.PlankRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.on(GameEvent.PlankScoreANI,this,PlankScoreANI,[scoreAniSize]);
        GameEventDispatch.instance.on(GameEvent.GoldScoreANI,this,GoldScoreANI,[scoreAniSize]);
    }

    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.GoldRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.off(GameEvent.PlankRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.off(GameEvent.PlankScoreANI,this,PlankScoreANI,[scoreAniSize]);
        GameEventDispatch.instance.off(GameEvent.GoldScoreANI,this,GoldScoreANI,[scoreAniSize]);
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
