package manager {
import data.EffectD;

import laya.maths.Point;
import laya.maths.Point;
import laya.ui.Image;
import laya.utils.Ease;
import laya.utils.Handler;
import laya.utils.Tween;

public class GameEffect {

    public static var _instance:GameEffect;

    private var _effectDic:Object={};
    private var _effectImg:Image;

    public function GameEffect() {
        _effectDic={};
    }

    public static function get instance():GameEffect
    {
        return _instance || (_instance=new GameEffect());
    }

    public function getEffectImg(name:String):*
    {
        return _effectDic[name];
    }
    public function clearEffectImg(name:String):void
    {
        var popImg=_effectDic[name];
        if(popImg){
            popImg.removeSelf();
        }
    }


    public function creatSignPopMove(name:String,effectD:EffectD,func:Handler=null):void
    {
        var popImg:Image=(_effectDic[name] || new Image("ui/common_ef/"+name+".png"));
        _effectDic[name]=popImg;
        popImg.pos(effectD.startPoint.x,effectD.startPoint.y);
        Laya.stage.addChild(popImg);
        Tween.to(popImg,{x:effectD.endPoint.x,y:effectD.endPoint.y},effectD.dealtTime,effectD.easeMode,func);
    }

    public function creatMorePopEffect(name:String,startPoint:Point,endPoint:Point):void
    {

    }

    private function getImgSkin(img:Image):String
    {
        return img['skin'];
    }

}
}
