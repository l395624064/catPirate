package model {
import laya.d3.math.Vector2;
import laya.maths.Point;
import laya.ui.Image;

public class GamemainM {

    public static var _instance:GamemainM;

    private var _colorImgDic:Object={
        blue:{lifenum:0,dx:600,addluck:0,baseluck:0.5},
        yellow:{lifenum:0,dx:600,addluck:0,baseluck:0.5},
        colours:{lifenum:0,dx:600,addluck:0,baseluck:0.01}
    };
    public function GamemainM() {
    }

    public static function get instance():GamemainM
    {
        return _instance||=new GamemainM();
    }

    public function gethookColorImg():Array
    {
        //get blue img pos
        //get yellow img pos
        //get colours img pos


        var coloursImgAppear:Boolean=_colorImgDic['colours']['lifenum'];

        //get img Number
        var chooseNum:int=1;
        (Math.random()>.3)? chooseNum=1:chooseNum=2;
        if(coloursImgAppear)chooseNum=1;

        //get imgObj in _colorImgDic
        var openlist:Array=[];
        for(var str:String in _colorImgDic){
            if(str=="colours" && coloursImgAppear){
                _colorImgDic['colours']['lifenum']--;
            }else{
                _colorImgDic[str]['dx']=600;//clear dx
                openlist.push(str);
            }
        }

        //check luck in openlist And push in closelist
        var closelist:Array=[];
        var imgName:String;
        var baseluck:Number;
        var addluck:Number;
        while (closelist.length<chooseNum){
            for(var i:int=openlist.length-1;i>=0;i--){
                imgName=openlist[i];
                baseluck=_colorImgDic[imgName]['baseluck'];
                addluck=_colorImgDic[imgName]['addluck'];
                if(Math.random()<baseluck+addluck && closelist.indexOf(imgName)==-1){
                    closelist.push(imgName);
                    openlist.splice(i,1);
                    break;
                }
            }
        }

        //if get colours And Stay lifeTime
        const lifeTime:int=2;
        if(closelist.indexOf("colours")!=-1){
            _colorImgDic['colours']['lifenum']=lifeTime;
        }
        console.log("-closelist:",closelist);


        //repair _colorImgDic pos
        var posArr:Array=[];//[100,300,600] blue yellow colours
        if(coloursImgAppear) posArr.push(_colorImgDic['colours']['dx']);

        const imgWidth:Number=90;
        const repairX:Number=20;
        const min:Number=45;
        const max:Number=400;
        imgName="";

        var dx:Number=0;
        var targetdx:Number=0;
        var direction:int=1;//-1:left 1:right
        while (closelist.length>0){
            imgName=closelist.pop();
            dx=Math.floor(min+Math.random()*(max-min));
            for(var j:int=posArr.length-1;j>=0;j--){
                targetdx=posArr[j];
                direction=1;
                if(Math.abs(targetdx-dx)<=imgWidth){
                    if(dx<targetdx){
                        console.log("--left dx:",dx,"targetdx:",targetdx);
                        if(dx-(imgWidth+repairX)>=min){
                            direction=-1
                        }else{
                            direction=1;
                        }
                    }
                    else if(dx>targetdx){
                        console.log("--right dx:",dx,"targetdx:",targetdx);
                        if(dx+(imgWidth+repairX)<=max){
                            direction=1
                        }else{
                            direction=-1;
                        }
                    }
                    dx=targetdx+((imgWidth+repairX)*direction);
                    console.log("--repair dx:",dx);
                }
            }
            posArr.push(dx);
            _colorImgDic[imgName]['dx']=dx;
        }

        //checkout _colorImgDic pos
        console.log("-_colorImgDic",_colorImgDic);
        return imgPosArr;
    }

    private function get imgPosArr():Array
    {
        var arr:Array=[];
        var nameArr:Array=["blue","yellow","colours"];
        for(var i:int=0;i<nameArr.length;i++){
            arr.push(_colorImgDic[nameArr[i]]['dx']);
        }
        return arr;
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
                    obj.name="pearl";
                    break;
                }
                else if(i==3){
                    break;
                }
            }
        }

        if(obj.name=="pearl"){
            obj.num = 1;
        }
        else if(rangeNum<=5){
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
