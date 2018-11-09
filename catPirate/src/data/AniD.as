package data {
import laya.maths.Point;
import manager.UiManager;

public class AniD {
    public var aniUrl:String;
    public var playAniName:String;
    public var startPoint:Point;
    public var panelSp:*=Laya.stage;
    public var loop:Boolean=false;
    public var stayTime:int=0;
    public var zOrder:Number=UiManager.instance.getUiBaseDepth("UITYPE_ANI");

    public function AniD() {
    }
}
}
