/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class GameloadUI extends View {
		public var loadBar:ProgressBar;
		public var loadHead:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"x":0,"width":640,"height":1136},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/loadview/loadview_0.png","height":1136}},{"type":"ProgressBar","props":{"width":433,"var":"loadBar","value":0.5,"skin":"ui/loadview/progress.png","height":20,"centerX":0,"bottom":63}},{"type":"Image","props":{"y":1051,"x":104,"width":432,"skin":"ui/loadview/progress-di.png","sizeGrid":"7,20,8,14","height":23}},{"type":"Image","props":{"y":1056,"width":68,"var":"loadHead","skin":"ui/loadview/progress-bar1.png","pivotY":61,"pivotX":1,"height":59,"centerX":0}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}