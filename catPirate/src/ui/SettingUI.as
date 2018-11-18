/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class SettingUI extends View {
		public var bmask:Image;
		public var panelbox:Box;
		public var closeBtn:Image;
		public var shakeBtn:Button;
		public var soundBtn:Button;
		public var musicBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":324,"x":120,"width":404,"skin":"ui/setting/setting_di33.png","height":272}},{"type":"Image","props":{"width":77,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":96,"height":77,"bottom":766}},{"type":"Button","props":{"y":414,"x":395,"var":"shakeBtn","stateNum":2,"skin":"ui/setting/btn_setting1.png"}},{"type":"Button","props":{"y":417,"x":296,"var":"soundBtn","stateNum":2,"skin":"ui/setting/btn_setting2.png"}},{"type":"Button","props":{"y":405,"x":204,"var":"musicBtn","stateNum":2,"skin":"ui/setting/btn_setting3.png"}},{"type":"Text","props":{"y":492,"x":192,"wordWrap":true,"width":68,"text":"音乐","strokeColor":"#ffffff","stroke":5,"height":31,"fontSize":30,"font":"SimHei","color":"#fb8200","bold":true}},{"type":"Text","props":{"y":492,"x":292,"wordWrap":true,"width":68,"text":"音效","strokeColor":"#ffffff","stroke":5,"height":31,"fontSize":30,"font":"SimHei","color":"#fb8200","bold":true}},{"type":"Text","props":{"y":492,"x":392,"wordWrap":true,"width":68,"text":"震动","strokeColor":"#ffffff","stroke":5,"height":31,"fontSize":30,"font":"SimHei","color":"#fb8200","bold":true}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}