package manager {
import laya.debug.tools.StringTool;
import laya.display.Sprite;
import laya.net.Loader;
import laya.ui.Image;
import laya.utils.ClassUtils;
import laya.utils.Handler;

import view.loadview.Loadview;

public class UiManager {
    public static var _instance:UiManager;
    private var _name:String;
    private var _param:Object;
    private var _caches:Object;
    private var _emptyResUi:Object;
    private var _panel:*;
    private var _pngNum:Number=0;
    //private var _uiType:String="UITYPE_SCENE";//UITYPE_SCENE UITYPE_NORMAL UITYPE_DLG  UITYPE_TIP

    private var _taskArr:Array=[];
    private var _taskState:String="Empty";//Empty Busy
    private var _task:Object;

    public function UiManager() {
        _caches={};
        _emptyResUi={};
        setEmptyRes();
    }

    public static function get instance():UiManager
    {
        return _instance || (_instance=new UiManager());
    }
    private function setEmptyRes():void
    {
        _emptyResUi['Loadview']=true;
        _emptyResUi['CommonTip']=true;
    }
    private function getEmptyRes(name:String):Boolean
    {
        return false;
//        return _emptyResUi[name];
    }


    public function loadView(name:String,param:Object=null,pngNum:Number=0):void
    {
        if(_taskState!="Busy"){
            _name=name;
            _param=param;
            _pngNum=pngNum;
            _panel= _caches[_name];
            if(_panel){
                //console.log("--panel find out");
                loadComplete();
            }else{
                //console.log("--panel not find And please wait");
                _taskState="Busy";
                Laya.loader.load(res,Handler.create(this, loadComplete));
            }
        }else{
            _task={};
            _task={name:name,param:param,pngNum:pngNum};
            _taskArr.push(_task);
            //console.log("-into panelTaskRank")
        }
    }

    private function loadComplete():void
    {
        _taskState="Empty";
        if(!_panel){
            _panel=(_caches[_name] || ClassUtils.getInstance("view."+StringTool.toLowHead(_name)+"."+_name));
            _caches[_name]=_panel;
        }

        _panel.openPanel(_param);
        _panel.register();
        Laya.stage.addChild(_panel);
        //setUiBaseDepth();
        if(_taskArr.length){
            var obj:Object={};
            if(_taskArr.length>1){
                _taskArr.shift();
                obj=_taskArr[0];
            }else{
                obj= _taskArr.shift();
            }
            loadView(obj['name'],obj['param'],obj['pngNum']);
        }
    }




    private function setUiBaseDepth():void
    {
        //_panel.visible=true;
        //console.log("-_panel.visible:",_panel.visible);
        //parent=stage
        //parent=currentScene
        //parent=currentPanel
    }

    private function getUiBaseDepth(type:String):int
    {
        //UITYPE_SCENE UITYPE_NORMAL UITYPE_DLG  UITYPE_TIP
        var deep:int=0;
        switch (type){
            case "UITYPE_SCENE":
            {
                break;
            }
            case "UITYPE_NORMAL":
            {
                break;
            }
            case "UITYPE_DLG":
            {
                break;
            }
            case "UITYPE_TIP":
            {
                break;
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
            panel.removeSelf();
            panel.unRegister();
        }
    }





}
}
