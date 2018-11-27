package {
	import laya.display.Stage;
	import laya.events.Event;
	import laya.maths.Matrix;
	import laya.net.ResourceVersion;
	import laya.utils.Browser;
	import view.FriendRank;
	import laya.wx.mini.MiniAdpter;
	
	public class LayaUISample {

		public  var _width:int = 640;
		public  var _height:int = 1136;
		public  var _scaleMode:String = "noscale";//"fixedwidth";
		public  var _screenMode:String = "vertical";//"none";
		public  var _alignV:String = "middle";//"middle";
		public  var _alignH:String = "center";
		
		public function LayaUISample() {
			//微信小游戏适配库初始化
			MiniAdpter.init(true,true);
			//初始化引擎
			Laya.init(_width, _height);
            Laya.stage.scaleMode = _scaleMode;
            Laya.stage.screenMode = _screenMode;
            Laya.stage.alignV = _alignV;
            Laya.stage.alignH = _alignH;

            //激活资源版本控制
            MsgMgr.instance.init();
		}
	}
}