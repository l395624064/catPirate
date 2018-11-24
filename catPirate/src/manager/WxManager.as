package manager {
import laya.ui.Button;
import laya.utils.Browser;
import laya.utils.Handler;

import manager.WxManager;

public class WxManager {
    public static var _instance:WxManager;
    private var wx:Object=__JS__("wx");
    private var _db:Object;
    private var _form:Object;

    private var _cloudHandler:Handler;

    private var _loginClickFunc:Handler;
    private var userInfoButton:Object;

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

        console.log("-db ready");

        showshareMenu();
        onshareMenu();
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


    public function clodfunc(funcName:String,data:Object,handler:Handler=null):void
    {
        _cloudHandler=handler;
        wx.cloud.callFunction({
            name: funcName,
            data:data,
            complete:function (res) {
                console.log;
                if(handler) _cloudHandler.runWith(res);
            },
            fail:function (res) {
                console.log;
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
                handler.runWith(res.data);
            },
            fail:function (res) {
                handler.runWith(-1);
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
                handler.runWith(res.data);
            },
            fail:function(){
                handler.runWith(-1);
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
            console.log("-a3")
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
        wx.shareAppMessage({
            title: '来跟柴柴一起钓鱼吧',
            imageUrl:"https://img.catqu.com/images/2018/11/25/35216f04b77b3b188044c5a8abfec904.png",
            complete:function (res) {
                //真机可用
                //GameEventDispatch.instance.event(GameEvent.ShowStips,[{id:3}]);
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



}
}
