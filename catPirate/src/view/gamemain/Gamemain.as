package view.gamemain {
import data.AniD;
import data.EffectD;
import data.FontClipD;
import data.ShipRoleD;

import laya.display.Animation;
import laya.display.Graphics;

import laya.maths.Point;
import laya.ui.Button;

import laya.ui.Image;
import laya.utils.Handler;

import manager.GameAdaptive;

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
        checkRedPoint();
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
        if(_gamemode=="normal"){
            //init view
            this.timeBox.visible=false;
            this.rightbtnBox.visible=true;
            this.leftbtnBox.visible=true;
            this.gameStartBtn.visible=true;
            bgImg.skin="ui/gamemain/gamemain_0.png";

            //remove ani
            this.powerBox.visible=false;
            this.fireAni.visible=false;
            this.floorbarAni.visible=false;
            this.refreshAni.visible=false;

            //init control
            canDrop=true;//初始化
            changeScoreBoxState("start");
            changeDropFishBoxState("over");
            changeScoreBoxState("update");

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
        else if(_gamemode=="match"){
            //init view
            this.timeBox.visible=true;
            this.rightbtnBox.visible=false;
            this.leftbtnBox.visible=false;
            this.gameStartBtn.visible=false;
            this.powerBox.visible=true;
            this.dropFishBox.visible=true;
            bgImg.skin="ui/gamemain/gamemain_0.png";

            //init control
            canDropMatch=true;//初始化
            changeScoreBoxState("update");
            changePowerBox("init");

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
        else if(_gamemode=="boss"){
            //页面effect 侦听
            bgImg.skin="ui/gamemain/gamemain_1.png";

            dropSp.offAll();
            dropSp.once(Event.MOUSE_DOWN,this,function (e:Event) {
                e.stopPropagation();
                changeDropFishBoxState("start");
                Laya.stage.once(Event.MOUSE_DOWN,this,function () {
                    changeDropFishBoxState("stop");
                });
            });
        }
    }



    //鱼钩box状态
    private function changeDropFishBoxState(action:String):void
    {
        if(action=="start"){
            if(_gamemode=="normal"){
                fishhookImg.x=minFishhook;
                fishhookImg.visible=true;//normal mode

                dropFishBox.visible=true;
                canDrop=false;//关闭点击事件

                getColorImg();
                drawFishline("start");//鱼线动画开启
            }
            else if(_gamemode=="match"){
                refreshAni.visible=true;
                refreshAni.play();
                refreshAni.on(Event.COMPLETE,this,function () {
                    fishhookImg.x=minFishhook;
                    fishhookImg.visible=true;

                    refreshAni.visible=false;
                    refreshAni.stop();
                    canDropMatch=false;//关闭

                    drawFishline("start");//刷新动画后 开启鱼线动画
                    getFishImg();//刷新动画后更新 fishhookImg
                });
            }
            else if(_gamemode=="boss"){
                //fishhook 降速
                refreshAni.visible=true;
                refreshAni.play();
                refreshAni.on(Event.COMPLETE,this,function () {
                    fishhookImg.x=minFishhook;
                    fishhookImg.visible=true;

                    refreshAni.visible=false;
                    refreshAni.stop();
                    canDropMatch=false;//关闭

                    drawFishline("start");//刷新动画后 开启鱼线动画
                    getFishImg();//刷新动画后更新 fishhookImg
                });
            }

            changeFishhookTime("start");
        }else if(action=="over"){
            if(_gamemode=="normal") overNormalDrap();
            else if(_gamemode=="match") overMatchDrap();
        }else if(action=="stop"){
            if(_gamemode=="normal"){
                fishhookImg.visible=false;
                //动画播放完毕后重置canDrop=true
                drapNormal();
                changeFishhookTime("over");
            }
            else if(_gamemode=="match"){
                fishhookImg.visible=false;
                canDropMatch=true;//重置 canDropMatch
                drapMatch();
                changeFishhookTime("over");
            }
            else if(_gamemode=="boss"){

                changeFishhookTime("stop");//钓到 停止
                drapBoss();
            }
        }
    }

    private function changeFishhookTime(action:String):void
    {
        if(action=="start"){
            changeFishhookSpd("init");
            changeFishhookState("rightMove");

            Laya.timer.frameLoop(1,this,fishhookMove);
        }
        else if(action=="over"){
            changeFishhookSpd("stop");
            changeFishhookState("clear");

            drawFishline("over");
            Laya.timer.clear(this,fishhookMove);
        }
        else if(action=="stop"){
            changeFishhookSpd("stop");
            changeFishhookState("stop");
            Laya.timer.clear(this,fishhookMove);
        }
    }




    private var powerIndex:int=0;
    private function changePowerBox(action:String):void
    {
        const dx:int=48,dy=49,rad=47,starAngle=0;
        //const endAngleArr:Array=[-356,-300,-270,-237,-209,-180,-150,-120,-90,-60,-10];
        const endAngleArr:Array=[1,60,90,120,150,180,210,240,270,300,340];
        powerMaskSp.graphics.clear();
        if(action=="clear"){
            fireAni.visible=false;
            fireAni.stop();
            floorbarAni.visible=false;
            floorbarAni.stop();
            powerIndex=0;
            return;
        }
        else if(action=="init"){
            powerIndex=0;
            powerMaskSp.graphics.drawPie(dx,dy,rad,starAngle,endAngleArr[0],"#ff0000");
        }
        else if(action=="update"){
            powerIndex++;
            powerMaskSp.graphics.drawPie(dx,dy,rad,starAngle,endAngleArr[powerIndex],"#ff0000");
            if(powerIndex>=endAngleArr.length-4){
                fireAni.visible=true;
                fireAni.play();
                floorbarAni.visible=true;
                floorbarAni.play();
            }
            if(powerIndex>=endAngleArr.length-1){
                powerIndex=endAngleArr.length-1;
                //来袭ANI
                UiManager.instance.loadView("TimebossAni",null,0,"UITYPE_ANI");
                //计时清理
                GamemainM.instance.setTimeClock("stop",timeclip);
            }
        }
        else if(action=="max"){
            powerIndex=endAngleArr.length-1;
            powerMaskSp.graphics.drawPie(dx,dy,rad,starAngle,endAngleArr[powerIndex],"#ff0000");
        }
    }







    private var _fishhookBossSpd:int=3;
    private var _fishhookMatchSpd:int=5;
    private var _fishhookNormalSpd:int=5;
    private function changeFishhookSpd(action:String,newSpd:Number=undefined,delay:int=0):void
    {
        if(action=="init"){
            if(_gamemode=="normal")fishhookImg['spd']=_fishhookNormalSpd;
            else if(_gamemode=="match")fishhookImg['spd']=_fishhookMatchSpd;
            else if(_gamemode=="boss")fishhookImg['spd']=_fishhookBossSpd;
        }
        else if(action=="update"){
            //combo lvup
            const updateSpd:Number=2;
            fishhookImg['spd']+=updateSpd;
        }
        else if(action=="buff"){
            if(newSpd){
                fishhookImg['spd']+=newSpd;
                Laya.timer.once(delay,this,function () {
                    changeFishhookSpd("init");
                });
            }
        }
        else if(action=="stop"){
            fishhookImg['spd']=0;
        }
    }


    private function fishhookMove():void
    {
        if(fishhookImg['state']=="rightMove"){
            fishhookImg.x+=fishhookImg['spd'];
            if(fishhookImg.x>=maxFishhook){
                fishhookImg.x=maxFishhook;
                changeFishhookState("leftMove");
            }
        }
        else if(fishhookImg['state']=="leftMove"){
            fishhookImg.x-=fishhookImg['spd'];
            if(fishhookImg.x<=minFishhook){
                fishhookImg.x=minFishhook;
                changeFishhookState("rightMove");
            }
        }
        else if(fishhookImg['state']=="stop"){
            changeFishhookSpd("stop");
        }

    }

    private function changeFishhookState(state:String):void
    {
        if(state=="rightMove"){
            fishhookImg['state']="rightMove";
        }
        else if(state=="leftMove"){
            fishhookImg['state']="leftMove";
        }
        else if(state=="stop"){
            fishhookImg['state']="stop";
        }
        else if(state=="clear"){
            fishhookImg['state']="rightMove";
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
        clearfishImgArr();
        fishImgArr=GamemainM.instance.getFishImg(_gamemode);

        for(var i:int=0;i<fishImgArr.length;i++){
            fishhookMask.addChild(fishImgArr[i]);
        }
    }


    private function drapBoss():void
    {
        fishhookPoint=fishhookMask.globalToLocal(dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y)));
        var getdropObj:Object=GamemainM.instance.getdropFish(fishhookPoint);

        if(!getdropObj){
            console.log("--miss");
        }

        //快速点击屏幕
        console.log("钓到----");

    }


    private function overMatchDrap():void
    {
        dropFishBox.visible=true;
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
                //num
                changePowerBox("update");

                //effect
                var aniData:AniD=new AniD();
                aniData.startPoint=dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y));
                aniData.aniUrl="EffectAni.ani";

                GameEffect.instance.creatSignAni("combo",aniData,Handler.create(this,function () {
                    //comboBall
                    //GameEffect.instance.creatSignAni("comboBall",aniData);
                    var efData_c:EffectD=new EffectD();
                    efData_c.startPoint=dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y));
                    efData_c.endPoint=dropFishBox.localToGlobal(new Point(powerBox.x,powerBox.y));
                    efData_c.startPoint.y-=100;
                    efData_c.easeMode=Ease.circOut;
                    GameEffect.instance.creatSignPopMove("jifen",efData_c,Handler.create(this,function () {
                        getpowerAni.visible=true;
                        getpowerAni.play();
                        getpowerAni.on(Event.COMPLETE,this,function () {
                            getpowerAni.stop();
                            getpowerAni.visible=false;
                        });
                    }));
                }));


                var fontD:FontClipD=new FontClipD();
                fontD.setFontSkin(3);
                fontD.startPoint=new Point(aniData.startPoint.x+70,aniData.startPoint.y-20);
                fontD.value="+"+getdropObj.comboNum;
                GameEffect.instance.creatSignFontClip("comboNum",fontD);
            }
        }


        changeDropFishBoxState("over");
    }

    private function getColorImg():void
    {
        var dxArr:Array=GamemainM.instance.gethookColorImg();
        blueImg.x=dxArr[0];
        yellowImg.x=dxArr[1];
        coloursImg.x=dxArr[2];
    }
    private function overNormalDrap():void
    {
        dropFishBox.visible=false;
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
            _hookState="fishstart";

            _fishlineSp||=new Sprite();
            this.addChild(_fishlineSp);

            Laya.timer.frameLoop(1,this,onfishLineTime);
        }
        else if(action=="over"){
            _hookState="fishover";

            //收竿
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



    private function checkRedPoint():void
    {
        var nameArr:Array=["Timegift","Boxlibs","Luckwheel","Friendrank"];
        var showPoint:Boolean;
        for(var i:int=0;i<nameArr;i++){
            showPoint=PlayerInfoM.instance.getRedPointByName(nameArr[i]);
            if(showPoint){
                showRedPoint(nameArr[i]);
            }
        }
    }

    private function showRedPoint(btnname:String):void
    {
        var redImg:Image;
        var url:String="ui/common_ex/redpot.png";
        if(btnname=="Timegift"){
            if(timegiftBtn.numChildren>0)return;
            redImg=new Image(url);
            timegiftBtn.addChild(redImg);
            GameAdaptive.instance.setRightFromPanel(redImg,timegiftBtn);
        }
        else if(btnname=="Boxlibs"){
            console.log("--boxlibs redpoint",boxlibsBtn.numChildren)
            if(boxlibsBtn.numChildren>0)return;
            redImg=new Image(url);
            boxlibsBtn.addChild(redImg);
            GameAdaptive.instance.setRightFromPanel(redImg,boxlibsBtn);
        }
        else if(btnname=="Luckwheel"){
            if(luckwheelBtn.numChildren>0)return;
            redImg=new Image(url);
            luckwheelBtn.addChild(redImg);
            GameAdaptive.instance.setRightFromPanel(redImg,luckwheelBtn);
        }
        else if(btnname=="Friendrank"){
            if(friendRankBtn.numChildren>0)return;
            redImg=new Image(url);
            friendRankBtn.addChild(redImg);
            GameAdaptive.instance.setRightFromPanel(redImg,friendRankBtn);
        }
        else{
            throw new Error("redPoint Button not fond!");
        }
        PlayerInfoM.instance.setRedPointByName(btnname,true);
    }

    private function removeRedPoint(btnname:String):void
    {
        if(btnname=="Timegift"){
            if(timegiftBtn.numChildren<0)return;
            timegiftBtn.removeChildren();
        }
        else if(btnname=="Boxlibs"){
            if(boxlibsBtn.numChildren<0)return;
            boxlibsBtn.removeChildren();
        }
        else if(btnname=="Luckwheel"){
            if(luckwheelBtn.numChildren<0)return;
            luckwheelBtn.removeChildren();
        }
        else if(btnname=="Friendrank"){
            if(friendRankBtn.numChildren<0)return;
            friendRankBtn.removeChildren();
        }
        else{
            throw new Error("redPoint Button not fond!");
        }
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

        GameEventDispatch.instance.on(GameEvent.ShowRedPoint,this,showRedPoint);
        GameEventDispatch.instance.on(GameEvent.RemoveRedPoint,this,removeRedPoint);


        //Boss coming
        GameEventDispatch.instance.on(GameEvent.BossComIngMode,this,changeGameMode,["boss"]);
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

        GameEventDispatch.instance.off(GameEvent.ShowRedPoint,this,showRedPoint);
        GameEventDispatch.instance.off(GameEvent.RemoveRedPoint,this,removeRedPoint);

        GameEventDispatch.instance.off(GameEvent.BossComIngMode,this,changeGameMode,["boss"]);
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
