package control {
import conf.cfg_fishhook;
import conf.cfg_module_ship;

import data.TipsD;

import laya.utils.Handler;

import manager.GameEvent;
import manager.GameEventDispatch;

import model.PlayerInfoM;

import model.ShiprefitM;

public class ShiprefitC {

    public static var _instance:ShiprefitC;
    public function ShiprefitC() {
        GameEventDispatch.instance.on(GameEvent.ShipSlotInit,this,shipSlotInit);
        GameEventDispatch.instance.on(GameEvent.ShipSlotEquip,this,shipSlotEquip);
        GameEventDispatch.instance.on(GameEvent.TimeAwardEquip,this,timeAwardEquip);
        GameEventDispatch.instance.on(GameEvent.FishhookEquip,this,fishhookEquip);
    }

    public static function get instance():ShiprefitC
    {
        return _instance ||=new ShiprefitC();
    }

    private function shipSlotInit():void
    {
        var bodyId:int=PlayerInfoM.instance.getshipEquipIdByName("body");
        var body:Object=cfg_module_ship.instance(bodyId+"");
        var sailId:int=PlayerInfoM.instance.getshipEquipIdByName("sail");
        var sail:Object=cfg_module_ship.instance(sailId+"");
        var towerId:int=PlayerInfoM.instance.getshipEquipIdByName("tower");
        var tower:Object=cfg_module_ship.instance(towerId+"");
        var cabinId:int=PlayerInfoM.instance.getshipEquipIdByName("cabin");
        var cabin:Object=cfg_module_ship.instance(cabinId+"");

        /*
        *添加装备
        * */
        var fishhookId:int=PlayerInfoM.instance.getshipEquipIdByName("fishhook");
        if(!fishhookId){
            fishhookId=501;
        }
        var fishhook:Object=cfg_fishhook.instance(fishhookId+"");

        ShiprefitM.instance.setShipslotDic({body:body,sail:sail,tower:tower,cabin:cabin,fishhook:fishhook});
        GameEventDispatch.instance.event(GameEvent.UpdateShipslot);
    }

    private function fishhookEquip(param:Object):void
    {
        var relationId:int=param.relationId;
        var fishhookParam:Object=cfg_fishhook.instance(relationId+"");
        ShiprefitM.instance.setShipslotByName("fishhook",fishhookParam);
        PlayerInfoM.instance.setshipEquipIdByName("fishhook",relationId);

        GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:5}]);
        GameEventDispatch.instance.event(GameEvent.UpdateShipslot);
    }

    private function timeAwardEquip(param:Object):void
    {
        var relationId:int=param.relationId;
        if(param.shopId=1004){
            var fishhookParam:Object=cfg_fishhook.instance(relationId+"");
            ShiprefitM.instance.setShipslotByName("fishhook",fishhookParam);
        }

        GameEventDispatch.instance.event(GameEvent.UpdateShipslot);
    }

    private function shipSlotEquip(param:Object):void {

        //正常安装
        var typeName:String=param['typeName'];
        var relationId:int=param.relationId;

        var shiprefitParam:Object=cfg_module_ship.instance(relationId+"");
        ShiprefitM.instance.setShipslotByName(shiprefitParam.typeName,shiprefitParam);

        PlayerInfoM.instance.setshipEquipIdByName(shiprefitParam.typeName,relationId);

        GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:5}]);
        GameEventDispatch.instance.event(GameEvent.UpdateShipslot);

        /*具备分类的组装
        //body sail tower cabin
        var name:String;
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
        */
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
