package view.gameguide {
import laya.display.Sprite;
import laya.events.Event;
import laya.ui.Box;
import laya.ui.Button;

import manager.GameEvent;

import manager.GameEventDispatch;

import manager.UiManager;

import model.GamemainM;

import model.PlayerInfoM;

import ui.GuideUI;


import view.PanelVo;

public class Gameguide extends GuideUI implements PanelVo{
    public static var _instance:Gameguide;
    private var _taskNum:int=1;
    private var _stepNum:int=1;
    private const _stepArr:Array=[4,7,6,5,2];

    private var _stepBox:Box;

    public function Gameguide() {
        super();
    }
    public static function get instance():Gameguide
    {
        return _instance||=new Gameguide();
    }

    public function openPanel(param:Object=null):void
    {
        this.zOrder=UiManager.instance.getUiBaseDepth("UITYPE_GUIDE");

        var _guideComplete:Boolean=PlayerInfoM.instance.getGuide();
        if(_guideComplete){
            UiManager.instance.closePanel("Gameguide");
            return;
        }

        guideTip.visible=true;
        cancelBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Gameguide");
        });
        confirmBtn.on(Event.MOUSE_DOWN,this,function () {
            guideTip.visible=false;

            nextStep();
            /*
            var mainBox:Box=this.getChildByName("taskBox_1") as Box;
            var stepbox:Box=mainBox.getChildByName("stepbox_1") as Box;
            var spArea:Sprite=stepbox.getChildByName("area") as Sprite;
            spArea.blendMode="destination-out";
            mainBox.visible=true;
            stepbox.visible=true;
            console.log("-",mainBox.name,stepbox.name);
            */
        });

        //Laya.stage.offAll();
        //Laya.stage.on(Event.MOUSE_DOWN,this,clickToNext);
    }



    private function clickToNext():void
    {
        var _guideComplete:Boolean=PlayerInfoM.instance.getGuide();
        if(_guideComplete)return;
        _stepNum++;
        if(_stepNum>_stepArr[_taskNum-1]){
            _stepNum=1;
            _taskNum++;
            if(_taskNum>_stepArr.length){
                console.log("--guide complete");
                //获得奖励
                PlayerInfoM.instance.setGuide(true);
                UiManager.instance.closePanel("Gameguide");
                return;
            }
        }
        nextStep();
    }
    private function nextStep():void
    {
        showTaskBox();
        showStepBox();
        //console.log("-task:",_taskNum,"-step:",_stepNum,"-zorder:",this.zOrder);
    }


    private function showTaskBox():void
    {
        for(var i:int=1;i<=_stepArr.length;i++){
            var taskBox:Box=this.getChildByName("taskBox_"+i) as Box;
            taskBox.visible=false;
            if(i==_taskNum){
                taskBox.visible=true;
            }
        }
    }

    private function showStepBox():void
    {
        var taskBox:Box=this.getChildByName("taskBox_"+_taskNum) as Box;
        var taskNum:int=_stepArr[_taskNum-1];
        for (var i:int=1;i<=taskNum;i++){
            _stepBox=taskBox.getChildByName("stepbox_"+i) as Box;
            _stepBox.visible=false;
            _stepBox.offAll();
            if(i==_stepNum){
                _stepBox.visible=true;
                _stepBox.cacheAs="bitmap";
                _stepBox.mouseEnabled=true;

                var area:Sprite=_stepBox.getChildByName("area") as Sprite;
                area.visible=true;
                area.blendMode = "destination-out";
                var nextBtn:Button=_stepBox.getChildByName("nextBtn") as Button;

                if(nextBtn){
                    _stepBox.mouseThrough=false;
                    nextBtn.offAll();
                    nextBtn.once(Event.MOUSE_DOWN,this,function () {
                        clickToNext();
                    });
                }else {
                    _stepBox.mouseThrough=true;
                }
            }
        }
    }







    public function closePanel():void
    {
        this.visible=false;
    }
    public function clearAllNum():void
    {
        //guideTip.visible=false;
        //关闭显示所有box

    }

    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.GameGuideNext,this,clickToNext);
    }
    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.GameGuideNext,this,clickToNext);
    }
}
}
