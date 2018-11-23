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
import model.PlayerInfoM;


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
        initListener();
        initNum();
    }

    private function initListener():void
    {
        this.closeBtn.on(Event.MOUSE_DOWN,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
            UiManager.instance.closePanel("Gameshop");
        });

        tab0.on(Event.MOUSE_DOWN,this,function () {
            changeTabBtnState(0);
            onSelectTab(0);
        });
        tab1.on(Event.MOUSE_DOWN,this,function () {
            changeTabBtnState(1);
            onSelectTab(1);
        });
        tab2.on(Event.MOUSE_DOWN,this,function () {
            changeTabBtnState(2);
            onSelectTab(2);
        });
    }
    private function initNum():void
    {
        changeTabBtnState(0);
        onSelectTab(0);
    }
    private function changeTabBtnState(index:int):void
    {
        tab0.selected=false;
        tab1.selected=false;
        tab2.selected=false;
        switch (index){
            case 0:tab0.selected=true;
                break;
            case 1:tab1.selected=true;
                break;
            case 2:tab2.selected=true;
                break;
        }
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

        var shopOwnArr:Array=PlayerInfoM.instance.getshopOwnArr();

        var lv:int=ShopM.instance.getFishlvByName(config['name']);

        var ele_name_txt:Text=cell.getChildByName("name_txt") as Text;
        var ele_content_txt:Text=cell.getChildByName("content_txt") as Text;

        var ele_cost2_box:Box=cell.getChildByName("cost2_box") as Box;
        var ele_cost1_box:Box=cell.getChildByName("cost1_box") as Box;
        var ele_head_box:Box=cell.getChildByName("headimg_box") as Box;

        var ele_free_btn:Button=cell.getChildByName("freeBtn") as Button;
        var ele_lvup_btn:Button=cell.getChildByName("lvupBtn") as Button;

        ele_content_txt.text=config['explain_content']+"";
        if(config.shopId==1001){
            if(lv>0)ele_name_txt.text="LV."+lv+"-"+config['name']+"";
            else ele_name_txt.text=config['name']+"";
        }
        else if(config.shopId==1002||config.shopId==1003){
            ele_name_txt.text=config['name']+"";
        }

        var headImg:Image=ele_head_box.getChildByName("head_img") as Image;
        var lockImg:Image=ele_head_box.getChildByName("lock_img") as Image;
        var img:Image=new Image(config['res']);
        headImg.removeChildren();
        headImg.addChild(img);
        GameAdaptive.instance.setMiddleFromPanel(img,headImg);
        lockImg.visible=true;
        if(config.shopId==1001){
            if(lv>0) lockImg.visible=false;
        }
        else if(config.shopId==1002||config.shopId==1003){
            if(shopOwnArr.indexOf(config.id)!=-1){
                lockImg.visible=false;
            }
        }


        //cost
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
            if(lv>=config['cost1_num'].length){
                ele_cost1_box.visible=false;
                ele_cost2_box.visible=false;
            }

            ele_box_const=cell.getChildByName("cost"+i+"_box") as Box;
            ele_img_const=ele_box_const.getChildByName("cost"+i+"_img") as Image;
            ele_img_const.skin=ShopM.instance.getCostImg(costArr[i-1]);
            ele_txt_const=ele_box_const.getChildByName("cost"+i+"_txt") as Text;
            //fish:1001
            if(config.shopId==1001){
                costnum=config['cost'+i+'_num'][lv];
            }
            else if(config.shopId==1002||config.shopId==1003){
                //shipRefit:1002
                costnum=config['cost'+i+'_num'][0];
            }

            ele_txt_const.text=costnum + "";
            costNumArr.push(costnum);
        }


        //btn
        if(config.shopId==1001){
            if(lv>=config['cost1_num'].length){
                ele_free_btn.visible=false;
                ele_lvup_btn.visible=false;
                return;
            }

            ele_free_btn.visible=true;
            ele_free_btn.offAll();
            ele_free_btn.on(Event.MOUSE_DOWN,this,function (e:Event) {
                e.stopPropagation();
                //console.log("-get AD video");
            });

            ele_lvup_btn.visible=true;
            ele_lvup_btn.label="升级";
        }
        else if(config.shopId==1002||config.shopId==1003){
            ele_free_btn.visible=false;

            ele_lvup_btn.visible=true;
            ele_lvup_btn.label="购买";
            if(shopOwnArr.indexOf(config.id)!=-1){
                ele_lvup_btn.label="装备";
                ele_lvup_btn.offAll();
                ele_lvup_btn.on(Event.MOUSE_DOWN,this,function (e:Event) {
                    e.stopPropagation();
                    GameEventDispatch.instance.event(GameEvent.ShipSlotEquip,[config]);
                })
                return;
            }
        }


        ele_lvup_btn.offAll();
        ele_lvup_btn.on(Event.MOUSE_DOWN,this,function (e:Event) {
            e.stopPropagation();
            if(index==0||index==1){
                GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
            }
            var info:TipsD=new TipsD();
            config['cost_num']=costNumArr;
            info.content="是否购买此物品？";
            info.conFirmArgs=config;
            info.conFirmEvent=GameEvent.ShopBuy;
            info.aotoClose=false;
            if(config.shopId==1001){
                info.buySucceedCallback=new Handler(this,fishBuySucceed);
            }
            else if(config.shopId==1002){
                info.buySucceedCallback=new Handler(this,shiprefitBuySucceed);
            }
            else if(config.shopId==1003){
                info.buySucceedCallback=new Handler(this,shipbodyBuySucceed);
            }
            GameEventDispatch.instance.event(GameEvent.ShowTips,[info]);
        });
    }


    private function fishBuySucceed(param:Object):void
    {
        GameEventDispatch.instance.event(GameEvent.GameGuideNext);//新手引导
        //console.log("-lvupSucceed:",param);
        var lv:int=ShopM.instance.getFishlvByName(param['name']);
        ShopM.instance.setFishlvByName(param['name'],++lv);
        shoplist.array=ShopM.instance.getShoplist(0);
        shoplist.refresh();
        GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:11}]);
    }

    private function shiprefitBuySucceed(param:Object):void
    {
        PlayerInfoM.instance.addshopOwn(param.id);
        shoplist.array=ShopM.instance.getShoplist(1);
        shoplist.refresh();
    }
    private function shipbodyBuySucceed(param:Object):void
    {
        PlayerInfoM.instance.addshopOwn(param.id);
        shoplist.array=ShopM.instance.getShoplist(2);
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
