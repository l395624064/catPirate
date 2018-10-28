package view.shiprefit {
import conf.cfg_module_ship;

import data.TipsD;

import laya.display.Text;

import laya.events.Event;
import laya.ui.Box;
import laya.ui.Box;
import laya.ui.Button;
import laya.ui.Image;
import laya.ui.ProgressBar;
import laya.utils.Handler;

import manager.GameAdaptive;

import manager.GameEvent;

import manager.GameEventDispatch;

import manager.UiManager;

import manager.ConfigManager;

import model.PlayerInfoM;

import model.ShiprefitM;

import ui.ShipRefitUI;
import view.PanelVo;

public class Shiprefit extends ShipRefitUI implements PanelVo{

    public static var _instance:Shiprefit;
    private var tabType:int=0;
    private var pageNumArr:Array=[0,0,0,0];

    public function Shiprefit() {
        super();
    }

    public static function get instance():Shiprefit
    {
        return _instance || (_instance=new Shiprefit());
    }

    public function openPanel(param:Object=null):void
    {
        initListener();
        initNum();
    }

    private function initListener():void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Shiprefit");
        })
        scrollleftBtn.on(Event.MOUSE_DOWN,this, setpageNum,['minus']);
        scrollrightBtn.on(Event.MOUSE_DOWN,this,setpageNum,['add']);
        tabBtn.selectHandler=new Handler(this,onSelectTab);

        modelist.mouseEnabled=true;
        modelist.mouseHandler=new Handler(this,function (e:Event) {
            if(e.type=="mousedown")e.stopPropagation();
        })
        modelist.renderHandler=new Handler(this,updatelist);
    }

    private function onSelectTab(index:int):void
    {
        tabType=index;
        modelist.hScrollBarSkin="";
        modelist.array=ShiprefitM.instance.getTablistArray(index);
        modelist.refresh();
        setpageNum("goTo");
        console.log("--tabBtn",pageNumArr,modelist.array.length);
    }
    private function setpageNum(str:String=""):void
    {
        if(str=="goTo"){
            modelist.tweenTo(pageNumArr[tabType],10);
        }
        else if (str=="add"){
            if(pageNumArr[tabType]<modelist.array.length-1){
                pageNumArr[tabType]++;
            }
            modelist.tweenTo(pageNumArr[tabType],500);
        }else if(str=="minus"){
            if(pageNumArr[tabType]>0){
                pageNumArr[tabType]--;
            }
            modelist.tweenTo(pageNumArr[tabType],500);
        }
    }

    private function updatelist(cell:Box,index:int):void
    {
        var config=cell.dataSource;
        var ele_box_const_1:Image=cell.getChildByName("cost1_box") as Image;
        var ele_box_const_2:Image=cell.getChildByName("cost2_box") as Image;
        var ele_btn_buy:Button=cell.getChildByName("buyBtn") as Button;

        var ele_img_box:Box=cell.getChildByName("popimg_box") as Box;
        var ele_img_pop:Image=ele_img_box.getChildByName("pop_img") as Image;
        var ele_img_lock:Image=ele_img_box.getChildByName("lock_img") as Image;
        var ele_img_name:Text=ele_img_box.getChildByName("popname_txt") as Text;

        var img:Image=new Image();
        img.skin=config['res'];
        GameAdaptive.instance.setMiddleFromPanel(img,ele_img_pop);
        ele_img_pop.removeChildren();
        ele_img_pop.addChild(img);

        ele_img_name.text=config['name'];

        var notHave:Boolean=ShiprefitM.instance.getshipmoduleBuy(tabType,index);
        if(notHave){
            ele_img_lock.visible=true;
        }else{
            ele_img_lock.visible=false;
        }


        var ele_box_const:Box;
        var ele_img_const:Image;
        var ele_txt_const:Text;
        ele_box_const_1.visible=false;
        ele_box_const_2.visible=false;
        for (var i:int=1;i<=config['cost_type'].length;i++){
            if(i==1)ele_box_const_1.visible=true;
            if(i==2)ele_box_const_2.visible=true;

            ele_box_const=cell.getChildByName("cost"+i+"_box") as Box;

            ele_img_const=ele_box_const.getChildByName("cost"+i+"_img") as Image;
            ele_img_const.skin=ShiprefitM.instance.getCostIco(config['cost_type'][i-1]);
            ele_txt_const=ele_box_const.getChildByName("cost"+i+"_txt") as Text;
            ele_txt_const.text=config['cost_num'][i-1] + "";
        }


        var proBox:Box=cell.getChildByName("proBar_box") as Box;
        var propertyArr:Array=config['property_num'];
        const maxNum:int=100;
        var solder:ProgressBar;
        var arrowsImg:Image;
        for (var i:int=0;i<propertyArr.length;i++)
        {
            solder=proBox.getChildByName("pronum"+i) as ProgressBar;
            arrowsImg=proBox.getChildByName("item"+i) as Image;
            solder.value=Math.abs(propertyArr[i])/maxNum;
            if(propertyArr[i]>0){
                solder.skin="ui/common_ex/p0.png";
                arrowsImg.skin="ui/common_ex/arrowsBtn2.png";
            }
            else if(propertyArr[i]<0){
                solder.skin="ui/common_ex/p3.png";
                arrowsImg.skin="ui/common_ex/arrowsBtn1.png";
            }
            else{
                arrowsImg.skin="ui/common_ex/arrowsBtn3.png";
            }
        }

        ele_btn_buy.offAll();
        if(ele_img_lock.visible){
            ele_btn_buy.label="购买";
            ele_btn_buy.skin="ui/common_ex/btn_s_r.png";
            ele_btn_buy.on(Event.MOUSE_DOWN,this,function (e:Event) {
                e.stopPropagation();
                var info:TipsD=new TipsD();
                info.content="是否购买此物品？";
                info.conFirmArgs=config;
                info.conFirmEvent=GameEvent.ShopBuy;
                info.buySucceedCallback=new Handler(this,buySucceed);
                GameEventDispatch.instance.event(GameEvent.ShowTips,[info]);
            })
        }else{
            ele_btn_buy.label="装备";
            ele_btn_buy.skin="ui/common_ex/btn_s_y.png";
            ele_btn_buy.on(Event.MOUSE_DOWN,this,function (e:Event) {
                e.stopPropagation();
                //equip
                GameEventDispatch.instance.event(GameEvent.ShipSlotEquip,[config]);
            })
        }
    }



    //will be repair
    private function buySucceed(param:Object):void
    {
        //console.log("-onbuy succeed",param);
        ShiprefitM.instance.setshipmoduleBuy(tabType,pageNumArr[tabType]);
        var cell:Box=modelist.getCell(pageNumArr[tabType]);
        updatelist(cell,pageNumArr[tabType]);
    }


    private function initNum():void
    {
        onSelectTab(0);
    }


    public function register():void
    {

    }
    public function unRegister():void
    {

    }
    public function closePanel():void
    {
        this.visible = false;
    }
    public function clearAllNum():void
    {
        tabBtn.selectedIndex=0;
        pageNumArr=[0,0,0,0];
    }
}
}
