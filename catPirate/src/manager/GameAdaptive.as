package manager {
import laya.display.Sprite;

public class GameAdaptive {

    public static var _instance:GameAdaptive;
    public function GameAdaptive() {
    }

    public static function get instance():GameAdaptive
    {
        return _instance||=new GameAdaptive();
    }

    public function setMiddleFromPanel(img:Sprite,panel:Sprite):void
    {
        var scaleNum:Number;
        var pixX:Number;
        var pixY:Number;

        if(img.width>img.height){
            scaleNum=panel.width/img.width;
        }else{
            scaleNum=panel.height/img.height;
        }
        img.size(img.width*scaleNum,img.height*scaleNum);
        pixX=Math.abs(img.width-panel.width);
        pixY=Math.abs(img.height-panel.height);
        img.pos(pixX/2,pixY/2);
    }
}
}
