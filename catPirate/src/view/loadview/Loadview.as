package view.loadview {
import laya.net.Loader;
import laya.net.URL;
import laya.utils.Handler;

import manager.ConfigManager;
import manager.GameEvent;
import manager.GameEventDispatch;

import manager.UiManager;
import manager.WxManager;

import model.PlayerInfoM;

import src.GameConfig;


import ui.GameloadUI;

import view.PanelVo;

public class Loadview extends GameloadUI implements PanelVo{

    public static var _instance:Loadview;
    private var loadRes:Array=[
        {url:"res/atlas/comp.atlas",                 type:Loader.ATLAS,  priority:3},
        {url:"res/atlas/ui/common.atlas",            type:Loader.ATLAS,  priority:4},
        {url:"res/atlas/ui/common_ex.atlas",         type:Loader.ATLAS,  priority:1},
        {url:"res/atlas/ui/common_img.atlas",        type:Loader.ATLAS,  priority:4},
        {url:"res/atlas/ui/common_ef.atlas",         type:Loader.ATLAS,  priority:4},
        {url:"res/atlas/ui/shipskin.atlas",          type:Loader.ATLAS,  priority:2},

        {url:"DB/DB_dog/dog.sk",                     type:Loader.BUFFER, priority:1},

        {url:"res/atlas/ui/gamemain.atlas",          type:Loader.ATLAS,  priority:1},
        {url:"ui/gamemain/gamemain_0.png",           type:Loader.IMAGE,  priority:1},
        {url:"ui/gamemain/gamemain_1.png",           type:Loader.IMAGE,  priority:4},

        {url:"res/atlas/font.atlas",                 type:Loader.ATLAS,  priority:4},

        {url:ConfigManager.getConfigPath(),           type:Loader.JSON,  priority:0}
    ];

    private var fakeNum:Number=0;

    public function Loadview() {
        super();
    }

    public static function get instance():Loadview
    {
        return _instance || (_instance=new Loadview());
    }





    public function openPanel(param:Object=null):void
    {
        if(GameConfig.onWeiXin){
            Laya.loader.load("res/atlas/ui/wxrank.atlas",Handler.create(this,loadNetRes));
        }


        if(this.hasOwnProperty('gameversionTxt')){
            gameversionTxt.text=GameConfig.gameVersion;
        }
    }

    private function loadNetRes():void
    {
        URL.basePath=GameConfig.weixinResURL;
        Laya.loader.load(loadRes,Handler.create(this,function () {
            console.log("-res load complete");
            GameEventDispatch.instance.event(GameEvent.GameSaveInit);//获得存档
            GameEventDispatch.instance.event(GameEvent.GameNetConfig);//网络配置
        }));

        //bannerAd
        if(PlayerInfoM.instance.getNetConfigAD()){
            WxManager.instance.getSystemInfo();
            WxManager.instance.createBannerAd();
            WxManager.instance.createVideoAd();
        }

        setloadBar(0);
        Laya.timer.loop(100,this,fakeloader);
    }
    private function fakeloader():void
    {
        fakeNum+=0.03;
        if(fakeNum>=.9){
            Laya.timer.clear(this,fakeloader);
            fakeNum=.9;
        }
        setloadBar(fakeNum);
    }


    private function startLoadRes():void
    {
        if(GameConfig.onWeiXin){
            Laya.timer.clear(this,fakeloader);
            loadComplete();
        }else {
            Laya.loader.load(loadRes,Handler.create(this, loadComplete),Handler.create(this,onProgress));
            setloadBar(0);
        }
    }

    private function loadComplete():void
    {
        setloadBar(1);
        UiManager.instance.baseTipInit();

        Laya.timer.once(1000,this,function () {
            ConfigManager.init();
            UiManager.instance.closePanel("Loadview");
            GameEventDispatch.instance.event(GameEvent.GameLoadOver);
        })
    }
    private function onProgress(res:Number):void
    {
        var num:int=Math.floor(Number(res.toFixed(2)));
        setloadBar(num);
    }
    private function setloadBar(_value:Number):void
    {
        if(_value>=1) _value=1;
        this.loadBar.value=_value;
        this.loadHead.centerX=-loadBar.width/2+loadBar.width*_value;
    }


    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.StartLoad,this,startLoadRes);
    }
    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.StartLoad,this,startLoadRes);
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
