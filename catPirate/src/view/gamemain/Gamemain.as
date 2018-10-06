package view.gamemain {
import ui.GameMainUI;

import view.PanelVo;

public class Gamemain extends GameMainUI implements PanelVo {

    public static var _instance:Gamemain;

    public function Gamemain() {
        super();
    }
    public static function get instance():Gamemain
    {
        return _instance || (_instance=new Gamemain());
    }




    public function openPanel(param:Object=null):void
    {


    }



    public function register():void
    {

    }

    public function unRegister():void
    {

    }

    public function closePanel():void
    {

    }

    public function clearAll():void
    {

    }

}
}
