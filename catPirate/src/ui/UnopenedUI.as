/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class UnopenedUI extends View {
		public var bmask:Image;
		public var panelbox:Box;
		public var tipImg:Image;
		public var tipFont:Text;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":400,"height":500},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"y":0,"x":0,"width":406,"var":"panelbox","height":504},"child":[{"type":"Image","props":{"y":116,"x":100,"width":174,"var":"tipImg","skin":"ui/common_img/notopen.png","height":174,"centerY":0,"centerX":0,"anchorY":0.5,"anchorX":0.5}},{"type":"Text","props":{"y":382,"x":203,"width":215,"var":"tipFont","text":"暂未开放","strokeColor":"#ffffff","stroke":6,"pivotY":1,"pivotX":105,"height":54,"fontSize":50,"font":"SimHei","color":"#0999f9","bold":true}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}