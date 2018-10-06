package {
import laya.net.Loader;
import laya.net.URL;
import laya.utils.Handler;
import laya.webgl.WebGL;

import manager.GameEvent;

import manager.GameEventDispatch;

import manager.GameInit;
import manager.UiManager;

import src.model.PlayerInfoM;

import view.loadview.Loadview;

public class LayaSample {
		
		public function LayaSample() {
			gameconfig();//初始化引擎
			gameinit();
		}
		private function gameconfig():void
		{
            //根据IDE设置初始化引擎
//            if (window["Laya3D"]) window["Laya3D"].init(GameConfig.width, GameConfig.height);
//            else Laya.init(GameConfig.width, GameConfig.height, Laya["WebGL"]);
//            Laya["Physics"] && Laya["Physics"].enable();
//            Laya["DebugPanel"] && Laya["DebugPanel"].enable();
            Laya.init(GameConfig.width, GameConfig.height, Laya["WebGL"]);
            Laya.stage.scaleMode = GameConfig.scaleMode;
            Laya.stage.screenMode = GameConfig.screenMode;
            Laya.stage.alignV = GameConfig.alignV;
            Laya.stage.alignH = GameConfig.alignH;
            //兼容微信不支持加载scene后缀场景
            //URL.exportSceneToJson = GameConfig.exportSceneToJson;

            //打开调试面板（IDE设置调试模式，或者url地址增加debug=true参数，均可打开调试面板）
//            if (GameConfig.debug || Utils.getQueryString("debug") == "true") Laya.enableDebugPanel();
//            if (GameConfig.physicsDebug && Laya["PhysicsDebugDraw"]) Laya["PhysicsDebugDraw"].enable();
//            if (GameConfig.stat) Stat.show();
//            Laya.alertGlobalError = true;
		}

		private function gameinit():void
		{
            GameInit.instance.init();
            UiManager.instance.loadView("Loadview",null,1);
            //UiManager.instance.loadView("Loadview", null, 1);
			//文档类
            /*
            Laya.timer.once(5000,this,function () {
				console.log("-------");
                PlayerInfoM.instance.setGoldNum(999);
                PlayerInfoM.instance.setPlankNum(999);
                GameEventDispatch.instance.event(GameEvent.GoldRefresh);
				Laya.timer.once(2000,this,function () {
                    console.log("----closePanel Gamemain");
                    UiManager.instance.closePanel("Gamemain");
                    PlayerInfoM.instance.setGoldNum(888);
                    PlayerInfoM.instance.setPlankNum(888);
                    GameEventDispatch.instance.event(GameEvent.GoldRefresh);
                    //UiManager.instance.loadView("Loadview", null, 1);
					Laya.timer.once(5000,this,function () {
                        console.log("----open Gamemain");
                        UiManager.instance.loadView("Gamemain");
                        //UiManager.instance.loadView("Loadview",null,1);
                    })
                })
            })
            */
		}

	}
}