/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class GameendUI extends View {
		public var bmask:Image;
		public var weightTxt:Text;
		public var waterpipe:Sprite;
		public var closeBtn:Image;
		public var waterbox:Box;
		public var water_floor:Image;
		public var water_ceil:Image;
		public var waterbox_sp:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":70,"x":70,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":643,"height":1130,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":0,"x":0,"width":639,"skin":"ui/common_ex/jbbg.png","sizeGrid":"24,19,34,12","height":1129}},{"type":"Text","props":{"y":949,"x":36,"width":225,"var":"weightTxt","text":"0000.0kg","strokeColor":"#224882","stroke":10,"height":63,"fontSize":40,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Sprite","props":{"y":185,"x":429,"width":56,"var":"waterpipe","height":650},"child":[{"type":"Rect","props":{"y":479,"x":0,"width":55,"name":"water_floor","lineWidth":1,"height":170,"fillColor":"#2b9ed4"}},{"type":"Rect","props":{"y":469,"x":0,"width":55,"name":"water_ceil","lineWidth":1,"height":10,"fillColor":"#42c2ff"}}]},{"type":"Image","props":{"y":-9,"x":-1,"skin":"ui/gameend/ccs.png"}},{"type":"Image","props":{"y":-1,"x":1,"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":533,"height":107,"bottom":1027}},{"type":"Box","props":{"y":206,"x":27,"width":300,"var":"waterbox","height":480},"child":[{"type":"Image","props":{"y":445,"x":0,"width":300,"var":"water_floor","skin":"ui/common_ex/water2.png","sizeGrid":"10,10,10,10","height":35}},{"type":"Image","props":{"y":435,"x":0,"width":300,"var":"water_ceil","skin":"ui/common_ex/water1.png","sizeGrid":"10,10,10,10","height":10}},{"type":"Sprite","props":{"y":0,"x":0,"width":300,"var":"waterbox_sp","height":480}}]}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}