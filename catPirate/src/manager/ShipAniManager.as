package manager {
import laya.ui.Box;
import laya.utils.Handler;
import laya.utils.Tween;

public class ShipAniManager {

    public static var _instance:ShipAniManager;

    private var _ship:Box;
    private var _aniDic:Array=[];
    private var _aniIndex:Number=0;


    public function ShipAniManager() {
    }

    public static function get instance():ShipAniManager
    {
        return _instance || (_instance=new ShipAniManager());
    }

    public function setShipBox(shipbox:Box):void
    {
        _ship=shipbox;
    }
    public function getShipBox():Box
    {
        return _ship;
    }


    public function shipAniControl(lv:Number):void
    {
        if(lv==1){
            _aniDic=[
                {x:325,y:795,rotation:0.5,time:1000},
                {x:323,y:785,rotation:0,time:2000},
                {x:327,y:790,rotation:-0.5,time:2000},
            ];
        }else if(lv==2){

        }else if(lv==3){

        }
        aniStart();
    }

    private function aniStart():void
    {
        Tween.clearAll(_ship);
        var param:Object=_aniDic[_aniIndex%(_aniDic.length-1)];
        Tween.to(_ship,param,param.time,null,Handler.create(this,function () {
            _aniIndex++;
            aniStart();
        }));
    }





}
}
