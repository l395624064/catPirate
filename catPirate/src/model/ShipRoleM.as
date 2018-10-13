package model {
import data.ShipRoleD;

public class ShipRoleM {

    public static var _instance:ShipRoleM;
    private var shipRoleConfigDic:Object={};

    public function ShipRoleM() {
        setshipRoleDataArr();
    }

    public static function get instance():ShipRoleM
    {
        return _instance || (_instance =new ShipRoleM());
    }


    public function setshipRoleDataArr(data:ShipRoleD=null):void
    {
        //get local save
        if(!data){
            var captainData:ShipRoleD=new ShipRoleD();
            captainData.dx=356;
            captainData.dy=97;
            captainData.skin="ui/common/captain_1.png";

            var shipmateData:ShipRoleD=new ShipRoleD();
            shipmateData.dx=420;
            shipmateData.dy=297;
            shipmateData.skin="ui/common/shipmate_1.png";

            var shipchefData:ShipRoleD=new ShipRoleD();
            shipchefData.dx=229;
            shipchefData.dy=210;
            shipchefData.skin="ui/common/shipchef_1.png";

            var shipsoldierData:ShipRoleD=new ShipRoleD();
            shipsoldierData.dx=92;
            shipsoldierData.dy=297;
            shipsoldierData.skin="ui/common/shipsoldier_1.png";

            shipRoleConfigDic={
                "captain":captainData,
                "shipmate":shipmateData,
                "shipchef":shipchefData,
                "shipsoldier":shipsoldierData
            };
            console.log("--shipRole data init over")
        }else{
            shipRoleConfigDic=data;
        }
    }

    public function getshipRoleDataArr():Object
    {
        return shipRoleConfigDic;
    }

    public function updateshipRoleData(name:String,data:ShipRoleD):void
    {
        shipRoleConfigDic[name]=data;
    }

    public function getshipRoleData(name:String):ShipRoleD
    {
        return shipRoleConfigDic[name];
    }


}
}
