package view.shiprefit {
import conf.cfg_module_ship;

import laya.display.Text;

import laya.events.Event;
import laya.ui.Box;
import laya.ui.Button;
import laya.ui.Image;
import laya.utils.Handler;

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
        modelist.renderHandler=new Handler(this,updatelist);
    }

    private function onSelectTab(index:int):void
    {
        tabType=index;
        modelist.array=ShiprefitM.instance.getTablistArray(index);
        modelist.refresh();
        setpageNum();
        console.log("--tabBtn",pageNumArr,modelist.array.length);
        //console.log("--array",index,modelist.array);
    }
    private function setpageNum(str:String=""):void
    {
        if (str=="add"){
            if(pageNumArr[tabType]<modelist.array.length-1){
                pageNumArr[tabType]++;
            }
        }else if(str=="minus"){
            if(pageNumArr[tabType]>0){
                pageNumArr[tabType]--;
            }
        }
        modelist.tweenTo(pageNumArr[tabType],200);
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



        ele_img_pop.skin=config['res'];
        ele_img_lock.visible=PlayerInfoM.instance.getshipmoduleBuy(tabType,pageNumArr[tabType]);

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

        ele_btn_buy.offAll();
        ele_btn_buy.on(Event.MOUSE_DOWN,this,function () {
            
        })
    }


    private function initNum():void
    {
        onSelectTab(0);
        return;
        var cfg:Array=ConfigManager.items("cfg_module_ship");
        console.log("-cfg",cfg);
        var cfg2:Array = ConfigManager.filter("cfg_module_ship", function(item){
            if (item['id'] == 403){
                return item;
            }
        });
        console.log("-cfg2",cfg2);
        var con:cfg_module_ship = cfg_module_ship.instance(402  + "");
        console.log("-con",con);
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

    }
}
}
