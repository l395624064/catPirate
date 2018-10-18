package manager {
import laya.debug.tools.StringTool;
import laya.display.Sprite;
import laya.net.Loader;
import laya.utils.ClassUtils;
import laya.utils.Ease;
import laya.utils.Handler;
import laya.utils.Tween;

import view.gamemap.Gamemap;
import view.gamemain.Gamemain;
import view.loadview.Loadview;
import view.unopend.Unopened;
import view.wait.Wait;


public class UiManager {
    public static var _instance:UiManager;
    private var _name:String;
    private var _param:Object;
    private var _caches:Object;
    private var _emptyResUi:Object;
    private var _panel:*;
    private var _pngNum:Number=0;
    private var _uiType:String="UITYPE_SCENE";//UITYPE_SCENE UITYPE_NORMAL  UITYPE_TIP  UITYPE_ANI
    private const _UITYPE_SCENE_ZORDERARR:Array=[0,100];
    private const _UITYPE_NORMAL_ZORDERARR:Array=[100,200];
    private const _UITYPE_TIP_ZORDERARR:Array=[200,300];
    private const _UITYPE_ANI_ZORDERARR:Array=[300,400];
    private var _UITYPE_SCENE_NUM:int;
    private var _UITYPE_NORMAL_NUM:int;
    private var _UITYPE_TIP_NUM:int;
    private var _UITYPE_ANI_NUM:int;
    private const _UITYPE_WAIT:int=2001;
    private const _UITYPE_EFFECT:int=3000;

    private var _taskArr:Array=[];
    private var _taskState:String="Empty";//Empty Busy
    private var _task:Object;

    public function UiManager() {
        _caches={};
        _emptyResUi={};
        setEmptyRes();
        setZorder();
    }

    public static function get instance():UiManager
    {
        return _instance || (_instance=new UiManager());
    }

    //baseTip res in common
    public function baseTipInit():void
    {
        Wait.instance.register();
        Unopened.instance.register();
    }
    public function baseTipClear():void
    {
        Wait.instance.unRegister();
        Unopened.instance.unRegister();
    }

    //Res in common
    private function setEmptyRes():void
    {
//        _emptyResUi['Loadview']=true;
        _emptyResUi['CommonTip']=true;
    }
    private function getEmptyRes(name:String):Boolean
    {
        return _emptyResUi[name];
    }
    private function setZorder():void
    {
        _UITYPE_SCENE_NUM=_UITYPE_SCENE_ZORDERARR[0];
        _UITYPE_NORMAL_NUM=_UITYPE_NORMAL_ZORDERARR[0];
        _UITYPE_TIP_NUM=_UITYPE_TIP_ZORDERARR[0];
        _UITYPE_ANI_NUM=_UITYPE_ANI_ZORDERARR[0];
    }


    public function loadView(name:String,param:Object=null,pngNum:Number=0,uiType:String="UITYPE_SCENE"):void
    {
        if(_taskState!="Busy"){
            _name=name;
            _param=param;
            _pngNum=pngNum;
            _panel= _caches[_name];
            _uiType=uiType;
            if(_panel || getEmptyRes(_name)){
                //console.log("--panel find out");
                loadComplete();
            }else{
                //console.log("--panel not find And please wait");
                _taskState="Busy";
                if(uiType!="UITYPE_SCENE"){
                    GameEventDispatch.instance.event(GameEvent.OpenWait);
                }
                Laya.loader.load(res,Handler.create(this, loadComplete));
            }
        }else{
            _task={};
            _task={name:name,param:param,pngNum:pngNum,uiType:uiType};
            _taskArr.push(_task);
            //console.log("-into panelTaskRank")
        }
    }

    private function loadComplete():void
    {
        _taskState="Empty";
        if(!_panel){
            console.log("--openpanelName:",_name);
            if(_uiType!="UITYPE_SCENE"){
                GameEventDispatch.instance.event(GameEvent.CloseWait);
            }
            _panel=(_caches[_name] || ClassUtils.getInstance("view."+StringTool.toLowHead(_name)+"."+_name));
            _caches[_name]=_panel;
        }

        if(!_panel.hasOwnProperty('uiZorder')){
            _panel.zOrder=getUiBaseDepth(_uiType);
            _panel['uiZorder']=_panel.zOrder;
        }

        _panel.visible=true;
        _panel.openPanel(_param);
        _panel.register();
        Laya.stage.addChild(_panel);
        showAni(_panel);

        if(_taskArr.length){
            var obj:Object={};
            if(_taskArr.length>1){
                _taskArr.shift();
                obj=_taskArr[0];
            }else{
                obj= _taskArr.shift();
            }
            loadView(obj['name'],obj['param'],obj['pngNum'],obj['uiZorder']);
        }
    }

    private function showAni(panel:*):void
    {
        if(_uiType=="UITYPE_SCENE") return;
        Tween.from(panel,{
            x:Laya.stage.mouseX,
            y:Laya.stage.mouseY,
            scaleX:0,
            scaleY:0
        },300,Ease.backOut)
    }


    public function getUiBaseDepth(type:String):int
    {
        //UITYPE_SCENE UITYPE_NORMAL UITYPE_DLG  UITYPE_TIP
        var deep:int=0;
        switch (type){
            case "UITYPE_SCENE":
            {
                deep=_UITYPE_SCENE_NUM++;
                if(_UITYPE_SCENE_NUM>_UITYPE_SCENE_ZORDERARR[1]) throw new Error("UITYPE_SCENE zorder Max");
                break;
            }
            case "UITYPE_NORMAL":
            {
                deep=_UITYPE_NORMAL_NUM++;
                if(_UITYPE_NORMAL_NUM>_UITYPE_NORMAL_ZORDERARR[1]) throw new Error("UITYPE_NORMAL zorder Max");
                break;
            }
            case "UITYPE_TIP":
            {
                deep=_UITYPE_TIP_NUM++;
                if(_UITYPE_TIP_NUM>_UITYPE_TIP_ZORDERARR[1]) throw new Error("UITYPE_TIP zorder Max");
                break;
            }
            case "UITYPE_ANI":
            {
                deep=_UITYPE_ANI_NUM++;
                if(_UITYPE_ANI_NUM>_UITYPE_ANI_ZORDERARR[1]) throw new Error("UITYPE_ANI zorder Max");
                break;
            }
            case "UITYPE_WAIT":
            {
                deep=_UITYPE_WAIT;
            }
            case "UITYPE_EFFECT":
            {
                deep=_UITYPE_EFFECT;
            }
            default:
            {
                break;
            }
        }
        return deep;
    }


    private function get res():Array
    {
        const atlasURLHead:String="res/atlas/ui/";
        const imgURLHead:String="ui/";
        const filePath:String=StringTool.toLowHead(_name);
        var arr:Array=[
            {url:atlasURLHead + filePath + ".atlas",type:Loader.ATLAS}
        ];
        for (var i:int=0;i<_pngNum;i++){
            arr.push(
                    {
                        url:imgURLHead + filePath + "/" + filePath + "_" + i + ".png",
                        type:Loader.IMAGE
                    }
            )
        }
        return arr;
    }

    public function closePanel(name:String):void
    {
        var panel:*=_caches[name];
        if(panel!=null){
            removeEvent(panel);

            panel.unRegister();
            panel.clearAllNum();
            panel.closePanel();
        }
        Laya.loader.clearTextureRes("res/atlas/ui/" + StringTool.toLowHead(name) + ".png");
    }

    private function removeEvent(panel:*):void
    {
        for(var i:int=0;i<panel.numChildren;i++){
            var panelNode=panel.getChildAt(i);
            panelNode.offAll();
        }
    }





}
}
