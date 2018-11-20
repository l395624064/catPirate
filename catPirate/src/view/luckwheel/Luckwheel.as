package view.luckwheel {
import conf.cfg_currency;
import conf.cfg_wheel;

import data.GainnewD;

import laya.display.Text;

import laya.events.Event;
import laya.ui.Box;
import laya.ui.Image;
import laya.utils.Handler;

import manager.ConfigManager;

import manager.GameEvent;

import manager.GameEventDispatch;

import manager.UiManager;

import model.PlayerInfoM;

import ui.LuckwheelUI;
import view.PanelVo;

public class Luckwheel extends LuckwheelUI implements PanelVo{
    public static var _instance:Luckwheel;
    private var popArr:Array=[];
    private var _popboxArr:Array=[];
    private var _spdLv5:Number=8;
    private var _skinArr:Array=[
            "ui/common_ef/luck1.png",
            "ui/common_ef/luck2.png",
            "ui/common_ef/luck3.png",
            "ui/common_ef/luck4.png",
            "ui/common_ef/luck5.png"
    ];
    private var _rollTime:Boolean=false;
    private var _awardObj:Object={};

    public function Luckwheel() {
        super();
    }
    public static function get instance():Luckwheel
    {
        return _instance||=new Luckwheel();
    }

    public function openPanel(param:Object=null):void
    {
        initNum();
        this.closeBtn.on(Event.MOUSE_DOWN,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
            UiManager.instance.closePanel("Luckwheel");
        });

        startBtn.offAll();
        startBtn.on(Event.MOUSE_DOWN,this,function () {
            if(_rollTime)return;
            if(PlayerInfoM.instance.getLuckWheelNum()<=0){
                GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:7}]);
                return;
            }
            changewheelNum("minus");
            initNum();
            changewheelState("start");
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
        });

        shareBtn.offAll();
        shareBtn.on(Event.MOUSE_DOWN,this,function () {
            GameEventDispatch.instance.event(GameEvent.ADDwheelNumFromShare);
            changewheelNum("update");
        });

        explainBtn.offAll();
        explainBtn.on(Event.MOUSE_DOWN,this,function () {
            changeExplainState("open");
        });

        explainCloseBtn.on(Event.MOUSE_DOWN,this,function () {
            changeExplainState("close");
        });
    }

    private function changeExplainState(action:String):void
    {
        if(action=="open"){
            explainBox.visible=true;
            explainlist.array=ConfigManager.items("cfg_wheel");
            explainlist.renderHandler=new Handler(this,updatelist);
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
        }
        else if(action=="close"){
            explainBox.visible=false;
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
        }

    }

    private function updatelist(cell:Box,index:int):void
    {
        var cfg:Object=cell.dataSource;
        var ele_pop_img:Image=cell.getChildByName("popImg") as Image;

        var ele_award1_img:Image=cell.getChildByName("award1_box").getChildByName("award1_img") as Image;
        var ele_award2_img:Image=cell.getChildByName("award2_box").getChildByName("award2_img") as Image;
        var ele_award1_txt:Text=cell.getChildByName("award1_box").getChildByName("award1_txt") as Text;
        var ele_award2_txt:Text=cell.getChildByName("award2_box").getChildByName("award2_txt") as Text;

        var ele_award1_box:Box=cell.getChildByName("award1_box") as Box;
        var ele_award2_box:Box=cell.getChildByName("award2_box") as Box;

        ele_pop_img.skin=cfg.res;

        var awardTypeArr:Array=cfg.award_type;
        var awardNumArr:Array=cfg.award_num;
        if(awardTypeArr.length>0){
            ele_award1_box.visible=true;
            ele_award2_box.visible=false;

            ele_award1_img.skin=cfg_currency.instance(awardTypeArr[0]+"").res;
            ele_award1_txt.text=awardNumArr[0]+"";
        }
        if(awardTypeArr.length>1){
            ele_award2_box.visible=true;
            ele_award2_img.skin=cfg_currency.instance(awardTypeArr[1]+"").res;
            ele_award2_txt.text=awardNumArr[1]+"";
        }
    }




    private function initNum():void
    {
        popArr=[];
        setPopArr();
        getPopBox();
        changewheelNum("update");
    }

    private function getSpdLv(index:int,max:int,t:Number):Number
    {
        var spd:Number;
        const _spdNum:Number=0.012;
        const _mixSpd:Number=1;
        const _spdNum2:Number=0.0015;
        if(index>=max-3){
            //spd=_mixSpd;
            t-=_spdNum2;
            spd=t;
            if(spd<=0.1) spd=0.1;
        }
        else if(index>=max-30){
            t-=_spdNum;
            spd=t;
            if(spd<=_mixSpd) spd=_mixSpd;
        }else {
            spd=t;
        }
        return spd;
    }

    private function getPoPName(index:int):void
    {
        var index:int=index%_skinArr.length;
        var popName:String;
        switch (index){
            case 0:popName="苹果"
                break;
            case 1:popName="星星"
                break;
            case 2:popName="西瓜"
                break;
            case 3:popName="橘子"
                break;
            case 4:popName="山竹"
                break;
        }
        //console.log("--道具:",popName);
    }


    private function setPopArr():void
    {
        popArr=[1,1,1];
        if(popArr[1]<popArr[0]){
            popArr[1]+=_skinArr.length;
        }
        if(popArr[2]<popArr[1]){
            popArr[2]+=_skinArr.length;
        }
        getPoPName(popArr[0]);
        getPoPName(popArr[1]);
        getPoPName(popArr[2]);

        getAward(popArr);
    }

    private function getAward(arr:Array):void
    {
        if(arr.length!=3) throw new Error("wheel index id error!");
        _awardObj=checkAwardNeed(arr);
    }
    private function checkAwardNeed(arr:Array):Object
    {
        var cfg:Object={};
        var cfgAwarrd:Array=[];
        var cfgArr:Array=ConfigManager.items("cfg_wheel");
        for (var i:int=0;i<cfgArr.length;i++){
            cfg=cfgArr[i];
            cfgAwarrd=cfgArr[i].wheel_Id;
            for(var j:int=0;j<cfgAwarrd.length;j++){
                if(cfgAwarrd[j]!=arr[j]){
                    break;
                }
                if(j==2){
                    return cfg;
                }
            }
        }
        return null;
    }

    private function getPopBox():void
    {
        _popboxArr=[];
        var box:Box;
        for(var i:int=0;i<3;i++){
            box=maskBox.getChildByName("box"+i) as Box;
            setBoxPro(box,i);
            setItemSkin(box);
            _popboxArr.push(box);
        }
    }

    private function setBoxPro(box:Box,index:int):void
    {
        if(!box.hasOwnProperty('skinIndex')){
            box["skinIndex"]=_skinArr.length-1;
            box["popIndex"]=_skinArr.length*6+popArr[index];
        }
        else{
            var num:int=box["skinIndex"]+(_skinArr.length-box["skinIndex"]%_skinArr.length);
            box["popIndex"]=num+_skinArr.length*6+popArr[index];
        }

        if(!box.hasOwnProperty('headImage')){
            box["headImage"]=box.getChildByName("item"+4) as Image;
        }
        if(!box.hasOwnProperty('tailImage')){
            box["tailImage"]=box.getChildByName("item"+0) as Image;
        }
        box["Spd"]=_spdLv5;
        //console.log("-box:",box["popIndex"],box["skinIndex"],box["headImage"].name,box["tailImage"].name)
    }

    private function setItemSkin(box:Box):void
    {
        if(box.hasOwnProperty('state'))return;
        var img:Image;
        //var startIndex:int=parseInt(box["tailImage"].name.charAt(4));
        var arr:Array=box["tailImage"].name.split("m");
        var startIndex:int=parseInt(arr[1]);

        for(var i:int=0;i<box.numChildren-1;i++){
            img=box.getChildByName("item"+(startIndex+i)) as Image;
            img.skin=_skinArr[i];
        }
    }

    private function changewheelNum(acton:String):void
    {
        if(acton=="update"){
            rollnum_txt.text=PlayerInfoM.instance.getLuckWheelNum()+"";
        }
        else if(acton="minus"){
            GameEventDispatch.instance.event(GameEvent.MinuswheelNum);
            rollnum_txt.text=PlayerInfoM.instance.getLuckWheelNum()+"";
        }
        else if(acton="add"){
            GameEventDispatch.instance.event(GameEvent.ADDwheelNum);
            rollnum_txt.text=PlayerInfoM.instance.getLuckWheelNum()+"";
        }
    }
    private function changewheelState(action:String):void
    {
        if(action=="start"){
            startBtn.disabled=true;
            closeBtn.disabled=true;
            _rollTime=true;
            Laya.timer.once(100,this,function () {
                _popboxArr[0]['state']="begin";
            });
            Laya.timer.once(500,this,function () {
                _popboxArr[1]['state']="begin";
            });
            Laya.timer.once(1000,this,function () {
                _popboxArr[2]['state']="begin";
            });
            Laya.timer.frameLoop(1,this,onTimer);
        }
        else if(action=="stop"){
            _rollTime=false;
            startBtn.disabled=false;
            closeBtn.disabled=false;
            Laya.timer.clear(this,onTimer);
            _popboxArr[0]['state']="";
            _popboxArr[1]['state']="";
            _popboxArr[2]['state']="";
            showAward();
        }
    }

    private function showAward():void
    {
        if(!_awardObj) return;
        var gainD:GainnewD=new GainnewD();
        gainD.award_type=_awardObj.award_type;
        gainD.award_num=_awardObj.award_num;
        gainD.callback=new Handler(this,luckwheelAward);
        GameEventDispatch.instance.event(GameEvent.GainNewPOP,[gainD]);

        GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
    }

    private function luckwheelAward():void
    {
        GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
    }


    private function onTimer():void
    {
        var stopNum:int=0;
        for(var i:int=0;i<_popboxArr.length;i++){
            var box:Box=_popboxArr[i];
            if(box['state']=="begin")checkItem(box);
            else if(box['state']=="stop") stopNum++;
        }
        if(stopNum>=3){
            changewheelState("stop");
        }
    }


    private function checkItem(box:Box):void
    {
        var img:Image;
        if(box["headImage"].y>=box["headImage"].height){
            //add box
            img=new Image(_skinArr[box["skinIndex"]%_skinArr.length]);
            img.pos(0,0);
            box["skinIndex"]++;
            img.name="item"+box["skinIndex"];
            box["headImage"]=img;
            box.addChild(img);

            //delet box
            box.removeChild(box["tailImage"]);
            box["tailImage"]=null;
            box["tailImage"]=box.getChildByName("item"+(box["skinIndex"]-4)) as Image;
        }

        box["Spd"]=getSpdLv(box["skinIndex"],box["popIndex"],box["Spd"]);
        if(box["popIndex"]==box["skinIndex"]-2){
            box['state']="stop";
            box['Spd']=0;
        }

        for(var i:int=box.numChildren-1;i>=0;i--){
            img=box.getChildAt(i) as Image;
            img.y+=box["Spd"];//move
        }
        //console.log("popIndex:",box["popIndex"],"skinIndex:",box["skinIndex"],box["Spd"]);
    }




    public function register():void
    {

    }
    public function unRegister():void
    {

    }

    public function closePanel():void
    {
        this.visible=false;
        GameEventDispatch.instance.event(GameEvent.RemoveRedPoint,"Luckwheel");
    }
    public function clearAllNum():void
    {
        _awardObj=null;
        changewheelState("stop");
    }

}
}
