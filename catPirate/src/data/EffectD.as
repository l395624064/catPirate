package data {
import laya.maths.Point;
import laya.utils.Ease;

import manager.UiManager;

public class EffectD {
    public var startPoint:Point;
    public var endPoint:Point;
    public var dealtTime:Number=500;
    public var stayTime:Number=0;
    public var panelSp:*=Laya.stage;
    public var easeMode:Function=Ease.backIn;
    public var overDie:Boolean=true;
    public var zOrder:Number=UiManager.instance.getUiBaseDepth("UITYPE_EFFECT");

    public function EffectD() {
    }
}
}
