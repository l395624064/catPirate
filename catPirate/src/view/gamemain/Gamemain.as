package view.gamemain {
import data.AniD;
import data.EffectD;
import data.FontClipD;
import data.ShipRoleD;

import laya.display.Animation;

import laya.maths.Point;

import laya.ui.Image;

import model.FishM;

import model.GamemainM;

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
    private var canDropMatch:Boolean;
    private var fishhookPoint:Point;

    private const minFishhook:int=75;
    private const maxFishhook:int=500;
    private var fishhookIndex:int=0;

    private var _gamemode:String="normal";

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
        changeGameMode("normal");

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




    private function initListener():void
    {
        this.luckwheelBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.loadView("Luckwheel",null,0,"UITYPE_NORMAL");
        });
        this.friendRankBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.loadView("Friendrank",null,0,"UITYPE_NORMAL");
        });
        this.shopBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.loadView("Gameshop",null,0,"UITYPE_NORMAL");
        });
        settingBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.loadView("Setting",null,0,"UITYPE_NORMAL");
        });

        this.boxlibsBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.loadView("Boxlibs",null,0,"UITYPE_NORMAL");
        });
        this.timegiftBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.loadView("Timegift",null,0,"UITYPE_NORMAL");
        });

        gameStartBtn.on(Event.MOUSE_DOWN,this,function () {
            changeGameMode("match");
            GameEventDispatch.instance.event(GameEvent.GameReady);
            //changeGameMode("match");
        })
        




        

        /*暂未开放
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
        */
    }


    private function gameMatch():void
    {
        GamemainM.instance.setTimeClock("start",timeclip);
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
        }else if(action=="update"){
            gold_txt.text=PlayerInfoM.instance.getGoldNum() as String;
            plank_txt.text=PlayerInfoM.instance.getPlankNum() as String;
            pearl_txt.text=PlayerInfoM.instance.getPearlNum() as String;
        }
    }
    private function changeGameMode(action:String):void
    {
        _gamemode=action;
        if(action=="normal"){
            changeScoreBoxState("start");
            changeDropFishBoxState("over");

            canDrop=true;
            changeScoreBoxState("update");

            this.timeBox.visible=false;
            this.rightbtnBox.visible=true;
            this.leftbtnBox.visible=true;
            this.gameStartBtn.visible=true;

            dropSp.offAll();
            dropSp.on(Event.MOUSE_DOWN,this,function (e:Event) {
                if(!canDrop) return;
                e.stopPropagation();
                changeDropFishBoxState("start");
                Laya.stage.once(Event.MOUSE_DOWN,this,function () {
                    changeDropFishBoxState("stop");
                })
            });
        }
        else if(action=="match"){

            canDropMatch=true;
            changeScoreBoxState("update");

            this.timeBox.visible=true;
            this.rightbtnBox.visible=false;
            this.leftbtnBox.visible=false;
            this.gameStartBtn.visible=false;


            dropSp.offAll();
            dropSp.on(Event.MOUSE_DOWN,this,function (e:Event) {
                //console.log("--match click");
                if(!canDropMatch) return;
                e.stopPropagation();
                changeDropFishBoxState("start");
                Laya.stage.once(Event.MOUSE_DOWN,this,function () {
                    changeDropFishBoxState("stop");
                })
            });
        }
    }



    //鱼钩box状态
    private function changeDropFishBoxState(action:String):void
    {
        if(action=="start"){
            if(_gamemode=="normal")getColorImg();
            else if(_gamemode=="match")getFishImg();

            //common
            dropFishBox.visible=true;
            fishhookIndex=0;
            drawFishline("start");
            changeDropFishBoxState("move");
        }else if(action=="move"){
            var aniTime:int=1000;
            if(_gamemode=="normal")aniTime=1200;
            else if(_gamemode=="match")aniTime=2000;
            Tween.clearTween(fishhookImg);
            Tween.to(fishhookImg,{x:(fishhookIndex%2)? minFishhook:maxFishhook},aniTime,null,Handler.create(this,function () {
                fishhookIndex++;
                changeDropFishBoxState(action);
            }));
        }else if(action=="over"){
            if(_gamemode=="normal") overNormalDrap();
            else if(_gamemode=="match") overMatchDrap();

            //common
            dropFishBox.visible=false;
            Tween.clearAll(fishhookImg);
        }else if(action=="stop"){
            if(_gamemode=="normal")drapNormal();
            else if(_gamemode=="match")drapMatch();

            //common
            drawFishline("over");
            Tween.clearAll(fishhookImg);//fishhook stop Move
        }
    }






    private var fishImgArr:Array=[];
    private function clearfishImgArr():void
    {
        for (var i:int=fishImgArr.length-1;i>=0;i--){
            fishImgArr[i].removeSelf();
        }
        fishImgArr=[];
    }
    private function getFishImg():void
    {
        //console.log("--getFishImg",fishImgArr);
        canDropMatch=false;
        fishhookImg.x=minFishhook;

        clearfishImgArr();
        fishImgArr=GamemainM.instance.getFishImg();

        for(var i:int=0;i<fishImgArr.length;i++){
            fishhookMask.addChild(fishImgArr[i]);
        }
    }

    private function overMatchDrap():void
    {
        //console.log("--overMatchDrap");
        clearfishImgArr();
    }
    private function drapMatch():void
    {
        //get drop Img And ANI
        fishhookPoint=fishhookMask.globalToLocal(dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y)));
        var getdropObj:Object=GamemainM.instance.getdropFish(fishhookPoint);

        //console.log("-getdropObj:",getdropObj)
        if(!getdropObj){
            console.log("--miss");
        }


        else if(getdropObj.type=="pop"){
            //if img is pop

        }
        else if(getdropObj.type=="fish"){
            //if img is Fish
            var minX:int=70,maxX:int=230,minY:int=250,maxY:int=360;

            var efData:EffectD=new EffectD();
            efData.startPoint=fishhookMask.localToGlobal(fishhookPoint);

            efData.endPoint=new Point(minX+Math.random()*(maxX-minX),minY+Math.random()*(maxY-minY));
            efData.startScale=1.5;
            efData.endScale=.8;
            //Ease.backOut
            //Ease.backInOut
            efData.easeMode=Ease.backOut;
            efData.dealtTime=800;

            //creat effect
            var effectName:String=getdropObj.cfg.name;
            effectName=FishM.instance.chineseNameTransform(effectName);
            GameEffect.instance.creatSignPopMove(effectName,efData,Handler.create(this,function () {
                efData.panelSp=fishboxsp;
                efData.startPoint=fishboxsp.globalToLocal(efData.endPoint);
                efData.endPoint=new Point(0,GamemainM.instance.getFishpileEndY(fishboxsp.height));
                efData.startScale=efData.endScale;
                //getdropObj.num
                GameEffect.instance.creatBaseMove(effectName,efData,getdropObj.num);

                //add num effect
            }))


            if(getdropObj.comboNum>1){
                var aniData:AniD=new AniD();
                aniData.startPoint=dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y));
                aniData.aniUrl="EffectAni.ani";
                GameEffect.instance.creatSignAni("combo",aniData,Handler.create(this,function () {
                    //comboBall
                    aniData.startPoint=dropFishBox.localToGlobal(new Point(energyBall.x,energyBall.y));
                    GameEffect.instance.creatSignAni("comboBall",aniData);
                }));

                var fontD:FontClipD=new FontClipD();
                fontD.setFontSkin(3);
                fontD.startPoint=new Point(aniData.startPoint.x+70,aniData.startPoint.y-20);
                fontD.value="+"+getdropObj.comboNum;
                GameEffect.instance.creatSignFontClip("comboNum",fontD);
            }
        }

        canDropMatch=true;
        changeDropFishBoxState("over");
    }

    private function getColorImg():void
    {
        canDrop=false;
        fishhookImg.x=minFishhook;
        var dxArr:Array=GamemainM.instance.gethookColorImg();
        blueImg.x=dxArr[0];
        yellowImg.x=dxArr[1];
        coloursImg.x=dxArr[2];
    }
    private function overNormalDrap():void
    {
        blueImg.x=-100;
        yellowImg.x=-100;
        coloursImg.x=-100;
        getScoreClip.pos(600,0);
    }
    private function drapNormal():void
    {
        //get pop
        fishhookPoint=fishhookMask.globalToLocal(dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y)));

        var colorImgArr:Array=[blueImg,yellowImg,coloursImg];
        var popObject:Object=GamemainM.instance.getdropPopNum(fishhookPoint,colorImgArr);

        //fontClip
        getScoreClip.alpha=1;
        getScoreClip.x=fishhookImg.x;
        getScoreClip.value="+"+popObject.num+"";
        Tween.to(getScoreClip,{y:-80,alpha:0},900,null,null,0,true);

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
                changeDropFishBoxState("over");
                canDrop=true;
            }));
        }));
    }





    //绘制鱼线和hook动画
    private var _fishlineSp:Sprite;
    private var _hookState:String;
    private var _hookImgANI:Image=new Image("ui/gamemain/fishhook.png");
    private function drawFishline(action:String):void
    {
        if(action=="start"){
            fishhookImg.visible=true;
            _hookState="fishstart";

            _fishlineSp||=new Sprite();
            this.addChild(_fishlineSp);

            Laya.timer.frameLoop(1,this,onfishLineTime);
        }
        else if(action=="over"){
            fishhookImg.visible=false;
            _hookState="fishover";

            var hookPot:Point=new Point(fishhookImg.x,fishhookImg.y-fishhookImg.height/2);
            hookPot=dropFishBox.localToGlobal(hookPot);
            _hookImgANI.pos(hookPot.x,hookPot.y);
            _hookImgANI.anchorX=0.5;
            _hookImgANI.anchorY=0.5;
            this.addChild(_hookImgANI);
            Tween.to(_hookImgANI,{x:GameConfig.width/2,y:GameConfig.height/2},300,null,Handler.create(this,function(){
                _hookImgANI.removeSelf();
                _fishlineSp.graphics.clear();
                Laya.timer.clear(this,onfishLineTime);
            }));
        }
    }
    private function onfishLineTime():void
    {
        var rodPot:Point;
        if(_hookState=="fishstart"){
            _fishlineSp.graphics.clear();
            rodPot=new Point(captainImg.x-50,captainImg.y-20);
            rodPot=shipBox.localToGlobal(rodPot);
            rodPot=this.globalToLocal(rodPot);
            var hookPot:Point=new Point(fishhookImg.x,fishhookImg.y-fishhookImg.height/2);
            hookPot=dropFishBox.localToGlobal(hookPot);
            hookPot=this.globalToLocal(hookPot);
            _fishlineSp.graphics.drawLine(rodPot.x,rodPot.y,hookPot.x,hookPot.y,"#ff0000");
        }
        else if(_hookState=="fishover"){
            _fishlineSp.graphics.clear();
            rodPot=new Point(captainImg.x-50,captainImg.y-20);
            rodPot=shipBox.localToGlobal(rodPot);
            rodPot=this.globalToLocal(rodPot);
            _fishlineSp.graphics.drawLine(rodPot.x,rodPot.y,_hookImgANI.x,_hookImgANI.y,"#ff0000");
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
    private function minusPearlANI(param:Object):void
    {
        pearl_txt.text=PlayerInfoM.instance.getPearlNum()+"";
        Laya.timer.clear(this,minusPearlANITime);
        param['minusNum']=Math.ceil(param['pearl']/24);
        Laya.timer.frameLoop(1,this,minusPearlANITime,[param]);
    }

    private function minusPearlANITime(param:Object):void
    {
        param['pearl']-=param['minusNum'];
        if(param['pearl']<=0){
            Laya.timer.clear(this,minusPearlANITime);
            pearl_txt.text=PlayerInfoM.instance.getPearlNum()+"";
        }else{
            pearl_txt.text=param['pearl']+PlayerInfoM.instance.getPearlNum();
        }
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
        }else if(type=="pearl"){
            var pearlnum:int=PlayerInfoM.instance.getPearlNum();
            pearlnum++;
            PlayerInfoM.instance.setPearlNum(pearlnum);
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
    private function PearlScoreANI(scaleNum:Number):void
    {
        Tween.to(pearlScoreImg,{scaleX:scaleNum,scaleY:scaleNum},scoreAniTime,Ease.backOut,Handler.create(this,function () {
            if(pearlScoreImg.scaleX!=1){
                PearlScoreANI(1);
            }
        }),0,true);

        if(scaleNum==1) return;
        addScoreNum("pearl");
    }

    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.GoldRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.on(GameEvent.PlankRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.on(GameEvent.PearlRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.on(GameEvent.PlankScoreANI,this,PlankScoreANI,[scoreAniSize]);
        GameEventDispatch.instance.on(GameEvent.GoldScoreANI,this,GoldScoreANI,[scoreAniSize]);
        GameEventDispatch.instance.on(GameEvent.PearlScoreANI,this,PearlScoreANI,[scoreAniSize]);
        GameEventDispatch.instance.on(GameEvent.MinusGoldANI,this,minusGoldANI);
        GameEventDispatch.instance.on(GameEvent.MinusPlankANI,this,minusPlankANI);
        GameEventDispatch.instance.on(GameEvent.MinusPearlANI,this,minusPearlANI);

        GameEventDispatch.instance.on(GameEvent.UpdateShipslot,this,updateShipslot);

        GameEventDispatch.instance.on(GameEvent.GameMatchStart,this,gameMatch);
    }

    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.GoldRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.off(GameEvent.PlankRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.off(GameEvent.PearlRefresh,this,changeScoreBoxState,["update"]);
        GameEventDispatch.instance.off(GameEvent.PlankScoreANI,this,PlankScoreANI,[scoreAniSize]);
        GameEventDispatch.instance.off(GameEvent.GoldScoreANI,this,GoldScoreANI,[scoreAniSize]);
        GameEventDispatch.instance.off(GameEvent.PearlScoreANI,this,PearlScoreANI,[scoreAniSize]);
        GameEventDispatch.instance.off(GameEvent.MinusGoldANI,this,minusGoldANI);
        GameEventDispatch.instance.off(GameEvent.MinusPlankANI,this,minusPlankANI);
        GameEventDispatch.instance.off(GameEvent.MinusPearlANI,this,minusPearlANI);

        GameEventDispatch.instance.off(GameEvent.UpdateShipslot,this,updateShipslot);

        GameEventDispatch.instance.off(GameEvent.GameMatchStart,this,gameMatch);
    }

    public function closePanel():void
    {
        this.visible=false;
    }

    public function clearAllNum():void
    {
        fishboxsp.removeChildren();
    }


}
}
