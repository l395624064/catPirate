package view.unopend {
import laya.ui.Image;

import manager.GameEvent;

import manager.GameEventDispatch;


import ui.UnopenedUI;

import view.PanelVo;

public class Unopened extends ui.UnopenedUI implements PanelVo{

    public static var _instance:Unopened;
    private var _fparent:Image;
    private const _fontPix:int=50;

    public function Unopened() {
        super();
    }

    public static function get instance():Unopened
    {
        return _instance || (_instance =new Unopened());
    }

    public function openPanel(param:Object=null):void
    {
        if(!(param is Image)) return;

        _fparent=param as Image;
        imgAdaptive();
    }

    private function imgAdaptive():void
    {
        if(!_parent) return;

        this.visible=true;
        this.bmask.pos(_fparent.x,_fparent.y);
        this.bmask.size(_fparent.width,_fparent.height);

        this.tipImg.pos(_fparent.width/2,_fparent.height/2);
        this.tipFont.pos(tipImg.x,tipImg.y+tipImg.height/2+_fontPix);
    }

    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.UnopenedShow, this, imgAdaptive);
        GameEventDispatch.instance.on(GameEvent.Unopenedhide, this, closePanel);
    }
    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.UnopenedShow, this, imgAdaptive);
        GameEventDispatch.instance.off(GameEvent.Unopenedhide, this, closePanel);
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
