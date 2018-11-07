package manager {
import data.EffectD;

import laya.display.Sprite;

import laya.events.Event;
import laya.events.EventDispatcher;

import laya.maths.Point;
import laya.maths.Point;
import laya.ui.Image;
import laya.utils.Ease;
import laya.utils.Handler;
import laya.utils.Tween;

import src.GameConfig;

public class GameEffect {

    public static var _instance:GameEffect;

    private var _effectDic:Object={};
    private var _effectImgArr:Array=[];
    private var _moveMode:String="";
    private var _bezierOverHandler:Handler;
    private var _baseOverHandler:Handler;

    public function GameEffect() {
        _effectDic={};

        //changeEffectTimer("start");
    }

    public static function get instance():GameEffect
    {
        return _instance || (_instance=new GameEffect());
    }

    public function changeEffectTimer(action:String):void
    {
        /*
        if(action=="start"){
            Laya.timer.loop(500,this,checkEffectDie);
        }else if(action=="over"){
            Laya.timer.clear(this,checkEffectDie);
        }*/
        if(action=="move"){
            Laya.timer.frameLoop(1,this,onEffectTime);
        }else if(action=="stop"){
            Laya.timer.clear(this,onEffectTime);
        }
    }
    private function checkEffectDie():void
    {
        for(var str:String in _effectDic){
            var ef:*=_effectDic[str];
            if(ef.hasOwnProperty('die') && ef['die']){
                ef['die']=false;
                ef.removeSelf();
            }
        }
    }


    private function onEffectTime():void
    {
        if(_moveMode=="Bezier"){
            if(_effectImgArr.length>0){
                bezierMove();
            }else{
                changeEffectTimer("stop");
                if(_bezierOverHandler) _bezierOverHandler.run();
            }
        }
        else if(_moveMode=="Base"){
            if(_effectImgArr.length>0){
                baseMove();
            }else{
                changeEffectTimer("stop");
                if(_baseOverHandler) _baseOverHandler.run();
            }
        }
    }







    private function getEffectImg(name:String):*
    {
        return _effectDic[name] || new Image(checkFullURL(name));
    }
    private function getEffectURL(name:String):String
    {
        return checkFullURL(name);
    }

    private function checkFullURL(url:String):String
    {
        var arr:Array=url.split("/");
        if(arr.length>1){
            return url;
        }
        return "ui/common_ef/"+url+".png";
    }

    public function creatSignPopMove(name:String,effectD:EffectD,func:Handler=null):void
    {
        var popImg:Image=getEffectImg(name);
        popImg['type']=name;
        _effectDic[name]=popImg;

        popImg.scale(1,1);
        popImg.pos(effectD.startPoint.x,effectD.startPoint.y);
        popImg.zOrder=effectD.zOrder;
        popImg.scale(effectD.startScale,effectD.startScale);
        effectD.panelSp.addChild(popImg);

        Tween.to(popImg,{x:effectD.endPoint.x,y:effectD.endPoint.y,scaleX:effectD.endScale,scaleY:effectD.endScale},effectD.dealtTime,effectD.easeMode,Handler.create(this,function () {
            if(func) func.run();
            if(effectD.stayTime>0){
                Laya.timer.once(effectD.stayTime,this,function () {
                    if(effectD.overDie) popImg.removeSelf();
                });
            }else if(effectD.overDie) popImg.removeSelf();
        }));
    }

    public function creatBaseMove(name:String,effectD:EffectD,imgNum:int,func:Handler=null):void
    {
        if(func) _baseOverHandler=func;
        var url:String=getEffectURL(name);
        var img:Image;

        var min:Number=0;
        var max:Number=0;
        var maxY:Number=0;
        for(var i:int=0;i<imgNum;i++){
            img=new Image(url);
            img.zOrder=effectD.zOrder;
            min=effectD.startPoint.x-10;
            max=effectD.startPoint.x+10;
            maxY=effectD.startPoint.y+10;
            img.pos(min+Math.random()*(max-min),maxY);
            if(imgNum==1) img.pos(effectD.startPoint.x,maxY);

            img.scale(effectD.startScale,effectD.startScale);

            img['type']="fish";
            img['spd']=3+Math.random()*8;
            img['endPoint']=effectD.endPoint;

            effectD.panelSp.addChild(img);
            _effectImgArr.push(img);
        }
        _moveMode="Base";
        changeEffectTimer("move");
    }


    private function baseMove():void
    {
        //console.log("-_effectImgArr:",_effectImgArr);
        var img:Image;
        for(var i:int=_effectImgArr.length-1;i>=0;i--){
            img=_effectImgArr[i];
            img.y+=img['spd'];
            if(img.y>=img['endPoint'].y){
                _effectImgArr.splice(i,1);
            }
        }
    }


    public function creatBezierMove(name:String,effectD:EffectD,imgNum:int,func:Handler=null):void
    {
        if(func) _bezierOverHandler=func;
        var url:String=getEffectURL(name);
        var img:Image;

        for(var i:int=0;i<imgNum;i++){
            img=new Image(url);
            img.zOrder=effectD.zOrder;
            img.pos(effectD.startPoint.x,effectD.startPoint.y);

            img['type']=name;

            img['p0']=effectD.startPoint;
            img['p1']=getBezierControlPoint(effectD.startPoint);
            img['p2']=effectD.endPoint;
            img['spd']=getBezierspd(imgNum);
            img['t']=0;

            effectD.panelSp.addChild(img);
            _effectImgArr.push(img);
        }
        _moveMode="Bezier";
        changeEffectTimer("move");
    }




    private function getBezierspd(num:int):Number
    {
        var staSpd:Number=0.02;
        if(num<5) staSpd=0.04;
        return staSpd+Math.random()*0.02;
    }

    private function getBezierControlPoint(startPoint:Point):Point
    {
        var p:Point=new Point();
        const mindx:Number=0;
        const maxdx:Number=GameConfig.width;

        p.y=Math.floor(startPoint.y);
        p.x=Math.floor(Math.random()*maxdx);

        return p;
    }

    private function getBezierPos(t:Number,p0:Point,p1:Point,p2:Point):Object
    {
        var dx:Number=(1-t) * (1-t) * p0.x + 2 * t * (1-t) * p1.x + t * t * p2.x;
        var dy:Number=(1-t) * (1-t) * p0.y + 2 * t * (1-t) * p1.y + t * t * p2.y;
        return {x:dx,y:dy};
    }


    private function bezierMove():void
    {
        var img:Image;
        var potObj:Object;
        var t,spd:Number;
        for(var i:int=_effectImgArr.length-1;i>=0;i--)
        {
            img=_effectImgArr[i];
            spd=img['spd'];
            t=img['t'];
            t+=spd;
            if(t<1){
                potObj=getBezierPos(t,img['p0'],img['p1'],img['p2']);
                img.pos(potObj['x'],potObj['y']);
                img['t']=t;
            }else{
                img.removeSelf();
                addEvent(img['type']);
                _effectImgArr.splice(i,1);
            }
        }
    }

    private function addEvent(type:String):void
    {
        if(type=="plank"){
            GameEventDispatch.instance.event(GameEvent.PlankScoreANI);
        }
        else if(type=="gold"){
            GameEventDispatch.instance.event(GameEvent.GoldScoreANI);
        }
        else if(type=="pearl"){
            GameEventDispatch.instance.event(GameEvent.PearlScoreANI);
        }
    }




    private function getImgSkin(img:Image):String
    {
        return img['skin'];
    }

}
}
