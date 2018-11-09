package view.gameshop {
import data.TipsD;

import laya.display.Text;
import laya.events.Event;
import laya.ui.Box;
import laya.ui.Button;
import laya.ui.Image;
import laya.utils.Handler;

import manager.GameAdaptive;
import manager.GameEvent;
import manager.GameEventDispatch;

import manager.UiManager;

import model.FishM;


import src.model.ShopM;

import ui.GameShopUI;

import view.PanelVo;

public class Gameshop extends GameShopUI implements PanelVo{
    public static var _instance:Gameshop;
    public function Gameshop() {
        super();
    }
    public static function get instance():Gameshop
    {
        return _instance||=new Gameshop();
    }

    public function openPanel(param:Object=null):void
    {
        console.log("--shop openPanel");
        initListener();
        initNum();
    }

    private function initListener():void
    {
        this.closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Gameshop");
        });
        tabBtn.selectHandler=new Handler(this,onSelectTab);
    }
    private function initNum():void
    {
        onSelectTab(0);
    }

    private function onSelectTab(index:int):void
    {
        shoplist.mouseEnabled=true;
        shoplist.vScrollBarSkin="";
        shoplist.array=ShopM.instance.getShoplist(index);
        shoplist.renderHandler=new Handler(this,updateShoplist);
        shoplist.refresh();
    }

    private function updateShoplist(cell:Box,index:int):void
    {
        var config:Object=cell.dataSource;
        var lv:int=ShopM.instance.getFishlvByName(config['name']);

        var ele_name_txt:Text=cell.getChildByName("name_txt") as Text;
        var ele_weight_txt:Text=cell.getChildByName("weight_txt") as Text;

        var ele_cost2_box:Box=cell.getChildByName("cost2_box") as Box;
        var ele_cost1_box:Box=cell.getChildByName("cost1_box") as Box;
        var ele_head_box:Box=cell.getChildByName("headimg_box") as Box;

        var ele_free_btn:Button=cell.getChildByName("freeBtn") as Button;
        var ele_lvup_btn:Button=cell.getChildByName("lvupBtn") as Button;

        ele_name_txt.text=config['name']+"";
        ele_weight_txt.text=FishM.instance.getWeightByName(config['name'])+"kg";

        var headImg:Image=ele_head_box.getChildByName("head_img") as Image;
        var lockImg:Image=ele_head_box.getChildByName("lock_img") as Image;
        var img:Image=new Image(config['res']);
        headImg.removeChildren();
        headImg.addChild(img);
        GameAdaptive.instance.setMiddleFromPanel(img,headImg);
        lockImg.visible=true;
        if(lv>0) lockImg.visible=false;

        var costArr:Array=config['cost_type'];
        var costNumArr:Array=[];
        ele_cost2_box.visible=false;
        ele_cost1_box.visible=false;
        var ele_box_const:Box;
        var ele_img_const:Image;
        var ele_txt_const:Text;
        var costnum:int;
        for (var i:int=1;i<=costArr.length;i++){
            if(i==1)ele_cost1_box.visible=true;
            if(i==2)ele_cost2_box.visible=true;

            ele_box_const=cell.getChildByName("cost"+i+"_box") as Box;
            ele_img_const=ele_box_const.getChildByName("cost"+i+"_img") as Image;
            ele_img_const.skin=ShopM.instance.getCostImg(costArr[i-1]);
            ele_txt_const=ele_box_const.getChildByName("cost"+i+"_txt") as Text;
            costnum=config['cost'+i+'_num'][lv];
            ele_txt_const.text=costnum + "";
            costNumArr.push(costnum);
        }

        ele_free_btn.offAll();
        ele_free_btn.on(Event.MOUSE_DOWN,this,function (e:Event) {
            e.stopPropagation();
            console.log("-get AD video");
        });

        ele_lvup_btn.offAll();
        ele_lvup_btn.on(Event.MOUSE_DOWN,this,function (e:Event) {
            e.stopPropagation();
            var info:TipsD=new TipsD();
            config['cost_num']=costNumArr;
            info.content="是否购买此物品？";
            info.conFirmArgs=config;
            info.conFirmEvent=GameEvent.ShopBuy;
            info.buySucceedCallback=new Handler(this,lvupSucceed);
            GameEventDispatch.instance.event(GameEvent.ShowTips,[info]);
        });
    }


    private function lvupSucceed(param:Object):void
    {
        //console.log("-lvupSucceed:",param);
        var lv:int=ShopM.instance.getFishlvByName(param['name']);
        ShopM.instance.setFishlvByName(param['name'],++lv);
        shoplist.array=ShopM.instance.getShoplist(0);
        shoplist.refresh();
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
    }
    public function clearAllNum():void
    {

    }


}
}
