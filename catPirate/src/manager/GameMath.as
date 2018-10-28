package manager {
import laya.maths.Point;
import laya.ui.Image;

public class GameMath {

    public static var _instance:GameMath;
    public function GameMath() {
    }

    public static function get instance():GameMath
    {
        return _instance|| (_instance=new GameMath());
    }

    public function gethookColorImg():Array
    {
        //get blue img pos
        //get yellow img pos
        //get colours img pos

        //min:45 max:400
        //width:90
        return [100,300,600];
    }

    public function getdropPopNum(hookPoint:Point,colorArr:Array):Object
    {
        var obj:Object={name:"",num:1};
        var dx:Number=hookPoint.x;
        //colorArr= blueImg yellowImg coloursImg

        var colorImg:Image;
        var rangeNum:Number=1000;
        for(var i:int=0;i<colorArr.length;i++)
        {
            //colorImg=colorArr[i];
            if((dx < colorArr[i].x+colorArr[i].width/2) && (dx > colorArr[i].x-colorArr[i].width/2)){
                rangeNum=Math.abs(colorArr[i].x-dx);
                if(i==0){
                    obj.name="plank";
                    break;
                }
                else if(i==1){
                    obj.name="gold";
                    break;
                }
                else if(i==2){
                    obj.name="colours";
                    break;
                }
                else if(i==3){
                    break;
                }
            }
        }

        if(rangeNum<=5){
            obj.num=50;
        }else if(rangeNum<45){
            obj.num=Math.round((45-rangeNum)/2);
        }else{
            obj.num = 1;
            obj.name = (Math.random() > .5)? "plank":"gold";
        }

        return obj;
    }


}
}
