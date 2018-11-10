package view.gameend {
import laya.events.Event;
import laya.maths.Point;
import laya.ui.Box;
import laya.ui.Image;
import laya.utils.Ease;
import laya.utils.Handler;
import laya.utils.Tween;

import manager.GameEvent;

import manager.GameEventDispatch;

import model.FishM;

import model.GamemainM;

import ui.GameendUI;

import view.PanelVo;

public class Gameend extends GameendUI implements PanelVo{

    public static var _instance:Gameend;
    private var _fishArr:Array=[];

    private var _updateWaterNum:Number=0;//单位重量增加水位

    private var _fishMsgArr:Array=[];
    private var _totalWeight:Number=0;//总重量
    private var _fishgroupIndex:int=0;

    private var _starArr:Array=[];
    private var _starPosArr:Array=[
        {x:24,y:14},
        {x:-8,y:62},
        {x:1,y:186},
        {x:6,y:292},
        {x:14,y:387}
    ];
    private  const waterBox:Object={
        x:0,y:450,width:300,height:80,
        maxWeight:1000,maxWater:450
    };

    public function Gameend() {
        super();
    }
    public static function get instance():Gameend
    {
        return _instance||=new Gameend();
    }

    public function openPanel(param:Object=null):void
    {
        initWater();
        initStar();


        //获取鱼数据
        var fishBox:Object=GamemainM.instance.getFishBox;
        _fishMsgArr=sortFishFromWeight(fishBox);

        if(_fishMsgArr.length>0){
            putFishInBox("start");
            Laya.timer.frameLoop(1,this,onFishTime);
        }else{

        }
    }

    private function sortFishFromWeight(fishBox:Object):Array
    {
        var fishArr:Array=[];
        var fishObj:Object;
        for(var str:String in fishBox){
            fishObj={name:str,num:fishBox[str],sortId:FishM.instance.getSortIdByName(str)};
            fishArr.push(fishObj);
        }

        fishArr.sort(function (a,b) {
            return (a.sortId>b.sortId)?  1:-1;
        });

        return fishArr;
    }

    private function putFishInBox(action:String):void
    {
        if(action=="start"){
            creatFishGroup(_fishMsgArr[0]);
        }
        else if(action=="next"){
            _fishgroupIndex++;
            if(_fishgroupIndex<_fishMsgArr.length){
                var _fishObj:Object=_fishMsgArr[_fishgroupIndex];
                if(_fishgroupIndex==_fishMsgArr.length-1 && _fishMsgArr.length>1){
                    Laya.timer.once(2000,this,creatFishGroup,[_fishObj]);
                }else{
                    Laya.timer.once(500,this,creatFishGroup,[_fishObj]);
                }
            }
            else if(_fishgroupIndex==_fishMsgArr.length){
                putFishInBox("over");
            }
        }
        else if(action=="over"){
            Laya.timer.once(3000,this,function () {
                var param:Object={weight:_totalWeight,maxweight:waterBox.maxWeight};
                GameEventDispatch.instance.event(GameEvent.GameEndAward,param);
            })
        }
    }

    private function creatFishGroup(fishObj:Object):void
    {
        var fishName:String=fishObj['name'];
        var url:String=FishM.instance.getFishObjByName(fishName).res;
        var fishNum:int=fishObj['num'];

        //var startPot:Point=new Point(waterbox.x,waterbox.y);
        const minX:Number=50;
        const maxX:Number=200;
        const minY:Number=-100;
        const maxY:Number=-150;
        const minSpd:int=6;
        const maxSpd:int=2;
        var fish:Image;
        for(var i:int=0;i<fishNum;i++){
            fish=new Image(url);
            fish['name']=fishName;
            fish['state']="drop";
            fish['spd']=minSpd+Math.random()*maxSpd;
            fish.pos(minX+Math.random()*(maxX-minX),minY+Math.random()*(maxY-minY));
            waterbox_sp.addChild(fish);
            _fishArr.push(fish);
        }

        putFishInBox("next");
    }




    private function onFishTime():void
    {
        var fish:Image;
        for(var i:int=_fishArr.length-1;i>=0;i--){
            fish=_fishArr[i];
            if(fish['state']=="drop"){
                fishDrop(fish);
            }
            else if(fish['state']=="turnLeft"){
                fishTurnLeft(fish);
            }
            else if(fish['state']=="turnRight"){
                fishTurnRight(fish);
            }
            else if(fish['state']=="moveLeft"){
                fishMoveLeft(fish);
            }
            else if(fish['state']=="moveRight"){
                fishMoveRight(fish);
            }
        }

    }

    private function fishDrop(fish:Image):void
    {
        fish.y+=fish['spd'];
        if(fish.y>=water_ceil.y+40){
            fish.rotation=-90;
            fish.anchorY=0.5;
            (Math.random()>.5)?  fish['state']="turnLeft":fish['state']="turnRight";
            const minSpd:int=1;
            const maxSpd:int=2;
            fish['spd']=minSpd+Math.random()*maxSpd;

            var weight:Number=FishM.instance.getWeightByName(fish['name']);
            updateWater(weight);
        }
    }




    private function initWater():void
    {
        water_floor.x=waterBox.x;
        water_floor.y=waterBox.y;
        water_floor.width=waterBox.width;
        water_floor.height=waterBox.height;
        water_ceil.x=water_floor.x;
        water_ceil.y=water_floor.y-water_ceil.height;
        water_ceil.width=water_floor.width;
        water_ceil.height=10;

        //maxWeight 单位kg
        _updateWaterNum=waterBox.maxWater/waterBox.maxWeight;

        const waterPipe:Object={
            x:0,y:450,width:50,height:80};
        waterpipe_floor.x=waterPipe.x;
        waterpipe_floor.y=waterPipe.y;
        waterpipe_floor.width=waterPipe.width;
        waterpipe_floor.height=waterPipe.height;
        waterpipe_ceil.x=waterpipe_floor.x;
        waterpipe_ceil.y=waterpipe_floor.y-waterpipe_ceil.height;
        waterpipe_ceil.width=waterpipe_floor.width;
        waterpipe_ceil.height=10;
    }

    private function initStar():void
    {
        const starNum:int=5;
        var star:Image;
        var posObj:Object;
        for(var i:int=1;i<starNum+1;i++){
            star=waterpipe.getChildByName("star"+i) as Image;
            posObj=_starPosArr[i-1];
            star.pos(posObj.x,posObj.y);
            star.visible=true;
            star.name="star"+i;
            _starArr.push(star);
        }
    }

    private function updateWater(weight:Number):void
    {
        if(water_floor.height>waterbox.height) return;

        _totalWeight+=weight;
        //console.log("-_totalWeight:",_totalWeight);

        water_floor.height+=weight*_updateWaterNum;
        water_floor.y=waterbox.height-water_floor.height;
        water_ceil.y=water_floor.y-water_ceil.height;

        waterpipe_floor.height=water_floor.height;
        waterpipe_floor.y=water_floor.y;
        waterpipe_ceil.y=waterpipe_floor.y-waterpipe_ceil.height;

        checkStart();
    }
    private function checkStart():void
    {
        var star:Image;
        for(var i:int=_starArr.length-1;i>=0;i--){
            star=_starArr[i];
            if(waterpipe_floor.y<=star.y){
                _starArr.splice(i,1);
                getStarAni(star);
            }
        }
    }
    private function getStarAni(star:Image):void
    {
        var rolePot:Point;
        var roleParent:Box;
        roleParent=roleImg.parent as Box;
        rolePot=new Point(roleImg.x,roleImg.y);
        rolePot=roleParent.localToGlobal(rolePot);
        rolePot=waterpipe.globalToLocal(rolePot);
        Tween.to(star,{x:rolePot.x,y:rolePot.y},800,Ease.circIn,Handler.create(this,function () {
            star.visible=false;
        }))
    }


    private function fishMoveLeft(fish:Image):void
    {
        if(fish.x>fish.height/2) fish.x-=fish['spd'];
        else fish['state']="turnRight"
    }
    private function fishMoveRight(fish:Image):void
    {
        if(fish.x<waterbox.width-fish.height/2) fish.x+=fish['spd'];
        else fish['state']="turnLeft"
    }

    private function fishTurnLeft(fish:Image):void
    {
        fish.scaleY=1;
        fish['state']="moveLeft"
    }
    private function fishTurnRight(fish:Image):void
    {
        fish.scaleY=-1;
        fish['state']="moveRight"
    }


    public function clearAllNum():void
    {
        Laya.timer.clear(this,onFishTime);
        clearFish();

        _fishMsgArr=[];
        _totalWeight=0;
        _fishgroupIndex=0;
    }

    private function clearFish():void
    {
        for(var i:int=0;i<_fishArr.length;i++){
            _fishArr[i].removeSelf();
            _fishArr[i]=null;
        }
        _fishArr=[];
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
