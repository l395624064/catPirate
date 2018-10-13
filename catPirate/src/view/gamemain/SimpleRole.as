package view.gamemain {
import laya.events.Event;
import laya.ui.Image;

import model.ShipRoleM;


public class SimpleRole {
    public var _name:String="";
    private var _roleData:Object={};
    private var _img:Image;

    private var _exp:Number;

    public function SimpleRole() {
    }


    public function init(name:String,img:Image):void
    {
        _name=name;
        _roleData=ShipRoleM.instance.getshipRoleData(_name);
        _img=img;

        update();

        _img.on(Event.MOUSE_DOWN,this,onRoleClick);
    }

    public function update():void
    {
        _img.skin=_roleData.skin;
        _img.x=_roleData.dx;
        _img.y=_roleData.dy;
        _exp=_roleData.exp;
    }

    private function onRoleClick():void
    {
         console.log(_name,":get click--");
    }






}
}
