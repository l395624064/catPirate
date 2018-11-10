/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class SettingUI extends View {
		public var bmask:Image;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":90,"x":90,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"y":10,"x":10,"width":647,"height":1136,"centerY":0,"centerX":0},"child":[{"type":"Text","props":{"y":614,"x":386,"wordWrap":true,"width":160,"text":"获得的礼包会自动放入宝箱库中","strokeColor":"#224882","stroke":5,"height":39,"fontSize":22,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Image","props":{"y":324,"x":120,"width":404,"skin":"ui/setting/di1.png","height":272}},{"type":"Image","props":{"width":77,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":77,"height":77,"bottom":794}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}