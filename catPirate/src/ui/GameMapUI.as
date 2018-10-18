/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class GameMapUI extends View {
		public var mapPanel:Panel;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":20,"x":20,"width":1080,"skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Image","props":{"width":610,"skin":"ui/common_ex/bei.png","sizeGrid":"23,25,30,23","height":745,"centerY":-24,"centerX":0},"child":[{"type":"Panel","props":{"y":13,"x":13,"width":585,"var":"mapPanel","height":719}}]},{"type":"Image","props":{"y":0,"x":536,"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","height":107}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}