package src {
import laya.display.Sprite;
import laya.display.Stage;
import laya.utils.Browser;
import laya.utils.Browser;
import laya.utils.ClassUtils;
import laya.utils.Stat;
import laya.utils.Utils;
import laya.webgl.WebGL;
import manager.GameEvent;
import manager.GameEventDispatch;
import manager.GameInit;
import manager.UiManager;
import manager.WxManager;

import view.gamemap.Gamemap;
import laya.wx.mini.MiniAdpter;

public class LayaSample {
		
		public function LayaSample() {
			gameBrowser();//运行环境
			gameconfig();//初始化引擎
			gameinit();
		}
		private function gameBrowser():void
		{
            //MiniAdpter.init();
			if(GameConfig.onWeiXin){
				MiniAdpter.init();
			}
		}
		private function gameconfig():void
		{
            //根据IDE设置初始化引擎
            //if (window["Laya3D"]) window["Laya3D"].init(GameConfig.width, GameConfig.height);
            //else Laya.init(GameConfig.width, GameConfig.height, Laya["WebGL"]);
            //Laya["Physics"] && Laya["Physics"].enable();
            //Laya["DebugPanel"] && Laya["DebugPanel"].enable();
            Laya.init(GameConfig.width, GameConfig.height, Laya["WebGL"]);
            Laya.stage.scaleMode = GameConfig.scaleMode;
            Laya.stage.screenMode = GameConfig.screenMode;
            Laya.stage.alignV = GameConfig.alignV;
            Laya.stage.alignH = GameConfig.alignH;

            //兼容微信不支持加载scene后缀场景
            //URL.exportSceneToJson = GameConfig.exportSceneToJson;

            //打开调试面板（IDE设置调试模式，或者url地址增加debug=true参数，均可打开调试面板）
            //if (GameConfig.debug || Utils.getQueryString("debug") == "true") Laya.enableDebugPanel();
            //if (GameConfig.physicsDebug && Laya["PhysicsDebugDraw"]) Laya["PhysicsDebugDraw"].enable();
            //if (GameConfig.stat) Stat.show();
            //Laya.alertGlobalError = true;
		}
		private function gameinit():void
		{
            GameInit.instance.init();
            GameEventDispatch.instance.event(GameEvent.GameLoad);
		}
	}
}