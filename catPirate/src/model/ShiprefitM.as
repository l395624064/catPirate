package model {
import conf.cfg_currency;
import conf.cfg_module_ship;

import manager.ConfigManager;

public class ShiprefitM {

    public static var _instance:ShiprefitM;
    public function ShiprefitM() {
    }

    public static function get instance():ShiprefitM
    {
        return _instance || (_instance=new ShiprefitM());
    }

    public function getTablistArray(type:int):Array
    {
        //tab:0 1 2 3
        //Id:401 101 301 201
        //typeId:1001 1002 1004 1003
        var typeid:int;
        switch (type){
            case 0:typeid=1001
            break;
            case 1:typeid=1002
            break;
            case 2:typeid=1004
            break;
            case 3:typeid=1003
            break;
            default:
            break;
        }

        var arr:Array=ConfigManager.filter("cfg_module_ship",function (item) {
            if(item['typeId']==typeid){
                return item;
            }
        });
        return arr;
    }

    public function getCostIco(id:int):String
    {
        return cfg_currency.instance(id)['res'];
    }
}
}
