package view.gameend {
import laya.events.Event;
import laya.maths.Point;
import laya.ui.Image;

import manager.GameEvent;

import manager.GameEventDispatch;

import model.FishM;

import model.GamemainM;

import ui.GameendUI;

import view.PanelVo;

public class Gameend extends GameendUI implements PanelVo{

    public static var _instance:Gameend;
    private var _fishArr:Array=[];
    private var _waterUpSpd:Number=1;

    public function Gameend() {
        super();
    }
    public static function get instance():Gameend
    {
        return _instance||=new Gameend();
    }

    public function openPanel(param:Object=null):void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameOver);
        });

        //获取鱼数据
        var fishBox:Array=GamemainM.instance.getFishBox;
        console.log("-fishBox:",fishBox);
        putFishInBox(fishBox);

        Laya.timer.frameLoop(1,this,onWaterANiTime);
        //Laya.timer.frameLoop(1,this,onFishTime);
    }

    private function putFishInBox(fishBox:Object):void
    {
        var startPot:Point=new Point(waterbox.x,waterbox.y);
        const minX:Number=startPot.x+waterbox.width/3;
        const maxX:Number=startPot.x+waterbox.width/3*2;
        const minY:Number=startPot.y-300;
        const maxY:Number=startPot.y-400;

        var url:String;
        var fish:Image;
        const minSpd:int=2;
        const maxSpd:int=5;
        for(var str:String in fishBox){
            url=FishM.instance.getFishObjByName(str).res;
            fish=new Image(url);
            fish['state']="drop";
            fish['spd']=minSpd+Math.random()*maxSpd;
            fish.pos(minX+Math.random()*(maxX-minX),minY+Math.random()*(maxY-minY));
            waterbox_sp.addChild(fish);
            _fishArr.push(fish);
        }


    }


    private function onWaterANiTime():void
    {
        water_floor.height+=_waterUpSpd;
        water_floor.y=waterbox.height-water_floor.height;
        water_ceil.y=water_floor.y-water_ceil.height;
        if(water_floor.height>waterbox.height){
            Laya.timer.clear(this,onWaterANiTime);
        }
    }

    private function onFishTime():void
    {
        var fish:Image;
        for(var i:int=_fishArr.length-1;i>=0;i--){
            fish=_fishArr[i];
            if(fish['state']=="drop"){

            }

        }

    }

    private function fishDrop(fish:Image):void
    {
        fish.y+=fish['spd'];
        if(fish.y){

        }
    }

    public function clearAllNum():void
    {

    }
    public function closePanel():void
    {

    }
    public function register():void
    {

    }
    public function unRegister():void
    {

    }

}
}
