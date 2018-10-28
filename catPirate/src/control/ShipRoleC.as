package control {
import data.ShipRoleD;

import laya.maths.Point;
import laya.ui.Box;
import laya.ui.Image;

import manager.GameEvent;
import manager.GameEventDispatch;

import model.ShipRoleM;

import view.gamemain.Gamemain;

import view.gamemain.SimpleRole;

public class ShipRoleC {

    public static var _instance:ShipRoleC;
    public function ShipRoleC() {
        GameEventDispatch.instance.on(GameEvent.CreatShipRole,this,creatShipRole);
    }

    public static function get instance():ShipRoleC
    {
        return _instance||=new ShipRoleC();
    }

    private function creatShipRole(param:ShipRoleD):void
    {
        var job:String=param.job;
        ShipRoleM.instance.setshipRoleData(job,param);

        var role:SimpleRole=new SimpleRole();
        var img:Image=Gamemain.instance.getRoleImg(job);
        var pot:Point=ShipRoleM.instance.getshipRolePos(job);

        img.pos(pot.x,pot.y);
        img.skin=param.skin;
        role.init(param.name,img);
    }


}
}
