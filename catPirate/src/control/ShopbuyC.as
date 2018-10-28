package control {
import conf.cfg_currency;

import laya.utils.Handler;

import manager.GameEvent;
import manager.GameEventDispatch;
import manager.UiManager;

import model.PlayerInfoM;

public class ShopbuyC {

    public static var _instance:ShopbuyC;
    private var popConfig:Object;
    private var buySucceedCallback:Handler;
    public function ShopbuyC() {
        GameEventDispatch.instance.on(GameEvent.ShopBuy,this,onBuy);
    }

    public static function get instance():ShopbuyC
    {
        return _instance||=new ShopbuyC();
    }

    private function onBuy(param:Object):void
    {
        //console.log("--cost_type:",param['cost_type']);
        //console.log("--cost_num:",param['cost_num']);
        if(!param.hasOwnProperty('buy_num')){
            param['buy_num']=1;
            //console.log("--buy_num:",param);
        }
        buySucceedCallback=param['buySucceedCallback'];
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
                    GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:1}]);
                    return;
                }
                willCost[typeName]=buyNum*num;
            }
            else if(typeName=="plank"){
                if(PlayerInfoM.instance.getPlankNum()<buyNum*num){
                    GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:2}]);
                    return;
                }
                willCost[typeName]=buyNum*num;
            }
            if(buyNum*num>maxCost) maxCost=buyNum*num;
        }

        console.log("--cost gold And plank");
        willCost['endNum']=maxCost;
        for(var str:String in willCost){
            if(str=="gold"){
                var gold:int=PlayerInfoM.instance.getGoldNum();
                gold-=willCost[str];
                PlayerInfoM.instance.setGoldNum(gold);
                GameEventDispatch.instance.event(GameEvent.MinusGoldANI,[{gold:willCost[str]}]);
            }
            else if(str=="plank"){
                var plank:int=PlayerInfoM.instance.getPlankNum();
                plank-=willCost[str];
                PlayerInfoM.instance.setPlankNum(plank);
                GameEventDispatch.instance.event(GameEvent.MinusPlankANI,[{plank:willCost[str]}]);
            }
        }


        if(param.hasOwnProperty('buyshow')&& !param['buyshow']){
            GameEventDispatch.instance.event(GameEvent.GainNewPOP,[param]);
        }
        buySucceedCallback.runWith(param);
    }


}
}