package control {
import conf.cfg_currency;

import laya.utils.Handler;

import manager.GameEvent;
import manager.GameEventDispatch;
import manager.UiManager;

import model.PlayerInfoM;

public class ShopBuy {

    public static var _instance:ShopBuy;
    private var popConfig:Object;
    public function ShopBuy() {
        GameEventDispatch.instance.on(GameEvent.ShopBuy,this,onBuy);
    }

    public static function get instance():ShopBuy
    {
        return _instance||=new ShopBuy();
    }

    private function onBuy(param:Object):void
    {
        //console.log("--cost_type:",param['cost_type']);
        //console.log("--cost_num:",param['cost_num']);
        if(!param.hasOwnProperty('buy_num')){
            param['buy_num']=1;
            //console.log("--buy_num:",param);
        }
        popConfig=param;

        var buyNum:int=param['buy_num'];
        var typeArr:Array=param['cost_type'];
        var numArr:Array=param['cost_num'];
        var type,num:int;
        var typeName:String;
        var willCost:Object={};
        var maxCost:int=0;
        for(var i:int=0;i<typeArr.length;i++){
            type=typeArr[i];
            num=numArr[i];
            typeName=cfg_currency.instance(type+"")['property'];
            if(typeName=="gold"){
                if(PlayerInfoM.instance.getGoldNum()<buyNum*num){
                    UiManager.instance.loadView("Smalltips",{id:1},0,"UITYPE_STIP");
                    return;
                }
                willCost[typeName]=buyNum*num;
            }
            else if(typeName=="plank"){
                if(PlayerInfoM.instance.getPlankNum()<buyNum*num){
                    UiManager.instance.loadView("Smalltips",{id:2},0,"UITYPE_STIP");
                    return;
                }
                willCost[typeName]=buyNum*num;
            }
            if(buyNum*num>maxCost) maxCost=buyNum*num;
        }
        console.log("--cost gold And plank");
        willCost['endNum']=maxCost;
        GameEventDispatch.instance.event(GameEvent.MinusScoreANI,willCost);
    }


}
}
