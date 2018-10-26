package view.smalltips {
import conf.cfg_tip;

import laya.maths.Point;
import laya.utils.Handler;

import laya.utils.Tween;

import manager.UiManager;

import src.GameConfig;

import ui.SmallTipsUI;

import view.PanelVo;

public class Smalltips extends SmallTipsUI implements PanelVo{

    public static var _instance:Smalltips;
    private var _content:String="未设置任何提示";
    private var _positionState:String="STAGE_MIDDLE";//STAGE_MIDDLE STAGE_MIDDLE_UP STAGE_MIDDLE_DOWN

    private var _startPoint:Point;
    private var _overHander:Handler;

    public function Smalltips() {
        super();
    }

    public static function get instance():Smalltips
    {
        return _instance||=new Smalltips();
    }

    public function openPanel(param:Object=null):void
    {
        var id:int=param['id'];
        _content=cfg_tip.instance(id+"").txtContent;
        content.text=_content;

        if(_content.length > 14) setBgHeight("BIG");
        else setBgHeight("NORMAL");

        if(param.hasOwnProperty('overSmalltipsHander')) _overHander=param['overSmalltipsHander'];
        else _overHander=null;

        if(param.hasOwnProperty('positionState')) _positionState=param['positionState'];
        else _positionState="STAGE_MIDDLE";

        _startPoint=startPoint;
        tipsBox.centerX=_startPoint.x;
        tipsBox.centerY=_startPoint.y;
        tipsBox.alpha=1;

        Tween.to(tipsBox,{centerY:tipsBox.centerY-100,alpha:0.5},1200,null,new Handler(this,onComplete),0,true);
    }

    private function setBgHeight(state:String):void
    {
        if(state=="NORMAL"){
            tips_Bg.height=57;
            tips_Bg2.height=45;
            content.height=41;
        }else if(state=="BIG"){
            tips_Bg.height=90;
            tips_Bg2.height=74;
            content.height=68;
        }
    }
    private function get startPoint():Point
    {
        switch (_positionState){
            case "STAGE_MIDDLE":return new Point(0,50);
            break;
            case "STAGE_MIDDLE_UP":return new Point(0,-GameConfig.height/4);
            break;
            case "STAGE_MIDDLE_DOWN":return new Point(0,GameConfig.height/4);
            break;
            default:return new Point(0,0);
            break;
        }
    }

    private function onComplete():void
    {
        if(_overHander) _overHander.run();
        UiManager.instance.closePanel("Smalltips");
    }

    public function register():void
    {

    }
    public function unRegister():void
    {

    }

    public function clearAllNum():void
    {
        setBgHeight("NORMAL");
        _content="未设置任何提示";
    }
    public function closePanel():void
    {
        this.visible=false;
    }


}
}
