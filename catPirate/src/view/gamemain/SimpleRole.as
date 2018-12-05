package view.gamemain {
import laya.ani.bone.Skeleton;
import laya.events.Event;
import laya.ui.Image;
import laya.utils.Handler;

import model.ShipRoleM;


public class SimpleRole {
    public var _name:String="";
    private var _roleData:Object={};
    private var _img:Image;
    private var _sk:Skeleton;

    private var _mode:String="IMG";//IMG:SK

    private var _exp:Number;

    public function SimpleRole() {
    }


    public function init(name:String,sk:Skeleton):void
    {
        _sk=sk;
        _name=name;

        skplay("await");
    }

    public function skplay(action:String):void
    {
        //await shock shou shuai surprised
        var skloop:Boolean;
        if(action=="await"){
            skloop=true;
        }else{
            skloop=false;
            _sk.offAll();
            if(action=="shou" || action=="shock" || action=="surprised"){
                _sk.on(Event.STOPPED,this,skplay,["await"]);
            }
        }
        _sk.play(action,skloop);
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
         //console.log(_name,":get click--");
    }






}
}
