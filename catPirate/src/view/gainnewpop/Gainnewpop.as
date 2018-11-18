package view.gainnewpop {
import conf.cfg_currency;

import laya.display.Text;

import laya.events.Event;
import laya.ui.Box;
import laya.ui.Image;
import laya.utils.Handler;

import manager.GameAdaptive;
import manager.GameEvent;
import manager.GameEventDispatch;

import manager.UiManager;

import model.PlayerInfoM;

import ui.GainNewpopUI;

import view.PanelVo;

public class Gainnewpop extends GainNewpopUI implements PanelVo{

    public static var _instance:Gainnewpop;
    private var _callback:Handler;

    private var _awardType:Array=[];
    private var _awardNum:Array=[];

    private var _showMode:String="title";//title: content

    public var _name:String="";
    public var _content:String="";
    public var _res:String="";
    public var _stayTime:int;

    public function Gainnewpop() {
        super();
    }
    public static function get instance():Gainnewpop
    {
        return _instance ||=new Gainnewpop();
    }

    public function openPanel(param:Object=null):void
    {
        this.ani1.play();
        _awardType=param.award_type;
        _awardNum=param.award_num;
        _name=param.name;
        _content=param.explain_content;
        _res=param.res;
        _callback=param.callback;
        _stayTime=param.stayTime;

        if(_awardType.length !=_awardNum.length){
            throw new Error("_awardType or _awardNum length Error");
        }

        if(_awardType.length<=0){
            if(_content!="") _showMode="content";
            else _showMode="title";
            changeShowState("single");
        }
        else if(_awardType.length==1){
            _showMode="title";
            changeShowState("array_one");
        }
        else if(_awardType.length==2){
            _showMode="title";
            changeShowState("array_two");
        }
        else if(_awardType.length==3){
            _showMode="title";
            changeShowState("array_three");
        }
        this.hitTestPrior=true;
        Laya.timer.once(_stayTime,this,overClick);

        getAwardNum();
    }

    private function overClick():void
    {
        this.offAll();
        this.once(Event.MOUSE_DOWN,this,function () {
            console.log("-click this pop");
            if(_callback)_callback.run();
            UiManager.instance.closePanel("Gainnewpop");
        });
    }

    private function getAwardNum():void
    {
        var id:int;
        for (var i:int=0;i<_awardType.length;i++){
            id=_awardType[i];
            if(id==1){
                var gold:int=PlayerInfoM.instance.getGoldNum();
                gold+=_awardNum[i];
                PlayerInfoM.instance.setGoldNum(gold);
                GameEventDispatch.instance.event(GameEvent.GoldRefresh);
            }
            else if(id==2){
                var star:int=PlayerInfoM.instance.getPlankNum();
                star+=_awardNum[i];
                PlayerInfoM.instance.setPlankNum(star);
                GameEventDispatch.instance.event(GameEvent.PlankRefresh);
            }
            else if(id==3){
                var pear:int=PlayerInfoM.instance.getPearlNum();
                pear+=_awardNum[i];
                PlayerInfoM.instance.setPearlNum(pear);
                GameEventDispatch.instance.event(GameEvent.PearlRefresh);
            }
            else if(id==11){
                var giftlv1_num:int=PlayerInfoM.instance.getGiftNumById(1);
                giftlv1_num+=_awardNum[i];
                PlayerInfoM.instance.setGiftNumById(1,giftlv1_num);
                GameEventDispatch.instance.event(GameEvent.ShowRedPoint,"Boxlibs");
            }
            else if(id==12){
                var giftlv2_num:int=PlayerInfoM.instance.getGiftNumById(2);
                giftlv2_num+=_awardNum[i];
                PlayerInfoM.instance.setGiftNumById(2,giftlv2_num);
                GameEventDispatch.instance.event(GameEvent.ShowRedPoint,"Boxlibs");
            }
            else if(id==13){
                var giftlv3_num:int=PlayerInfoM.instance.getGiftNumById(3);
                giftlv3_num+=_awardNum[i];
                PlayerInfoM.instance.setGiftNumById(3,giftlv3_num);
                GameEventDispatch.instance.event(GameEvent.ShowRedPoint,"Boxlibs");
            }
            else if(id==14){
                var giftlv4_num:int=PlayerInfoM.instance.getGiftNumById(4);
                giftlv4_num+=_awardNum[i];
                PlayerInfoM.instance.setGiftNumById(4,giftlv4_num);
                GameEventDispatch.instance.event(GameEvent.ShowRedPoint,"Boxlibs");
            }
            else if(id==15){
                var giftlv5_num:int=PlayerInfoM.instance.getGiftNumById(5);
                giftlv5_num+=_awardNum[i];
                PlayerInfoM.instance.setGiftNumById(5,giftlv5_num);
                GameEventDispatch.instance.event(GameEvent.ShowRedPoint,"Boxlibs");
            }
        }
    }


    private function changeShowState(action:String):void
    {
        if(action=="single"){
            box1.visible=true;
            box2.visible=false;
            box3.visible=false;
            if(_showMode=="title"){
                explainbox.visible=false;
                singleTilebox.visible=true;

                var imgPanel:Image=singleTilebox.getChildByName("img0") as Image;
                var imgc:Image=new Image(_res);
                imgPanel.removeChildren();
                imgPanel.addChild(imgc);
                GameAdaptive.instance.setMiddleFromPanel(imgc,imgPanel);

                var txt:Text=singleTilebox.getChildByName("txt0") as Text;
                txt.text=_name+"*1";
            }else{
                explainbox.visible=true;
                singleTilebox.visible=false;
                popname.text=_name;
                content.text=_content;
                var img:Image=new Image(_res);
                popImg.removeChildren();
                popImg.addChild(img);
                GameAdaptive.instance.setMiddleFromPanel(img,popImg);
            }
        }
        else if(action=="array_one"){
            box1.visible=true;
            box2.visible=false;
            box3.visible=false;

            explainbox.visible=false;
            singleTilebox.visible=true;

            getpoptitle(singleTilebox);
        }
        else if(action=="array_two"){
            box1.visible=false;
            box2.visible=true;
            box3.visible=false;
            getpoptitle(box2);
        }
        else if(action=="array_three"){
            box1.visible=false;
            box2.visible=false;
            box3.visible=true;
            getpoptitle(box3);
        }else if(action=="clear"){
            box1.visible=false;
            box2.visible=false;
            box3.visible=false;
        }
    }


    private function getpoptitle(box:Box):void
    {
        var imgPanel:Image;
        var img:Image;
        var txt:Text;
        var cfg:Object;
        for(var i:int=0;i<_awardType.length;i++){
            cfg=getMsgById(_awardType[i]);
            img=new Image(cfg.res);

            imgPanel=box.getChildByName("img"+i) as Image;
            imgPanel.removeChildren();
            imgPanel.addChild(img);
            GameAdaptive.instance.setMiddleFromPanel(img,imgPanel);

            txt=box.getChildByName("txt"+i) as Text;
            txt.text=cfg.name+"*"+_awardNum[i];
        }
    }

    private function getMsgById(id:int):Object
    {
        var msg:Object=cfg_currency.instance(id+"");
        if(msg) return msg;
        throw new Error("id not fond in cfg_currency!");
    }


    public function closePanel():void
    {
        this.visible=false;
    }
    public function clearAllNum():void
    {
        this.ani1.stop();
        changeShowState("clear");
    }

    public function register():void
    {

    }
    public function unRegister():void
    {

    }

}
}
