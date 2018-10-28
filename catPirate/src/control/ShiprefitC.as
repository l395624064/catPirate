package control {
import conf.cfg_module_ship;

import data.TipsD;

import laya.utils.Handler;

import manager.GameEvent;
import manager.GameEventDispatch;

import model.ShiprefitM;

public class ShiprefitC {

    public static var _instance:ShiprefitC;
    public function ShiprefitC() {
        GameEventDispatch.instance.on(GameEvent.ShipSlotInit,this,shipSlotInit);
        GameEventDispatch.instance.on(GameEvent.ShipSlotEquip,this,shipSlotEquip);
    }

    public static function get instance():ShiprefitC
    {
        return _instance ||=new ShiprefitC();
    }

    private function shipSlotInit():void
    {
        var body:Object=cfg_module_ship.instance(401+"");
        var sail:Object=cfg_module_ship.instance(103+"");
        var tower:Object=cfg_module_ship.instance(201+"");
        var cabin:Object=cfg_module_ship.instance(301+"");

        ShiprefitM.instance.setShipslotDic({body:body,sail:sail,tower:tower,cabin:cabin});
        GameEventDispatch.instance.event(GameEvent.UpdateShipslot);
    }

    private function shipSlotEquip(param:Object):void {
        //body sail tower cabin
        var name:String;
        var typeName:String=param['typeName'];
        var bodyGroup:String=ShiprefitM.instance.getShipslotDic()['body']['slot_type'];
        if(typeName=="body"){
            //卸载不合法的插槽
            var info:TipsD=new TipsD();
            info.content="换船体时,将卸载不符合的组件";
            info.conFirmArgs=param;
            info.confirmCallback=new Handler(this,equipShipbody);
            GameEventDispatch.instance.event(GameEvent.ShowTips,[info]);
        }else{
            var slotType:Array=param['slot_type'].split(",");
            var getIndex:int=slotType.indexOf(bodyGroup);
            if(getIndex<0){
                GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:4}]);
            }else{
                GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:5}]);
                ShiprefitM.instance.setShipslotByName(typeName,param);
                GameEventDispatch.instance.event(GameEvent.UpdateShipslot);
            }
        }
    }

    private function equipShipbody(param:Object):void
    {
        ShiprefitM.instance.setShipslotByName("body",param);
        var shipslotDic:Object=ShiprefitM.instance.getShipslotDic();
        var bodyGroup:String=param['slot_type'];

        var slotGroupArr:Array=[];
        var slotName:String;
        for(var str:String in shipslotDic){
            if(str=="body"){
                continue;
            }
            slotName=shipslotDic[str]['typeName'];
            slotGroupArr=shipslotDic[str]['slot_type'].split(",");
            if(slotGroupArr.indexOf(bodyGroup)<0){
                ShiprefitM.instance.setShipslotByName(slotName,null);
            }
        }
        GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:5}]);
        GameEventDispatch.instance.event(GameEvent.UpdateShipslot);
    }
}
}
