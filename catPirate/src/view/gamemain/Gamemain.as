package view.gamemain {
import conf.cfg_currency;

import data.AniD;
import data.EffectD;
import data.FontClipD;
import data.GainnewD;
import data.ShipRoleD;

import laya.display.Animation;
import laya.display.Graphics;

import laya.maths.Point;
import laya.ui.Button;

import laya.ui.Image;
import laya.utils.Handler;

import manager.GameAdaptive;
import manager.GameSoundManager;
import manager.WxManager;

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
    private var _roleSk:SimpleRole;

    public function Gamemain() {
        super();
    }
    public static function get instance():Gamemain
    {
        return _instance || (_instance=new Gamemain());
    }




    public function openPanel(param:Object=null):void
    {
        this.hitTestPrior=true;

        checkRedPoint();
        initSeaWave(shipBox);
        initListener();

        //update view
        changeGameMode("normal");

        GameEventDispatch.instance.event(GameEvent.ShipSlotInit);

        //test img creatRole
        /*
        var roleDate:ShipRoleD=new ShipRoleD();
        roleDate.skin="ui/common/captain_1.png";
        roleDate.job="captain";
        GameEventDispatch.instance.event(GameEvent.CreatShipRole,[roleDate]);
        */

        //db role
        _roleSk=new SimpleRole();
        captainsk.load("DB/DB_dog/dog.sk",Handler.create(this,function () {
            _roleSk.init("captain",captainsk);
        }))
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
            if(!canDrop) return;
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
            UiManager.instance.loadView("Luckwheel",null,0,"UITYPE_NORMAL");

            GameSoundManager.onPlaySound("btn");//音效
        });
        this.friendRankBtn.on(Event.MOUSE_DOWN,this,function () {
            if(!canDrop) return;
            UiManager.instance.loadView("Friendrank",null,0,"UITYPE_NORMAL");

            GameSoundManager.onPlaySound("btn");//音效
        });
        this.shopBtn.on(Event.MOUSE_DOWN,this,function () {
            if(!canDrop) return;
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
            UiManager.instance.loadView("Gameshop",null,0,"UITYPE_NORMAL");

            GameSoundManager.onPlaySound("btn");//音效
        });
        shareBtn.on(Event.MOUSE_DOWN,this,function () {
            if(!canDrop) return;
            WxManager.instance.shareApp();
        });
        settingBtn.on(Event.MOUSE_DOWN,this,function () {
            if(!canDrop) return;
            UiManager.instance.loadView("Setting",null,0,"UITYPE_NORMAL");

            GameSoundManager.onPlaySound("btn");//音效
        });

        this.boxlibsBtn.on(Event.MOUSE_DOWN,this,function () {
            if(!canDrop) return;
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
            UiManager.instance.loadView("Boxlibs",null,0,"UITYPE_NORMAL");

            GameSoundManager.onPlaySound("btn");//音效
        });
        this.timegiftBtn.on(Event.MOUSE_DOWN,this,function () {
            if(!canDrop) return;
            UiManager.instance.loadView("Timegift",null,0,"UITYPE_NORMAL");

            GameSoundManager.onPlaySound("btn");//音效
        });

        gameStartBtn.on(Event.MOUSE_DOWN,this,function () {
            if(!canDrop) return;
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
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
        changeGameMode("match");
        GamemainM.instance.setTimeClock("start",timeclip);
        refreshFish();
    }
    private function gameBoss():void
    {
        changeGameMode("boss");
        matchClick(null);
    }

    private function clearClick():void
    {
        //-强制收杆
        if(!canDropMatch){
            clearfishImgArr();
            changeDropFishBoxState("stop");
        }
        dropSp.offAll();
        Laya.stage.offAll();
    }

    private function matchClick(e:Event):void
    {
        if(!canDropMatch) return;
        if(e)e.stopPropagation();
        changeDropFishBoxState("start");
    }

    //刷新鱼
    private function refreshFish():void
    {
        changeEffectAniState("refresh","open");
        refreshAni.offAll();
        refreshAni.on(Event.COMPLETE,this,function () {
            changeEffectAniState("refresh","close");
            getFishImg();//刷新动画后更新 fishhookImg
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
            changeEffectAniState("refresh","close");
            changeEffectAniState("skystar","close");
            changeEffectAniState("fire","close");

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
                GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
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
            dropSp.on(Event.MOUSE_DOWN,this,matchClick);
        }
        else if(_gamemode=="boss"){

            //页面effect 侦听
            bgImg.skin="ui/gamemain/gamemain_1.png";
            changeEffectAniState("skystar","open");

            dropSp.offAll();
            dropSp.once(Event.MOUSE_DOWN,this,matchClick);

            GameSoundManager.onPlayMusic("boss");
        }
    }









    private function overAni():void
    {
        fishhookImg.x=minFishhook;
        fishhookImg.visible=true;//normal mode
        drawFishline("start");
        changeFishhookTime("start");

        if(_gamemode=="normal"){
            Laya.stage.offAll();
            Laya.stage.once(Event.MOUSE_DOWN,this,function (e:Event) {
                GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
                e.stopPropagation();
                changeDropFishBoxState("stop");
                //GameEventDispatch.instance.event(GameEvent.GameReady);
            })
        }
        else if(_gamemode=="boss" || _gamemode=="match"){
            Laya.stage.offAll();
            Laya.stage.once(Event.MOUSE_DOWN,this,function () {
                changeDropFishBoxState("stop");
            });
        }
    }

    //鱼钩box状态
    private function changeDropFishBoxState(action:String):void
    {
        const delayTime:int=500;
        if(action=="start"){
            _roleSk.skplay("shuai");//sk

            if(_gamemode=="normal"){
                dropFishBox.visible=true;
                canDrop=false;

                getColorImg();

                Laya.timer.clear(this,overAni);
                Laya.timer.once(delayTime,this,overAni);
            }
            else if(_gamemode=="match"){
                canDropMatch=false;//关闭

                Laya.timer.clear(this,overAni);
                Laya.timer.once(delayTime,this,overAni);
            }
            else if(_gamemode=="boss"){
                //fishhook 降速
                Laya.timer.clear(this,overAni);
                Laya.timer.once(delayTime,this,overAni);

                changeEffectAniState("refresh","open");
                refreshAni.on(Event.COMPLETE,this,function () {
                    changeEffectAniState("refresh","close");
                    canDropMatch=false;//关闭
                    getFishImg();//刷新动画后更新 fishhookImg
                });
            }

            changeFishhookSpd("init");
        }

        else if(action=="over"){
            if(_gamemode=="normal") overNormalDrap();
            else if(_gamemode=="match") {
                overMatchDrap();
                refreshFish();
            }
            else if(_gamemode=="boss"){
                _roleSk.skplay("surprised");//sk ani

                fishhookImg.visible=false;//收杆
                changeFishhookTime("over");
                refreshFish();
                changeGameMode("match");//重回match 模式
                GamemainM.instance.setTimeClock("update",timeclip);//继续计时
            }
        }

        else if(action=="stop"){
            _roleSk.skplay("shou");//sk ani

            if(_gamemode=="normal"){
                fishhookImg.visible=false;
                drapNormal();
                changeFishhookTime("over");
            }
            else if(_gamemode=="match"){
                fishhookImg.visible=false;
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
            changeEffectAniState("fire","close");
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
                changeEffectAniState("fire","open");
            }
            if(powerIndex>=endAngleArr.length-1){
                powerIndex=endAngleArr.length-1;
                UiManager.instance.loadView("TimebossAni",null,0,"UITYPE_ANI");//来袭ANI
                GamemainM.instance.setTimeClock("stop",timeclip);//计时清理
            }
        }
        else if(action=="max"){
            powerIndex=endAngleArr.length-1;
            powerMaskSp.graphics.drawPie(dx,dy,rad,starAngle,endAngleArr[powerIndex],"#ff0000");
        }
    }







    private var _fishhookBossSpd:int=3;
    private var _fishhookMatchSpd:int=4.5;
    private var _fishhookNormalSpd:int=5;
    private function changeFishhookSpd(action:String,newSpd:Number=undefined,delay:int=0):void
    {
        if(action=="init"){
            if(_gamemode=="normal")fishhookImg['spd']=_fishhookNormalSpd;
            else if(_gamemode=="match"){
                if(fishhookImg.hasOwnProperty('updateSpd') && fishhookImg['updateSpd']>0){
                    fishhookImg['spd']=_fishhookMatchSpd+fishhookImg['updateSpd'];
                }
                else{
                    fishhookImg['updateSpd']=0;
                    fishhookImg['spd']=_fishhookMatchSpd;
                }
            }
            else if(_gamemode=="boss")fishhookImg['spd']=_fishhookBossSpd;
        }
        else if(action=="update"){
            //combo lvup
            if(_gamemode=="match"){
                const updateSpd:Number=0.15;
                fishhookImg['updateSpd']+=updateSpd;
            }
        }
        else if(action=="reset"){
            if(_gamemode=="match"){
                fishhookImg['updateSpd']=0;
            }
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

        //boss标记
        if(_gamemode=="boss"){
            changeBossMarkState("open");
        }

        for(var i:int=0;i<fishImgArr.length;i++){
            fishhookMask.addChild(fishImgArr[i]);
        }
    }

    //boss标记
    private function changeBossMarkState(action:String):void
    {
        if(action=="open"){
            bossmarkImg.visible=true;
            var bossImg:Image=fishImgArr[0];
            var pot:Point=new Point(GamemainM.instance.getFishmouthX(bossImg)+fishImgArr[0].x,0);//
            pot=fishhookMask.localToGlobal(pot);
            pot=dropFishBox.globalToLocal(pot);
            bossmarkImg.x=pot.x;
        }
        else if(action=="close"){
            Tween.to(bossmarkImg,{alpha:0},1000,null,Handler.create(this,function () {
                bossmarkImg.visible=false;
                bossmarkImg.alpha=1;
            }));
        }
        else if(action=="over"){
            bossmarkImg.visible=false;
        }
    }


    private function drapBoss():void
    {
        fishhookPoint=fishhookMask.globalToLocal(dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y)));
        var getdropObj:Object=GamemainM.instance.getdropFish(fishhookPoint);

        if(!getdropObj){
            //Miss 特效
            getMissImgEffect();

            changeBossPowerState("over");
            changeBossMarkState("over");

            _roleSk.skplay("shock");//sk
            return;
        }
        changeBossMarkState("close");

        //点击提示
        var efData:EffectD=new EffectD();
        efData.startPoint=new Point(GameConfig.width/2-120,GameConfig.height/3*2);
        efData.dealtTime=4000;
        GameEffect.instance.creatSignPopMove("cliktip",efData);

        changeBossPowerState("init");
    }
    //boss能量条
    private function changeBossPowerState(action:String):void
    {
        const minNum:int=50;
        const maxNum:int=430;
        const clickAdd:int=20;
        if(action=="init"){
            bossPowerBox.visible=true;
            powermask.width=minNum;
            Laya.timer.frameLoop(1,this,bossPowerTime);
            Laya.stage.on(Event.MOUSE_DOWN,this,function () {
                powermask.width+=clickAdd;
                creatClickImg();
                if(powermask.width>=maxNum){
                    changeBossPowerState("stop");
                }
            })
        }
        else if(action=="stop"){
            powermask.width=maxNum;
            Laya.stage.offAll(Event.MOUSE_DOWN);
            Laya.timer.clear(this,bossPowerTime);

            //收杆动画
            fishhookImg.visible=false;
            changeFishhookTime("over");

            //特效

            //大鱼钓起
            var bossMsg:Object=fishImgArr[0].dataSource;
            clearfishImgArr();

            var efData:EffectD=new EffectD();
            efData.startPoint=fishhookMask.localToGlobal(fishhookPoint);
            efData.endPoint=new Point(GameConfig.width/2-100,GameConfig.height/2-100);
            efData.startScale=3;
            efData.endScale=1.2;
            efData.easeMode=Ease.backOut;
            efData.dealtTime=1000;

            //creat effect
            var effectName:String=bossMsg.name;
            effectName=FishM.instance.chineseNameTransform(effectName);
            GameEffect.instance.creatSignPopMove(effectName,efData,Handler.create(this,function () {
                //展示信息
                var gainD:GainnewD=new GainnewD();
                gainD.res=bossMsg.res;
                gainD.name=bossMsg.name;
                gainD.callback=Handler.create(this,changeBossPowerState,["over"]);
                gainD.stayTime=1500;
                GameEventDispatch.instance.event(GameEvent.GainNewPOP,[gainD]);
            }))
            //changeDropFishBoxState("over");
        }
        else if(action=="over"){
            //退出boss模式
            powermask.width=0;
            Laya.stage.offAll(Event.MOUSE_DOWN);
            Laya.timer.clear(this,bossPowerTime);

            changeEffectAniState("skystar","close");
            changePowerBox("clear");

            clearfishImgArr();
            clearAllclickImg();

            changeDropFishBoxState("over");

            GameSoundManager.onPlayMusic("fight");
        }
    }
    private function bossPowerTime():void
    {
        powermask.width-=1;
        if(powermask.width<=0){
            getMissImgEffect();
            changeBossPowerState("over");
        }
    }


    private function getMissImgEffect():void
    {
        //Miss 特效
        var efData_miss:EffectD=new EffectD();
        efData_miss.startPoint=dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y));
        efData_miss.startPoint.y-=50;
        efData_miss.endPoint=new Point(efData_miss.startPoint.x,efData_miss.startPoint.y-100);
        efData_miss.easeMode=Ease.circOut;
        GameEffect.instance.creatSignPopMove("miss",efData_miss);
    }

    private function clearAllclickImg():void
    {
        for(var i:int=clickImgArr.length-1;i>=0;i--){
            clickImgArr[i].removeSelf();
        }
        clickImgArr=[];
    }
    private var clickImgArr:Array=[];
    private function creatClickImg():void
    {
        var res:String;
        (Math.random()>.5)? res="ui/common_ef/clickword0.png":res="ui/common_ef/clickword1.png";
        var img:Image=new Image(res);
        this.addChild(img);
        var scale:Number=1+Math.random()*.5;
        img.scale(scale,scale);
        img.anchorX=.5;
        img.anchorY=.5;
        img.rotation=-20+Math.random()*40;
        img.pos(Laya.stage.mouseX,Laya.stage.mouseY);
        clickImgArr.push(img);
        Tween.to(img,{alpha:0},1200);
    }

    private function changeEffectAniState(name:String,state:String):void
    {
        if(name=="skystar"){
            if(state=="open"){
                skystarAni.play();
                this.skystarAni.visible=true;
            }
            else if(state=="close"){
                skystarAni.stop();
                this.skystarAni.visible=false;
            }
        }
        else if(name=="fire"){
            if(state=="open"){
                fireAni.play();
                floorbarAni.play();
                this.fireAni.visible=true;
                this.floorbarAni.visible=true;
            }
            else if(state=="close"){
                fireAni.stop();
                floorbarAni.stop();
                this.fireAni.visible=false;
                this.floorbarAni.visible=false;
            }
        }
        else if(name=="refresh"){
            if(state=="open"){
                refreshAni.play();
                this.refreshAni.visible=true;
            }
            else if(state=="close"){
                refreshAni.stop();
                this.refreshAni.visible=false;
            }
        }
    }












    private function overMatchDrap():void
    {
        dropFishBox.visible=true;
        clearfishImgArr();
    }
    private function drapMatch():void
    {
        //get drop Img And ANI
        fishhookPoint=fishhookMask.globalToLocal(dropFishBox.localToGlobal(new Point(fishhookImg.x,fishhookImg.y)));
        var getdropObj:Object=GamemainM.instance.getdropFish(fishhookPoint);

        if(!getdropObj){
            changeFishhookSpd("reset");//速度重置
            getMissImgEffect();//miss
            if(PlayerInfoM.instance.getGameSetting().shake){
                WxManager.instance.shakeLong();
            }
            return;
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
                efData.endPoint=new Point(efData.startPoint.x,GamemainM.instance.getFishpileEndY(fishboxsp.height));
                efData.startScale=efData.endScale;
                GameEffect.instance.creatBaseMove(effectName,efData,getdropObj.num);
            }));









            if(getdropObj.comboNum>1){
                changePowerBox("update");//能量box更新
                changeFishhookSpd("update");//速度更新
            }

            if(getdropObj.comboNum>0){
                GameSoundManager.onPlaySound("combo2");

                //鱼附属奖励
                var config:Object=getdropObj.cfg;
                if(Math.random()<0.5+0.1*getdropObj.comboNum && config.getAward){
                    var index:int=Math.floor(Math.random()*config.award_type.length);
                    var awardName:String=cfg_currency.instance(config.award_type[index]+"").property;
                    var maxNum:int=config.award_num[index];
                    getMoneyEffect({name:awardName,num:Math.ceil(Math.random()*maxNum)},false);
                }

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

        if(popObject.num>1){
            GameSoundManager.onPlaySound("combo");
        }
        //over effect
        getMoneyEffect(popObject,true);
    }

    private function getMoneyEffect(popObject:Object,refreshFish:Boolean):void
    {
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
            }else if(popObject.name=="pearl"){
                p=new Point(pearlScoreImg.x,pearlScoreImg.y);
            }
            efData.endPoint=scoreBox.localToGlobal(p);
            GameEffect.instance.creatBezierMove(popObject.name,efData,popObject.num,Handler.create(this,function () {
                if(refreshFish){
                    changeDropFishBoxState("over");
                    canDrop=true;
                }
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
                canDropMatch=true;//收杆动作结束后，再重置 canDropMatch
                //canDrop=true;
                drawFishline("clear");
            }));
        }
        else if(action=="clear"){
            _hookImgANI.removeSelf();
            _fishlineSp.graphics.clear();
            Laya.timer.clear(this,onfishLineTime);
        }
    }

    private var _lineHeaddx:int;
    private var _lineHeaddy:int;
    private function onfishLineTime():void
    {
        var rodPot:Point;
        if(_hookState=="fishstart"){
            _fishlineSp.graphics.clear();
            rodPot=new Point(captainImg.x-80,captainImg.y-10);
            rodPot=shipBox.localToGlobal(rodPot);
            rodPot=this.globalToLocal(rodPot);
            _lineHeaddx=rodPot.x;
            _lineHeaddy=rodPot.y;
            var hookPot:Point=new Point(fishhookImg.x,fishhookImg.y-fishhookImg.height/2);
            hookPot=dropFishBox.localToGlobal(hookPot);
            hookPot=this.globalToLocal(hookPot);
            _fishlineSp.graphics.drawLine(rodPot.x,rodPot.y,hookPot.x,hookPot.y,"#ff0000");
        }
        else if(_hookState=="fishover"){
            _fishlineSp.graphics.clear();
            rodPot=new Point(captainImg.x-80,captainImg.y-10);
            rodPot=shipBox.localToGlobal(rodPot);
            rodPot=this.globalToLocal(rodPot);
            _lineHeaddx+=2;
            _lineHeaddy-=2;
//            if(_lineHeaddx>=rodPot.x+8){
//                _lineHeaddx-=1.5;
//                _lineHeaddy-=1.5;
//            }
            _fishlineSp.graphics.drawLine(_lineHeaddx,_lineHeaddy,_hookImgANI.x,_hookImgANI.y,"#ff0000");
        }
    }












    public function updateShipslot():void
    {
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
        GameEventDispatch.instance.on(GameEvent.BossComIngMode,this,gameBoss);

        GameEventDispatch.instance.on(GameEvent.ClearClick,this,clearClick);
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

        GameEventDispatch.instance.off(GameEvent.BossComIngMode,this,gameBoss);

        GameEventDispatch.instance.off(GameEvent.ClearClick,this,clearClick);

    }

    public function closePanel():void
    {
        this.visible=false;
    }

    public function clearAllNum():void
    {
        drawFishline("clear");
        clearfishImgArr();
        fishboxsp.removeChildren();
    }


}
}
