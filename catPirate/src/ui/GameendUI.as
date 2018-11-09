/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class GameendUI extends View {
		public var bmask:Image;
		public var waterbox:Box;
		public var water_floor:Image;
		public var water_ceil:Image;
		public var waterbox_sp:Sprite;
		public var waterpipe:Box;
		public var waterpipe_floor:Image;
		public var waterpipe_ceil:Image;
		public var roleImg:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":70,"x":70,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":643,"height":1130,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":0,"x":0,"width":639,"skin":"ui/common_ex/jbbg.png","sizeGrid":"24,19,34,12","height":1129}},{"type":"Box","props":{"y":220,"x":87,"width":300,"var":"waterbox","height":530},"child":[{"type":"Image","props":{"y":450,"x":0,"width":300,"var":"water_floor","skin":"ui/gameend/xc.png","sizeGrid":"10,2,10,2","height":80}},{"type":"Image","props":{"y":440,"x":0,"width":300,"var":"water_ceil","skin":"ui/gameend/sc.png","sizeGrid":"2,2,2,2","height":10}},{"type":"Sprite","props":{"y":0,"x":0,"width":300,"var":"waterbox_sp","height":530}}]},{"type":"Box","props":{"y":221,"x":486,"width":50,"var":"waterpipe","height":530},"child":[{"type":"Image","props":{"y":450,"x":0,"width":50,"var":"waterpipe_floor","skin":"ui/gameend/xc.png","sizeGrid":"10,2,10,2","height":80}},{"type":"Image","props":{"y":440,"x":0,"width":50,"var":"waterpipe_ceil","skin":"ui/gameend/sc.png","sizeGrid":"2,2,2,2","height":10}},{"type":"Image","props":{"y":387,"x":14,"width":25,"skin":"ui/common_ef/star.png","name":"star5","height":25}},{"type":"Image","props":{"y":292,"x":6,"width":40,"skin":"ui/common_ef/star.png","name":"star4","height":39}},{"type":"Image","props":{"y":186,"x":1,"width":51,"skin":"ui/common_ef/star.png","name":"star3","height":50}},{"type":"Image","props":{"y":62,"x":-8,"width":69,"skin":"ui/common_ef/star.png","name":"star2","height":68}},{"type":"Image","props":{"y":14,"x":24,"width":119,"skin":"ui/common_ef/star.png","pivotY":118,"pivotX":60,"name":"star1","height":116}}]},{"type":"Image","props":{"y":34,"x":428,"skin":"ui/gameend/t.png"}},{"type":"Image","props":{"y":-96,"x":-1,"skin":"ui/gameend/ccs.png"}},{"type":"Image","props":{"y":961,"x":511,"width":175,"var":"roleImg","skin":"ui/common/shipsoldier_1.png","pivotY":34,"pivotX":89,"height":197}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}