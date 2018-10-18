/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class TipsUI extends View {
		public var bmask:Image;
		public var closeBtn:Image;
		public var sureBtn:Button;
		public var cancelBtn:Button;
		public var tasktxt:Label;
		public var timetxt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":-2,"centerX":0}},{"type":"Image","props":{"y":368,"x":119,"width":428,"skin":"ui/common_ex/bei.png","sizeGrid":"32,24,44,24","height":401}},{"type":"Image","props":{"y":332,"x":480,"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","height":107}},{"type":"Button","props":{"y":663,"x":170,"width":127,"var":"sureBtn","stateNum":1,"skin":"ui/common_ex/btn_s_y.png","height":86},"child":[{"type":"Image","props":{"y":29,"x":39,"skin":"ui/common_ex/confirm.png"}}]},{"type":"Button","props":{"y":662,"x":374,"width":130,"var":"cancelBtn","stateNum":1,"skin":"ui/common_ex/btn_s_g.png","height":87},"child":[{"type":"Image","props":{"y":31,"x":43,"skin":"ui/common_ex/cancel.png"}}]},{"type":"Label","props":{"y":441,"x":177,"width":324,"var":"tasktxt","text":"是否接受此任务","strokeColor":"#000000","stroke":1,"height":156,"fontSize":30,"font":"Microsoft YaHei","color":"#5fb0ea","bold":true,"align":"center"}},{"type":"Label","props":{"y":616,"x":231,"width":220,"var":"timetxt","text":"(剩余X秒)","strokeColor":"#000000","stroke":1,"height":33,"fontSize":25,"font":"Microsoft YaHei","color":"#ffffff","bold":true,"align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}