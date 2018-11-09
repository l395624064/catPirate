package data {
import laya.maths.Point;
import laya.utils.Ease;
import manager.UiManager;

public class FontClipD {
    public var startPoint:Point;
    public var endPoint:Point;
    public var value:String;
    public var dealtTime:Number=500;
    public var stayTime:Number=0;
    public var panelSp:*=Laya.stage;
    public var easeMode:Function=null;
    public var zOrder:Number=UiManager.instance.getUiBaseDepth("UITYPE_EFFECT");

    private var fontSkin:String;
    private var fontSheet:String;
    public function FontClipD() {
    }

    public function setFontSkin(Type:int):String
    {
        if(Type==1){
            fontSkin="font/font_3.png";
            fontSheet="0123456789";
        }else if(Type==2){
            fontSkin="font/font_2.png";
            fontSheet="/.+-0123456789枚万亿";
        }else if(Type==3){
            fontSkin="font/font_1.png";
            fontSheet="/.+-0123456789枚万亿";
        }else if(Type==4){
            fontSkin="font/4.png";
            fontSheet="/.+-0123456789";
        }else if(Type==5){
            fontSkin="font/3.png";
            fontSheet="/.+-0123456789";
        }
    }

    public function get Fontskin():String
    {
        return fontSkin;
    }
    public function get Fontsheet():String
    {
        return fontSheet;
    }
}
}
