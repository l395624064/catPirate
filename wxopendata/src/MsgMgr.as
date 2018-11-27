package 
{
	import laya.maths.Matrix;
	import laya.wx.mini.MiniAdpter;
	import laya.wx.mini.MiniFileMgr;
	import laya.utils.Handler;
	import laya.net.Loader;
	import view.FriendRank;
	/**
	 * 事件派发监听管理类 
	 * author xiaosong
	 * @date 2017-02-26
	 */	
	public class MsgMgr
	{
		/**共享画布类型**/
		public static var SHAREDRESIZE:String = "sharedresize";
		private var _instance:MsgMgr;

		private var wx:Object=__JS__('wx');


		public function MsgMgr()
		{
			super();
		}
		public static function get instance():MsgMgr
		{
			return _instance ||= new MsgMgr();
		}
		
		/**初始化消息监听**/
		public function init():void
		{
			//接收主域透传的数据
			if(MiniAdpter.isZiYu && MiniAdpter.isPosMsgYu)
			{
				wx.onMessage(function(message:Object):void{
					//console.log("---ziyu get",message);
					Laya.MiniFileMgr.ziyuFileData[message.url] = message.data;
					if(message['isLoad'] == "filedata")
					{
						MiniFileMgr.ziyuFileData[message.url] = message.data;//文本数据
					}else if(message['isLoad'] == "filenative")
					{
						//子域接收主域传递的文件信息
						if(message.isAdd)
							MiniFileMgr.filesListObj[message.url] = message.data;
						else
							delete MiniFileMgr.filesListObj[message.url];
					}else if (message['type'] == "resizeShared")
					{
						__JS__('sharedCanvas').width = message.data.width;
						__JS__('sharedCanvas').height = message.data.height;
						var tempMatrix:Object = message.data.matrix;
						var matrix:Matrix = new Matrix();
						matrix.a = tempMatrix.a;
						matrix.b = tempMatrix.b;
						matrix.c = tempMatrix.c;
						matrix.d = tempMatrix.d;
						Laya.stage._canvasTransform = matrix;//重新设置矩阵
					}else if(message['type'] == "openWXFriendRank"){
						getFriendCloudStorage(message['kvArr']);
					}else if(message['type'] == "closeWXFriendRank"){
						
					}
				});
			}

			
			Laya.timer.once(3000,this,function():void{
				beginLoad();
			});
		}


		private function beginLoad():void {
			//加载引擎需要的资源
			Laya.loader.load("res/atlas/ui/wxrank.atlas", Handler.create(this, onLoaded));
		}
		
		private function onLoaded():void {
			//FriendRank.instance;
			Laya.stage.addChild(FriendRank.instance);
		}


		private function updateRank(rankObj):void
		{
			if(rankObj.length<=1){
				var obj:Object=rankObj[0];
				var arr:Array=[obj];
				FriendRank.instance.initNum(arr);
			}
			else{
				var _arr:Array=[];
				for(var i:int=0;i<rankObj.length;i++){
					_arr.push(rankObj[i]);
				}
				FriendRank.instance.initNum(_arr);
			}
		}


		private function getFriendCloudStorage(_kvArr:Array):void
   		{
        	wx.getFriendCloudStorage({
            	keyList:_kvArr,
            	success:function (res) {
                	//console.log("-getFriendCloudStorage success:",res);
                	updateRank(res.data);
            	},
            	fail:function (res) {
                	//console.log("-getFriendCloudStorage fail:",res);
            	}
        	});
    	}

    	private function getUserCloudStorage(_kvArr:Array):void
    	{
        	wx.getUserCloudStorage({
            	keyList:_kvArr,
            	success:function (res) {
                	console.log("-getUserCloudStorage success:",res);
            	},
            	fail:function (res) {
                	console.log("-getUserCloudStorage fail:",res);
            	}
        	})
    	}



	}	
}