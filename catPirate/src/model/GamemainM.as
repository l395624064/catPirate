package model {
import laya.d3.math.Vector2;
import laya.maths.Point;
import laya.ui.FontClip;
import laya.ui.Image;
import laya.ui.Image;

import manager.GameEvent;

import manager.GameEventDispatch;

import model.FishM;

import src.model.ShopM;

public class GamemainM {

    public static var _instance:GamemainM;

    private var _colorImgDic:Object={
        blue:{lifenum:0,dx:600,addluck:0,baseluck:0.5},
        yellow:{lifenum:0,dx:600,addluck:0,baseluck:0.5},
        colours:{lifenum:0,dx:600,addluck:0,baseluck:0.01}
    };

    private var _fishImgArr:Array=[];
    private var _lastDrop:Object={img:null,combo:1};
    private var _fishBoxDic:Object={};

    private var _fontclip:FontClip;
    private const _gameAllTime:int=30;
    private var _gameTime:int;

    public function GamemainM() {
    }

    public static function get instance():GamemainM
    {
        return _instance||=new GamemainM();
    }


    public function setTimeClock(action:String,clip:FontClip=null):void
    {
        if(action=="start"){
            if(clip) _fontclip=clip;
            _gameTime=_gameAllTime;
            _fontclip.value=_gameTime+"";
            Laya.timer.loop(1000,this,onTimeClock);
        }else if(action=="over"){
            Laya.timer.clear(this,onTimeClock);
            GameEventDispatch.instance.event(GameEvent.GameTimeout);
        }else if(action=="stop"){

        }else if(action=="update"){

        }
    }
    private function onTimeClock():void
    {
        _gameTime--;
        _fontclip.value=_gameTime+"";
        if(_gameTime<=0) setTimeClock("over");
    }

    private function getFishImgNum():int
    {
        var num:int;
        (Math.random()>.5)? num=5:num=8;
        return num;
    }

    public function getFishImg():Array
    {
        //get have fish
        var ownfishObj:Array=FishM.instance.getOwnfish();
        for(var i:int=0;i<ownfishObj.length;i++){
            var obj:Object=ownfishObj[i];
            obj['appearNum']=obj['appearMax_num'];
        }
        //get fishImgNum
        var fishNum:int=getFishImgNum();

        //check fish img
        var fishImgArr:Array=[];
        var fishImg:Image;
        var luckNum:Number;
        var fishName:String;
        var appearNum:int;
        var maxImgwidth:Number=0;
        const imgYnum:int=5;

        while (fishImgArr.length<fishNum){
            for(var i:int=0;i<ownfishObj.length;i++){
                fishName=ownfishObj[i]['name'];
                appearNum=ownfishObj[i]['appearNum'];
                luckNum=FishM.instance.getFishLuckByName(fishName);
                if(Math.random()<luckNum && appearNum>0){
                    ownfishObj[i]['appearNum']--;

                    fishImg=new Image(ownfishObj[i]['res']);
                    //fishImg.anchorX=ownfishObj[i]['anchor_pos'][0];
                    fishImg.x=maxImgwidth;
                    fishImg.y=imgYnum;

                    fishImg.dataSource=ownfishObj[i];
                    fishImgArr.push(fishImg);

                    maxImgwidth+=fishImg.width;
                    if(fishImgArr.length==fishNum) break;
                }
            }
        }


        //get  pop in fishImgArr And add maxImgwidth

        //repair fish img pos
        const min:Number=0;
        const max:Number=420;

        //check maxImgWidth > max
        while(maxImgwidth>=max){
            var wid:Number=fishImgArr.pop().width;
            maxImgwidth-=wid;
        }

        var useWidth:Number=0;
        var pixWidth:Number=Math.floor(max-maxImgwidth);
        var randomChoose:int=1;
        for(var j:int=0;j<fishImgArr.length;j++){
            var img:Image=fishImgArr[j];
            if(img.width<50) randomChoose=3;
            else if(img.width>=50 && img.width<60) randomChoose=2;
            else randomChoose=1;
            img.x=useWidth+Math.floor(Math.random()*pixWidth/randomChoose);
            useWidth=(img.x+img.width);
            maxImgwidth-=img.width;
            pixWidth=Math.floor(max-maxImgwidth-useWidth);
        }

        _fishImgArr=fishImgArr;
        return fishImgArr;
    }



    public function getdropFish(hookPoint:Point):Object
    {
        var dropObj:Object;
        var typeName:String;
        const pixNum:Number=10;
        var mouthX:Number=0;
        for(var i:int=0;i<_fishImgArr.length;i++){
            mouthX=_fishImgArr[i].x+_fishImgArr[i].width*_fishImgArr[i]['dataSource']['anchor_pos'][0];
            if(Math.abs(hookPoint.x-mouthX)<pixNum){
                typeName=FishM.instance.checkTypeByName(_fishImgArr[i]['dataSource']['typeId']);
                dropObj={img:_fishImgArr[i],num:1,type:typeName};

                if(typeName=="fish"){
                    putInFishBox(_fishImgArr[i]['name']);
                    dropObj['num']=checkCombo();
                }
                else if(typeName=="pop"){

                }
                break;
            }
        }
        setlastDrop(dropObj);
        return dropObj;
    }

    public function getFishpileEndY(basewidth:Number):Number
    {
        var endY:Number=0;
        if(getFishBoxNum<=70){
            endY=0;
        }else if(getFishBoxNum>70 && getFishBoxNum<100){
            endY=-1*basewidth/4;
        }else if(getFishBoxNum>100 && getFishBoxNum<120){
            endY=-1*basewidth/3;
        }else if(getFishBoxNum>120 && getFishBoxNum<150){
            endY=-1*basewidth/2;
        }else{
            endY=Math.random()*basewidth/3;
        }
        return endY;
    }

    private function get getFishBoxNum():int
    {
        var num:int=0;
        for(var str:String in _fishBoxDic){
            num+=_fishBoxDic[str];
        }
        return num;
    }

    public function get getFishBox():Object
    {
        return _fishBoxDic;
    }

    private function putInFishBox(name:String):void
    {
        if(_fishBoxDic.hasOwnProperty(name)) _fishBoxDic[name]+=1;
        else _fishBoxDic[name]=1;
    }

    private function setlastDrop(value:Object):void
    {
        _lastDrop['img']=value;
        if(!value)_lastDrop['combo']=1;
    }
    private function checkCombo():int
    {
        var comboNum:int=1;
        const maxCombo:int=10;
        if(_lastDrop && _lastDrop['img']){
            _lastDrop['combo']+=1;
            if(_lastDrop['combo']>=maxCombo) _lastDrop['combo']=1;
            console.log("combo:",_lastDrop['combo']);
            comboNum=_lastDrop['combo'];
        }
        return comboNum;
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
        //console.log("-closelist:",closelist);


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
                        //console.log("--left dx:",dx,"targetdx:",targetdx);
                        if(dx-(imgWidth+repairX)>=min){
                            direction=-1
                        }else{
                            direction=1;
                        }
                    }
                    else if(dx>targetdx){
                        //console.log("--right dx:",dx,"targetdx:",targetdx);
                        if(dx+(imgWidth+repairX)<=max){
                            direction=1
                        }else{
                            direction=-1;
                        }
                    }
                    dx=targetdx+((imgWidth+repairX)*direction);
                    //console.log("--repair dx:",dx);
                }
            }
            posArr.push(dx);
            _colorImgDic[imgName]['dx']=dx;
        }

        //checkout _colorImgDic pos
        //console.log("-_colorImgDic",_colorImgDic);
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
