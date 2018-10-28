package view.gamemain {
import data.EffectD;
import data.ShipRoleD;

import laya.ui.Image;

import model.ShiprefitM;

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
        initSeaWave(shipBox);
        initListener();

        //update view
        changeScoreBoxState("start");
        changeDropFishBoxState("over");

        //update Num
        initNum();

        GameEventDispatch.instance.event(GameEvent.ShipSlotInit);

        //test creatRole
        var roleDate:ShipRoleD=new ShipRoleD();
        roleDate.skin="ui/common/captain_1.png";
        roleDate.job="captain";
        GameEventDispatch.instance.event(GameEvent.CreatShipRole,[roleDate]);
    }


    public function getRoleImg(roleType:String):Image
    {
        switch (roleType){
            case "captain":return captainImg;
            break;
            case "shipmate":return shipmateImg;
            break;
            case "shipchef":return shipchefImg;
            break;
            case "shipsoldier":return shipsoldierImg;
            break;
        }
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

        bookBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.loadView("Sailingbook",null,0,"UITYPE_NORMAL");
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







    public function updateShipslot():void
    {
        //console.log("--updateShipslot",ShiprefitM.instance.getShipslotDic());
        //body sail tower cabin
        var bodyImg:Image=shipBox.getChildByName("body") as Image;
        var bodyConfig:Object=ShiprefitM.instance.getShipslotByName("body");
        if(bodyConfig)bodyImg.skin=bodyConfig['res'];
        else bodyImg.skin="";

        var sailImg:Image=shipBox.getChildByName("sail") as Image;
        var sailConfig:Object=ShiprefitM.instance.getShipslotByName("sail");
        if(sailConfig)sailImg.skin=sailConfig['res'];
        else sailImg.skin="";

        var towerImg:Image=shipBox.getChildByName("tower") as Image;
        var towerConfig:Object=ShiprefitM.instance.getShipslotByName("tower");
        if(towerConfig) towerImg.skin=towerConfig['res'];
        else towerImg.skin="";

        var cabinImg:Image=shipBox.getChildByName("cabin") as Image;
        var cabinConfig:Object=ShiprefitM.instance.getShipslotByName("cabin");
        if(cabinConfig)cabinImg.skin=cabinConfig['res'];
        else cabinImg.skin="";
    }


    private function minusGoldANI(param:Object):void
    {
        gold_txt.text=PlayerInfoM.instance.getGoldNum()+"";
        Laya.timer.clear(this,minusGoldANITime);
        param['minusNum']=Math.ceil(param['gold']/24);
        Laya.timer.frameLoop(1,this,minusGoldANITime,[param]);
    }
    private function minusPlankANI(param:Object):void
    {
        plank_txt.text=PlayerInfoM.instance.getPlankNum()+"";
        Laya.timer.clear(this,minusPlankANITime);
        param['minusNum']=Math.ceil(param['plank']/24);
        Laya.timer.frameLoop(1,this,minusPlankANITime,[param]);
    }

    private function minusGoldANITime(param:Object):void
    {
        param['gold']-=param['minusNum'];
        if(param['gold']<=0){
            Laya.timer.clear(this,minusGoldANITime);
            gold_txt.text=PlayerInfoM.instance.getGoldNum()+"";
        }else{
            gold_txt.text=param['gold']+PlayerInfoM.instance.getGoldNum();
        }
    }
    private function minusPlankANITime(param:Object):void
    {
        param['plank']-=param['minusNum'];
        if(param['plank']<=0){
            Laya.timer.clear(this,minusPlankANITime);
            plank_txt.text=PlayerInfoM.instance.getPlankNum()+"";
        }else{
            plank_txt.text=param['plank']+PlayerInfoM.instance.getPlankNum();
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
        GameEventDispatch.instance.on(GameEvent.MinusGoldANI,this,minusGoldANI);
        GameEventDispatch.instance.on(GameEvent.MinusPlankANI,this,minusPlankANI);
        GameEventDispatch.instance.on(GameEvent.UpdateShipslot,this,updateShipslot);
    }

    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.GoldRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.off(GameEvent.PlankRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.off(GameEvent.PlankScoreANI,this,PlankScoreANI,[scoreAniSize]);
        GameEventDispatch.instance.off(GameEvent.GoldScoreANI,this,GoldScoreANI,[scoreAniSize]);
        GameEventDispatch.instance.off(GameEvent.MinusGoldANI,this,minusGoldANI);
        GameEventDispatch.instance.off(GameEvent.MinusPlankANI,this,minusPlankANI);
        GameEventDispatch.instance.off(GameEvent.UpdateShipslot,this,updateShipslot);
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
