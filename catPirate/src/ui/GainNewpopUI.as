/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class GainNewpopUI extends View {
		public var ani1:FrameAnimation;
		public var bmask:Image;
		public var popImg:Image;
		public var popname:Text;
		public var content:Text;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":10,"x":10,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"y":10,"x":10,"width":342,"height":549,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":296,"x":171,"skin":"ui/common_ef/beib_di5.png","scaleY":0.9,"scaleX":0.9,"rotation":0,"anchorY":0.5,"anchorX":0.5},"compId":6},{"type":"Image","props":{"y":286,"x":177,"width":193,"var":"popImg","height":193,"anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":535,"x":-31,"width":413,"skin":"ui/common_ex/bg_select.png","sizeGrid":"19,44,38,42","height":213}},{"type":"Text","props":{"y":545,"x":-21,"width":389,"var":"popname","text":"获得新道具获得新","strokeColor":"#ffffff","stroke":6,"height":51,"fontSize":48,"font":"SimHei","color":"#0999f9","bold":true,"align":"center"}},{"type":"Text","props":{"y":607,"x":-23,"wordWrap":true,"width":398,"var":"content","text":"道具说明道具说明道具说明道具说明道具说明道具说明道具说明道具说明道具说明道具说明道具说明道具说明","strokeColor":"#82742a","stroke":6,"height":127,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}}]}],"animations":[{"nodes":[{"target":6,"keyframes":{"scaleY":[{"value":0.9,"tweenMethod":"linearNone","tween":true,"target":6,"key":"scaleY","index":0},{"value":1.1,"tweenMethod":"linearNone","tween":true,"target":6,"key":"scaleY","index":15},{"value":0.9,"tweenMethod":"linearNone","tween":true,"target":6,"key":"scaleY","index":30}],"scaleX":[{"value":0.9,"tweenMethod":"linearNone","tween":true,"target":6,"key":"scaleX","index":0},{"value":1.1,"tweenMethod":"linearNone","tween":true,"target":6,"key":"scaleX","index":15},{"value":0.9,"tweenMethod":"linearNone","tween":true,"target":6,"key":"scaleX","index":30}],"rotation":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":6,"key":"rotation","index":0},{"value":15,"tweenMethod":"linearNone","tween":true,"target":6,"key":"rotation","index":15},{"value":0,"tweenMethod":"linearNone","tween":true,"target":6,"key":"rotation","index":30}]}}],"name":"ani1","id":1,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}