/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class WaitUI extends View {
		public var ani1:FrameAnimation;
		public var bmask:Image;
		public var aniImg:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":342,"height":549,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":261.5,"x":159.5,"width":139,"var":"aniImg","skin":"ui/common_img/wait.png","rotation":0,"height":139,"centerY":0,"centerX":0,"anchorY":0.5,"anchorX":0.5},"compId":4},{"type":"Text","props":{"y":394.5,"x":77.5,"width":178,"text":"Loading...","strokeColor":"#ffffff","stroke":6,"height":51,"fontSize":50,"font":"SimHei","color":"#0999f9","bold":true}}]}],"animations":[{"nodes":[{"target":4,"keyframes":{"rotation":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":4,"key":"rotation","index":0},{"value":340,"tweenMethod":"linearNone","tween":true,"target":4,"key":"rotation","index":15}]}}],"name":"ani1","id":1,"frameRate":24,"action":2}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}