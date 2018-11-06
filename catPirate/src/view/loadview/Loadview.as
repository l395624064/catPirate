package view.loadview {
import laya.net.Loader;
import laya.utils.Handler;

import manager.ConfigManager;
import manager.GameEvent;
import manager.GameEventDispatch;

import manager.UiManager;


import ui.GameloadUI;

import view.PanelVo;

public class Loadview extends GameloadUI implements PanelVo{

    public static var _instance:Loadview;
    private var loadRes:Array=[
        {url:"res/atlas/comp.atlas",                 type:Loader.ATLAS},
        {url:"res/atlas/ui/common.atlas",            type:Loader.ATLAS},
        {url:"res/atlas/ui/common_ex.atlas",         type:Loader.ATLAS},
        {url:"res/atlas/ui/common_img.atlas",        type:Loader.ATLAS},
        {url:"res/atlas/ui/common_ef.atlas",         type:Loader.ATLAS},
        {url:"res/atlas/ui/shipskin.atlas",         type:Loader.ATLAS},

        {url:"res/atlas/font.atlas",                 type:Loader.ATLAS},

        {url:"scene/gameScene_0.jpg",                type:Loader.IMAGE},

        {url:"sound/destroy.wav",                    type:Loader.SOUND},
        {url:"sound/hit.wav",                        type:Loader.SOUND},

        {url:ConfigManager.getConfigPath(),           type:Loader.JSON}
    ];

    public function Loadview() {
        super();
    }

    public static function get instance():Loadview
    {
        return _instance || (_instance=new Loadview());
    }





    public function openPanel(param:Object=null):void
    {
        Laya.loader.load(loadRes,Handler.create(this, loadComplete),Handler.create(this,onProgress));
        setloadBar(0);
    }
    private function loadComplete():void
    {
        setloadBar(1);
        ConfigManager.init();
        UiManager.instance.baseTipInit();

        Laya.timer.once(1000,this,function () {
            UiManager.instance.closePanel("Loadview");
            GameEventDispatch.instance.event(GameEvent.GameLoadOver);
        })
    }
    private function onProgress(res:Number):void
    {
        setloadBar(Math.floor(Number(res.toFixed(2))));
    }
    private function setloadBar(_value:Number):void
    {
        if(_value>=1) _value=1;
        this.loadBar.value=_value;
        this.loadHead.centerX=-loadBar.width/2+loadBar.width*_value;
    }


    public function register():void
    {

    }
    public function unRegister():void
    {

    }

    public function clearAllNum():void
    {

    }

    public function closePanel():void
    {
        this.visible=false;
    }
}
}
