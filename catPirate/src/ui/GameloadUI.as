/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class GameloadUI extends View {
		public var panelbox:Box;
		public var loadBar:ProgressBar;
		public var loadHead:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"x":0,"width":640,"height":1136},"child":[{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/loadview/loadview_0.png","sizeGrid":"2,2,2,2","height":1136}},{"type":"Box","props":{"width":641,"height":120,"centerY":450,"centerX":0},"child":[{"type":"ProgressBar","props":{"width":433,"var":"loadBar","value":0,"skin":"ui/loadview/progress.png","height":20,"centerX":27,"bottom":42}},{"type":"Image","props":{"y":56,"x":130,"width":432,"skin":"ui/loadview/progress-di.png","sizeGrid":"7,20,8,14","height":23}},{"type":"Image","props":{"y":61,"x":81,"width":68,"var":"loadHead","skin":"ui/loadview/progress-bar1.png","pivotY":61,"pivotX":1,"height":59}},{"type":"Text","props":{"y":99,"x":138,"width":399,"text":"游戏版本号","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":32,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Text","props":{"y":137,"x":138,"width":399,"text":"Powered by LayaAir Engine","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":32,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}}]}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}