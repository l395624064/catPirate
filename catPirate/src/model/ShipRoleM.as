package model {
import data.ShipRoleD;

import laya.maths.Point;

public class ShipRoleM {

    public static var _instance:ShipRoleM;
    private var shipRoleConfigDic:Object={};

    public function ShipRoleM() {
    }

    public static function get instance():ShipRoleM
    {
        return _instance || (_instance =new ShipRoleM());
    }


    public function getshipRolePos(roleType:String):Point
    {
        //body:captain
        //sail:shipchef
        //tower:shipsoldier
        //cabin:shipmate

        var shipslotDic:Object=ShiprefitM.instance.getShipslotDic();
        var slotObj:Object;
        switch (roleType){
            case "captain":slotObj=shipslotDic['body'];
                break;
            case "shipchef":slotObj=shipslotDic['sail'];
                break;
            case "shipsoldier":slotObj=shipslotDic['tower'];
                break;
            case "shipmate":slotObj=shipslotDic['cabin'];
                break;
        }
        if(!slotObj) throw new Error("can not found staypos!");
        return new Point(slotObj['stay_pos'][0],slotObj['stay_pos'][1]);
    }

    public function getshipRoleDataArr():Object
    {
        return shipRoleConfigDic;
    }

    public function setshipRoleData(name:String,data:ShipRoleD):void
    {
        shipRoleConfigDic[name]=data;
    }

    public function getshipRoleData(name:String):ShipRoleD
    {
        return shipRoleConfigDic[name];
    }


}
}
