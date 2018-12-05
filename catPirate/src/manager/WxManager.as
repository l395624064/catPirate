package manager {
import laya.debug.tools.JsonTool;
import laya.display.Sprite;
import laya.resource.Texture;
import laya.ui.Button;
import laya.utils.Browser;
import laya.utils.Handler;
import laya.wx.mini.MiniLoader;

import manager.WxManager;

import model.PlayerInfoM;

import src.GameConfig;

public class WxManager {
    public static var _instance:WxManager;
    private var wx:Object=__JS__("wx");
    private var _db:Object;
    private var _form:Object;

    private var _cloudHandler:Handler;

    private var _loginClickFunc:Handler;
    private var userInfoButton:Object;

    private var _layaAppId:String="wx24c7a0688503db70";
    private var _netconfigformId:String="XAZWnd7E7L4wawdD";

    private var _bannerAd:Object;
    private var _bannerId:String="adunit-bd91e82f214aecc0";

    private var _videoAd:Object;
    private var _videoId:String="adunit-f845d317f13b5df3";

    private var _screenWidth:int;
    private var _screenHeight:int;

    private var _onShowHandler:Handler;
    private var _outTime:Date;
    private const _stayTime:int=3000;

    public function WxManager() {
        init();
    }
    public static function get instance():WxManager
    {
        return _instance||=new WxManager();
    }


    public function init():void
    {
        wx.cloud.init();
        //clodfunc();
        _db=database();
        _form=getform("todos");

        showshareMenu();
        onshareMenu();
        onshow();
        //onhide();
        console.log("-wx.cloud init over");
    }

    private function onhide():void
    {
        wx.onHide(function () {
            var date:Date=new Date();
            //console.log("-onhide",date.getTime());
        });
    }

    private function onshow():void
    {
        wx.onShow(function () {
            var date:Date=new Date();
            if(_onShowHandler && date.getTime()-_outTime.getTime()>=_stayTime){
                _onShowHandler.run();
                _onShowHandler=null;
                _outTime=null;
            }
            if(_outTime){
                //console.log("-onshow",_outTime.getTime(),date.getTime());
                //console.log("-true _stayTime",_outTime.getTime()-date.getTime());
            }
            GameSoundManager.onPlayMusic("");
        });
    }

    private function database(env:String=null):Object
    {
        if(env) return wx.cloud.database({env:env});
        return wx.cloud.database();
    }

    private function getform(name:String):Object
    {
        return _db.collection(name);
    }

    /*
    public function getGameConfig(handler:Handler=null):void
    {
        _db.collection('gameConfig').doc(_netconfigformId).get({
            success: function(res) {
                console.log("-getGameConfig success",res);
                handler.runWith(res.data);
            },
            fail:function (res) {
                console.log("-getGameConfig fail",res);
            }
        });
    }*/

    public function clodfunc(funcName:String,data:Object,handler:Handler=null):void
    {
        _cloudHandler=handler;
        wx.cloud.callFunction({
            name: funcName,
            data:data,
            complete:function (res) {
                console.log("-clodfunc complete");
                if(handler) _cloudHandler.runWith(res);
            },
            fail:function (res) {
                console.log("-clodfunc fail");
                clodfunc("add",null,_cloudHandler);
            }
        })
    }


    private function get serverDate():*
    {
        return _db.serverDate();
    }

    //get _id use player saveId
    public function addformData(data:Object):void
    {
        _form.add({
            data:data,
            success:function (res) {
                console.log(res);
            },
            fail:function (res) {
                console.log(res);
            }
        })
    }

    public function getformData(userId:String,handler:Handler):void
    {
        _form.doc(userId).get({
            success:function (res) {
                console.log("-getformData success:",res);
                handler.runWith(res.data);
            },
            fail:function (res) {
                console.log("-getformData fail");
                handler.runWith("fail");
            }
        });
    }

    public function setformData(userId:String,data:Object):void
    {
        _form.doc(userId).set({
            data:data,
            success:function (res) {
                console.log("-netSaveData success");
            },
            fail:function (res) {
                console.log("-netSaveData fail");
            }
        });
    }

    private function deleteformData(userId:String):void
    {
        _form.doc(userId).remove({
            success:function (res) {
                console.log(res.data);
                return res.data;
            },
            fail:function (res) {
                console.log(res.data);
            }
        });
    }

    private function findoutformData(form:Object,data:Object):void
    {
        form.where(data).get({
            success:function (res) {
                // res.data 是一个包含集合中有权限访问的所有记录的数据，不超过 20 条
                console.log(res.data);
            }
        });
    }

    public function getStorage(_storageKey:String,handler:Handler):void
    {
        wx.getStorage({
            key:_storageKey,
            success:function(res){
                console.log("-getStorage success");
                handler.runWith(res.data);
            },
            fail:function(res){
                console.log("-getStorage fail");
                handler.runWith("fail");
            }
        });
    }


    public function setStorage(keyname:String,value:Object):void
    {
        wx.setStorage({
            key:keyname,
            data:value,
            success:function (res) {
                //console.log("-localsave success");
            },
            fail:function (res) {
                //console.log("-localsave fail");
            }
        })
    }



    public function checkSession():void
    {
        wx.checkSession({
            success: function (res){
                console.log("check_session_success:", res);
            },
            fail: login
        })
    }


    public function login(handler:Handler):void
    {
        console.log("-login-");
        _loginClickFunc=handler;
        wx.login({
            success: function (res)
            {
                get_user_info();//获取用户信息
            },
            fail:function (res) {
                console.log("-login fail:",res);
            }
        })
    }

    public  function get_user_info():void
    {
        var rectW:Number = 180;
        var rectH:Number = 80;
        rectW=Browser.clientWidth/(Browser.width/rectW);
        rectH=Browser.clientHeight/(Browser.height/rectH);

        var leftNum:Number=Browser.clientWidth/2-rectW/2;
        var topNum:Number=Browser.clientHeight/5*4;
        var param:Object = {
            type: 'image',
            image: 'ui/loadview/loginbtn.png',
            style: {
                left: leftNum,
                top: topNum,
                width: rectW,
                height: rectH,
                lineHeight: 40,
                backgroundColor: '#ff0000',
                color: '#ffffff',
                textAlign: 'center',
                fontSize: 16,
                borderRadius: 4
            }
        };

        userInfoButton=wx.createUserInfoButton(param);
        userInfoButton.onTap(get_user_info_success);
    }

    public function get_user_info_success(data:*):void
    {
        WxManager.instance._loginClickFunc.runWith(data);
        if(WxManager.instance.userInfoButton) WxManager.instance.userInfoButton.hide();
    }


    private function showshareMenu():void
    {
        wx.showShareMenu({
            withShareTicket:true,
            success:function(res){
            },
            fail:function(){
            }
        });
    }

    public function onshareMenu():void
    {
        wx.onShareAppMessage(function () {
            return {
                title: '来跟柴柴一起钓鱼吧',
                imageUrl:"https://img.catqu.com/images/2018/11/25/a7c848e4709f1d8edddc41fcaea5d6e9.png",
                complete:function (res) {
                    //真机可用
                }
            }
        })
    }


    public function shareApp(handler:Handler=null,msg:Object=null):void
    {
        _onShowHandler=handler;
        _outTime=new Date();

        wx.shareAppMessage({
            title: '来跟柴柴一起钓鱼吧',
            imageUrl:"https://img.catqu.com/images/2018/11/27/7ffd2f18e62eac39f153ea6c9478aaf2.png",
            complete:function (res) {
                //真机可用
                //GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:3}]);
                console.log("-share complete");
                if(handler){
                    if(msg){
                        handler.runWith(msg);
                    }else{
                        handler.run();
                    }
                }
            }
        })
    }

    public function navigateToMiniProgram(appId:String=""):void
    {
        if(appId=="") appId=_layaAppId;
        wx.navigateToMiniProgram({
            appId:appId
        });
    }

    public  function setUserCloudStorage(_score:int):void
    {
        //{ key: 'score', value: score }
        /*
        var kvdata:Object={
            "wxgame":
                    {
                        "score":_score,
                        "update_time":Math.floor(new Date().getTime()/1000)
                    }
        };*/
        var _keyArr:Array=[{ key: 'score', value: _score+"" }];
        wx.setUserCloudStorage({
            KVDataList:_keyArr,
            success:function(res){
                console.log("setUserCloudStorage success");
            },
            fail:function(res){
                console.log("setUserCloudStorage fail");
            }
        });
    }

    /**
     * 长震动400 ms
     */
    public  function shakeLong():void
    {
        wx.vibrateLong({
            success:function(){
                //onSuccess()
            },
            fail:function(){
                //onFail()
            },
            complete:function(){
                //onComplete()
            }
        });
    }

    /**
     * 短震动15 ms
     */
    public  function shakeShort():void
    {
        wx.vibrateShort({
            success:function(){
                //onSuccess()
            },
            fail:function(){
                //onFail()
            },
            complete:function(){
                //onComplete()
            }
        });
    }


    public function resizeShared():void
    {
        //设置共享画布大小
        __JS__('sharedCanvas').width = GameConfig.width;
        __JS__('sharedCanvas').height = GameConfig.height;
        //主域往子域透传消息
        wx.postMessage(
                {type:"resizeShared",
                    url:"",
                    data:{
                        width:GameConfig.width,
                        height:GameConfig.height,
                        matrix:Laya.stage._canvasTransform
                    },
                    isLoad:false
                }
        );
    }
    public function openWXFriendRank():void
    {
        creatshareCanvas();
        var kvArr:Array=["score"];
        wx.postMessage({
            type:"openWXFriendRank",
            kvArr:kvArr
        });
    }
    public function closeWXFriendRank():void
    {
        removeshareCanvas();
        wx.postMessage({type:"closeWXFriendRank"});
    }

    private var _canvasSp:Sprite;
    private var _canvasTexture:Texture;
    public function creatshareCanvas():void
    {
        _canvasSp = new Sprite();
        _canvasSp.pos(0, 0);
        _canvasTexture = new Texture(Browser.window.sharedCanvas);
        _canvasTexture.bitmap.alwaysChange = true;//小程序使用，非常费，这个参数可以根据自己的需求适当调整，如果内容不变可以不用设置成true

        _canvasSp.graphics.drawTexture(_canvasTexture, 0, 0, _canvasTexture.width, _canvasTexture.height);
        _canvasSp.zOrder=UiManager.instance.getUiBaseDepth("UITYPE_WX_SHARECANVAS");
        //console.log("--_canvasTexture:",_canvasTexture.width, _canvasTexture.height);
        Laya.stage.addChild(_canvasSp);
    }
    public function removeshareCanvas():void
    {
        _canvasTexture.bitmap.alwaysChange=false;
        Laya.stage.removeChild(_canvasSp);
    }

    public function getSystemInfo():void
    {
        wx.getSystemInfo({
            success:function (res) {
                //console.log("-pixelRatio:",res.pixelRatio);
                console.log("-screenWidth or screenHeight:",res.screenWidth,res.screenHeight);
                _screenWidth=res.screenWidth;
                _screenHeight=res.screenHeight;
                //console.log("-windowWidth or windowHeight:",res.windowWidth,res.windowHeight);
            }
        });
    }


    public function createBannerAd():void
    {
        const _width:int=300;
        const _height:int=105;
        if(_bannerAd){
            showBannerAd();
            return;
        }
        _bannerAd=wx.createBannerAd({
            adUnitId:_bannerId,
            style: {
                left: Math.floor((_screenWidth-_width)/2),
                top: _screenHeight-_height,
                width: _width
            }
        });
        _bannerAd.onError(bannerAdError);
        _bannerAd.onLoad(bannerAdComplete);
    }
    private function bannerAdError(res):void
    {
        WxManager.instance.hideBannerAd();
        if(res.errCode==1000){
            console.log("-bannerAd  Error:1000 后端接口调用失败");
        }
        else if(res.errCode==1001){
            console.log("-bannerAd  Error:1001 参数错误");
        }
        else if(res.errCode==1002){
            console.log("-bannerAd  Error:1002 广告单元无效");
        }
        else if(res.errCode==1003){
            console.log("-bannerAd  Error:1003 内部错误");
        }
        else if(res.errCode==1004){
            console.log("-bannerAd  Error:1004 无合适的广告");
        }
        else if(res.errCode==1005){
            console.log("-bannerAd  Error:1005 广告组件审核中");
        }
        else if(res.errCode==1006){
            console.log("-bannerAd  Error:1006 广告组件被驳回");
        }
        else if(res.errCode==1007){
            console.log("-bannerAd  Error:1007 广告组件被封禁");
        }
        else if(res.errCode==1008){
            console.log("-bannerAd  Error:1008 广告单元已关闭");
        }
    }
    private function bannerAdComplete(res):void
    {
        console.log("-bannerAd create complete");
        //WxManager.instance.showBannerAd();
    }

    public function showBannerAd():void
    {
        _bannerAd.show();
    }
    public function hideBannerAd():void
    {
        _bannerAd.hide();
    }



    public function createVideoAd():void
    {
        _videoAd=wx.createRewardedVideoAd({
            adUnitId:_videoId
        });
        _videoAd.onLoad(videoAdComplete);
        _videoAd.onError(videoAdError);
        _videoAd.onClose(videoAdOver);
    }
    private function videoAdError(res):void
    {
        if(res.errCode==1000){
            console.log("-videoAd  Error:1000 广告单元已关闭");
        }
        else if(res.errCode==1001){
            console.log("-videoAd  Error:1001 参数错误");
        }
        else if(res.errCode==1002){
            console.log("-videoAd  Error:1002 广告单元无效");
        }
        else if(res.errCode==1003){
            console.log("-videoAd  Error:1003 内部错误");
        }
        else if(res.errCode==1004){
            console.log("-videoAd  Error:1004 无合适的广告");
        }
        else if(res.errCode==1005){
            console.log("-videoAd  Error:1005 广告组件审核中");
        }
        else if(res.errCode==1006){
            console.log("-videoAd  Error:1006 广告组件被驳回");
        }
        else if(res.errCode==1007){
            console.log("-videoAd  Error:1007 广告组件被封禁");
        }
        else if(res.errCode==1008){
            console.log("-videoAd  Error:1008 广告单元已关闭");
        }
        WxManager.instance.reloadVideoAd();
    }
    private function videoAdComplete():void
    {
        console.log("-videoAd create complete");
    }
    public function reloadVideoAd():void
    {
        _videoAd.load();
    }

    public var _videoCloseHandler:Handler;
    public function showVideoAd(handler:Handler):void
    {
        _videoAd.show();
        _videoCloseHandler=handler;

        GameSoundManager.setmusicMuted(true);//关闭音乐
        GameSoundManager.setsoundMuted(true);//关闭音乐
    }

    private function videoAdOver(res):void
    {
        GameSoundManager.setmusicMuted(false);
        GameSoundManager.setsoundMuted(false);
        console.log("--videoAdOver:",res);
        if(res && res.isEnded || res === undefined){
            // 正常播放结束，可以下发游戏奖励
            WxManager.instance._videoCloseHandler.run();
        }else{
            // 播放中途退出
        }

    }

}
}
