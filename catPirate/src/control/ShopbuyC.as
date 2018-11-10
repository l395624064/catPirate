package control {
import conf.cfg_currency;

import data.GainnewD;

import laya.utils.Handler;

import manager.GameEvent;
import manager.GameEventDispatch;
import manager.UiManager;

import model.PlayerInfoM;

public class ShopbuyC {

    public static var _instance:ShopbuyC;
    private var popConfig:Object;
    private var buySucceedCallback:Handler;

    private const minusANI:Boolean=true;

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
            else if(typeName=="pearl"){
                if(PlayerInfoM.instance.getPearlNum()<buyNum*num){
                    GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:3}]);
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

        //console.log("--cost gold And plank");
        willCost['endNum']=maxCost;
        for(var str:String in willCost){
            if(str=="gold"){
                var gold:int=PlayerInfoM.instance.getGoldNum();
                gold-=willCost[str];
                PlayerInfoM.instance.setGoldNum(gold);
                if(minusANI)GameEventDispatch.instance.event(GameEvent.MinusGoldANI,[{gold:willCost[str]}]);
                else GameEventDispatch.instance.event(GameEvent.GoldRefresh);
            }
            else if(str=="pearl"){
                var pearl:int=PlayerInfoM.instance.getPearlNum();
                pearl-=willCost[str];
                PlayerInfoM.instance.setPearlNum(pearl);
                if(minusANI)GameEventDispatch.instance.event(GameEvent.MinusPearlANI,[{pearl:willCost[str]}]);
                else GameEventDispatch.instance.event(GameEvent.PearlRefresh);
            }
            else if(str=="plank"){
                var plank:int=PlayerInfoM.instance.getPlankNum();
                plank-=willCost[str];
                PlayerInfoM.instance.setPlankNum(plank);
                if(minusANI)GameEventDispatch.instance.event(GameEvent.MinusPlankANI,[{plank:willCost[str]}]);
                else GameEventDispatch.instance.event(GameEvent.PlankRefresh);
            }
        }


        console.log("param-------",param);
        if(param.hasOwnProperty('buyshow')&& !param['buyshow']){
            var gainD:GainnewD=new GainnewD();
            gainD.res=param.res;
            gainD.name=param.name;
            gainD.explain_content=param.explain_content;
            GameEventDispatch.instance.event(GameEvent.GainNewPOP,[gainD]);
        }
        buySucceedCallback.runWith(param);
    }


}
}
