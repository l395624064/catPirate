package view.gainnewpop {
import laya.events.Event;
import laya.ui.Image;
import laya.utils.Handler;

import manager.GameAdaptive;

import manager.UiManager;

import ui.GainNewpopUI;

import view.PanelVo;

public class Gainnewpop extends GainNewpopUI implements PanelVo{

    public static var _instance:Gainnewpop;
    private var _callback:Handler;
    public function Gainnewpop() {
        super();
    }
    public static function get instance():Gainnewpop
    {
        return _instance ||=new Gainnewpop();
    }

    public function openPanel(param:Object=null):void
    {
        this.ani1.play();

        var img:Image=new Image(param['res']);
        popImg.addChild(img);
        GameAdaptive.instance.setMiddleFromPanel(img,popImg);

        popname.text=param['name'];
        content.text=param['explain_content'];

        if(param.hasOwnProperty("callback")){
            _callback=param['callback'];
        }
        //console.log("-Gainnewpop:",param);
        this.hitTestPrior=true;
        this.on(Event.MOUSE_DOWN,this,function () {
            _callback.run();
            UiManager.instance.closePanel("Gainnewpop");
        })

    }

    public function closePanel():void
    {
        this.visible=false;
    }
    public function clearAllNum():void
    {
        this.ani1.stop();
        popImg.removeChildren();


    }

    public function register():void
    {

    }
    public function unRegister():void
    {

    }

}
}
