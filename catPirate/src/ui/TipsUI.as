/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class TipsUI extends View {
		public var bmask:Image;
		public var panelbox:Box;
		public var closeBtn:Image;
		public var confirmBtn:Button;
		public var cancelBtn:Button;
		public var contenttxt:Label;
		public var timetxt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0},"child":[{"type":"Box","props":{"y":350,"x":71,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":36,"x":30,"width":428,"skin":"ui/common_ex/word-di.png","sizeGrid":"32,24,44,24","height":401}},{"type":"Image","props":{"y":12,"x":417,"width":75,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","height":75}},{"type":"Button","props":{"y":331,"x":81,"width":127,"var":"confirmBtn","stateNum":1,"skin":"ui/common_ex/btn_s_y.png","height":86},"child":[{"type":"Image","props":{"y":29,"x":39,"skin":"ui/common_ex/confirm.png"}}]},{"type":"Button","props":{"y":330,"x":285,"width":130,"var":"cancelBtn","stateNum":1,"skin":"ui/common_ex/btn_s_g.png","height":87},"child":[{"type":"Image","props":{"y":31,"x":43,"skin":"ui/common_ex/cancel.png"}}]},{"type":"Label","props":{"y":109,"x":88,"wordWrap":true,"width":324,"var":"contenttxt","text":"是否接受此任务","strokeColor":"#313131","stroke":5,"height":156,"fontSize":30,"font":"Microsoft YaHei","color":"#eada2b","bold":true,"align":"center"}},{"type":"Label","props":{"y":284,"x":135,"width":220,"var":"timetxt","text":"(剩余X秒)","strokeColor":"#2b2d2f","stroke":1,"height":33,"fontSize":25,"font":"Microsoft YaHei","color":"#e2221f","bold":true,"align":"center"}}]}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}