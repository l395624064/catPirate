package src.model {
import conf.cfg_currency;
import conf.cfg_fish;
import conf.cfg_shop;

import manager.ConfigManager;

import model.FishM;

import model.FishM;

public class ShopM {
    public static var _instance:ShopM;



    public function ShopM() {
        //get msg from local-storage
    }
    public static function get instance():ShopM
    {
        return _instance||=new ShopM();
    }


    public function getFishlvByName(name:String):int
    {
        return FishM.instance.getFishlvByName(name);
    }
    public function setFishlvByName(name:String,value:int):void
    {
        FishM.instance.setFishlvByName(name,value);
    }


    public function getShoplist(index:int):Array
    {
        var arr:Array=[];
        var id:int;
        if(index==0){
            //fish
            id=1001;
        }
        else if(index==1){
            //pop
            id=1002;
        }
        else if(index==2){
            //fishHook
            id=1003;
        }

        arr=ConfigManager.filter("cfg_shop",function (item) {
            if(item['shopId']==id) return true;
        },function (a,b) {
            return (a.id>b.id)?  1: -1;
        });

        return arr;
    }

    public function getCostImg(id:int):String
    {
        return cfg_currency.instance(id+"")['res'];
    }

    private function getShopObjByName(name:String):Object
    {
        var arr:Array=ConfigManager.filter("cfg_shop",function (item) {
            if(item['name']==name) return true;
        })
        return arr[0];
    }









}
}
