/**This class is automatically generated by LayaAirIDE, please do not make any modifications. */
package src {
	import laya.utils.ClassUtils;
	/**
	 * 游戏初始化配置
	 */
	public class GameConfig {
		public static var onWeiXin:Boolean=true;

		public static var width:int = 640;
		public static var height:int = 1136;
		public static var scaleNum:Number=0.56;//宽高比

		public static var scaleMode:String = "noscale";//"fixedwidth";
		public static var screenMode:String = "vertical";//"none";
		public static var alignV:String = "middle";//"middle";
		public static var alignH:String = "center";
		public static var startScene:* = "test/TestScene.scene";
		public static var sceneRoot:String = "";
		public static var debug:Boolean = false;
		public static var stat:Boolean = true;
		public static var physicsDebug:Boolean = false;
		public static var exportSceneToJson:Boolean = true;
		
		public static function init():void {
			//注册Script或者Runtime引用
			var reg:Function = ClassUtils.regClass;
		}
		GameConfig.init();
	}
}