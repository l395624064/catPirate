package view.boxlibs {
import conf.cfg_giftbox;

import control.PlayerInfoC;

import data.GainnewD;

import laya.display.Text;

import laya.events.Event;
import laya.maths.Point;
import laya.maths.Rectangle;
import laya.ui.Box;
import laya.ui.Image;
import laya.utils.Ease;
import laya.utils.Handler;
import laya.utils.Tween;

import manager.GameEvent;

import manager.GameEventDispatch;

import manager.UiManager;
import manager.WxManager;

import model.GamemainM;

import model.PlayerInfoM;

import ui.BoxlibsUI;

import view.PanelVo;

public class Boxlibs extends BoxlibsUI implements PanelVo{
    public static var _instance:Boxlibs;
    private var _pageNum:int=0;
    private var _tagetGift:Image;

    public function Boxlibs() {
        super();
    }
    public static function get instance():Boxlibs
    {
        return _instance||=new Boxlibs();
    }

    public function openPanel(param:Object=null):void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
            UiManager.instance.closePanel("Boxlibs");
        });
        
        leftBtn.on(Event.MOUSE_DOWN,this,setpageNum,["left"]);
        rightBtn.on(Event.MOUSE_DOWN,this,setpageNum,["right"]);

        gameBoxBtn.offAll();
        gameBoxBtn.on(Event.MOUSE_DOWN,this,function () {
            WxManager.instance.navigateToMiniProgram();
        });
        moreGiftBtn.offAll();
        moreGiftBtn.on(Event.MOUSE_DOWN,this,function () {
            WxManager.instance.shareApp(Handler.create(this,shareOverAward));
        })

        gameBoxPanel.offAll();
        gameBoxPanel.on(Event.MOUSE_DOWN,this,function () {
            WxManager.instance.navigateToMiniProgram();
        })

        initBoxlist();
        boxlist.mouseHandler=new Handler(this,function (e:Event) {
            if(e.type=="mousedown")e.stopPropagation();
        });
        boxlist.renderHandler=new Handler(this,updateList);

        setpageNum("reset");
    }

    private function shareOverAward():void
    {
        if(PlayerInfoM.instance.getGiftFromShare()){
            PlayerInfoM.instance.setGiftFromShare(0);

            var gainD:GainnewD=new GainnewD();
            gainD.award_type=[11];
            gainD.award_num=[1];
            GameEventDispatch.instance.event(GameEvent.GainNewPOP,[gainD]);
        }else{
            GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:17}]);
        }
    }

    private function initBoxlist():void
    {
        boxlist.mouseEnabled=true;
        boxlist.hScrollBarSkin="";
        boxlist.array=PlayerInfoM.instance.getGiftArr();
        boxlist.refresh();
    }

    private function setpageNum(action:String):void
    {
        if(action=="left"){
            _pageNum--;
            if(_pageNum<=0) _pageNum=0;
            boxlist.tweenTo(_pageNum,500);
        }
        else if(action=="right"){
            _pageNum++;
            if(_pageNum==boxlist.array.length-1){
                GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
            }
            if(_pageNum>=boxlist.array.length-1) {
                _pageNum=boxlist.array.length-1;
            }
            boxlist.tweenTo(_pageNum,500);
        }
        else if(action=="reset"){
            _pageNum=0;
            boxlist.tweenTo(_pageNum,10);
        }
    }

    private function updateList(cell:Box,index:int):void
    {
        var config=cell.dataSource;
        var lv:int=config.id;
        var num:int=config.num;

        var ele_gift_img:Image=cell.getChildByName("giftImg") as Image;
        var ele_gift_num:Text=cell.getChildByName("giftnum") as Text;
        var ele_gift_lv:Text=cell.getChildByName("giftlv") as Text;

        ele_gift_img.skin=cfg_giftbox.instance(lv+"").res;
        ele_gift_num.text=num+"";
        ele_gift_lv.text="LV."+lv;

        ele_gift_img.offAll();
        ele_gift_img.on(Event.MOUSE_DOWN,this,function (e:Event) {
            e.stopPropagation();
            if(num<=0){
                GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:9}]);
            }else{
                var startPos:Point=new Point(ele_gift_img.x+ele_gift_img.width/2,ele_gift_img.y+ele_gift_img.height/2);
                startPos=cell.localToGlobal(startPos);
                config['startPos']=startPos;
                config['index']=index;
                creatGiftBox(config);
                PlayerInfoM.instance.setGiftNumById(lv,--num);
                updateSignBox(config);
            }
        })
    }

    //will be repair
    private function updateSignBox(param:Object):void
    {
        var index:int=param.index;
        var cell:Box=boxlist.getCell(index);
        updateList(cell,index);
    }

    private function creatGiftBox(cfg:Object):void
    {
        var res:String=cfg_giftbox.instance(cfg.id+"").res;
        _tagetGift=null;
        _tagetGift=new Image(res);
        _tagetGift.dataSource=cfg;
        _tagetGift.anchorX=.5;
        _tagetGift.anchorY=.5;
        _tagetGift.zOrder=3000;
        _tagetGift.pos(Laya.stage.mouseX,Laya.stage.mouseY);
        Laya.stage.addChild(_tagetGift);
        _tagetGift.startDrag();
        Laya.stage.once(Event.MOUSE_UP,this,recoverGift);
        Laya.stage.once(Event.MOUSE_OUT,this,recoverGift);
    }




    private function recoverGift():void
    {
        Laya.stage.off(Event.MOUSE_UP,this,recoverGift,true);
        Laya.stage.off(Event.MOUSE_OUT,this,recoverGift,true);

        var pot:Point=new Point(stoveImg.x,stoveImg.y);
        var box:Box=stoveImg.parent as Box;
        pot=box.localToGlobal(pot);

        var rect:Rectangle=new Rectangle(pot.x,pot.y,stoveImg.width,stoveImg.height);
        if(rect.contains(_tagetGift.x,_tagetGift.y)){
            _tagetGift.stopDrag();
            Tween.to(_tagetGift,{x:rect.x+rect.width/2,y:rect.y+rect.height/2},200,Ease.sineOut,Handler.create(this,function () {
                _tagetGift.removeSelf();
                changeOpenAniState("ready");
            }));
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
        }else{
            var config:Object=_tagetGift.dataSource;
            Tween.to(_tagetGift,{x:config['startPos'].x,y:config['startPos'].y},300,Ease.sineIn,Handler.create(this,function () {
                _tagetGift.removeSelf();
                PlayerInfoM.instance.setGiftNumById(config.id,++config.num);
                updateSignBox(config);
            }));
        }
    }

    private function changeOpenAniState(action:String):void
    {
        if(action=="ready"){
            shakeBoxImg.visible=true;
            shakelightAni.visible=true;
            shakeBoxImg.skin=_tagetGift.skin;
            shakeAni.play(0,false);
            shakelightAni.play();

            shakeAni.offAll();
            shakeAni.on(Event.COMPLETE,this,function () {
                changeOpenAniState("open");

            });
            openAni.offAll();
            openAni.on(Event.COMPLETE,this,function () {
                changeOpenAniState("over");
                showGain();//弹出
            })
        }
        else if(action=="open"){
            shakeBoxImg.visible=false;
            shakelightAni.visible=false;
            shakelightAni.stop();
            shakeAni.stop();

            openAni.visible=true;
            openAni.play(0,false);
        }
        else if(action=="over"){
            openAni.visible=false;
            openAni.stop();
        }
        else if(action=="clear"){
            shakeBoxImg.visible=false;

            shakeAni.stop();

            shakelightAni.visible=false;
            shakelightAni.stop();

            openAni.visible=false;
            openAni.stop();
        }
    }

    private function showGain():void
    {
        var id:int=_tagetGift.dataSource.id;
        var cfg:Object=cfg_giftbox.instance(id+"");

        var gainD:GainnewD=new GainnewD();
        gainD.award_type=cfg.award_type;

        if(GamemainM.instance.getGuideIng()){
            gainD.award_num=cfg.award_num;
        }else{
            var numArr:Array=[];
            var num:int;
            const randomNum:int=50;
            for(var i:int=0;i<cfg.award_num.length;i++){
                num=cfg.award_num[i];
                num-=Math.floor(Math.random()*randomNum);
                numArr.push(num);
            }
            gainD.award_num=numArr;
        }

        gainD.callback=new Handler(this,boxlibsAward);

        GameEventDispatch.instance.event(GameEvent.GainNewPOP,[gainD]);
        GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
    }

    private function boxlibsAward():void
    {
        GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
    }



    public function register():void
    {

    }
    public function unRegister():void
    {

    }
    public function clearAllNum():void
    {

    }
    public function closePanel():void
    {
        this.visible=false;
        changeOpenAniState("clear");
        GameEventDispatch.instance.event(GameEvent.RemoveRedPoint,"Boxlibs");
    }





}
}
