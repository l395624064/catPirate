/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class TimeGiftUI extends View {
		public var bmask:Image;
		public var panelbox:Box;
		public var closeBtn:Image;
		public var boxlv:Text;
		public var timetxt:Text;
		public var lvupBtn:Image;
		public var getBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":339,"x":94,"skin":"ui/timegift/bg1.png"}},{"type":"Image","props":{"width":77,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":58,"height":77,"bottom":783}},{"type":"Image","props":{"y":262,"x":100,"width":80,"skin":"ui/common_ex/giftBtn.png","height":80}},{"type":"Text","props":{"y":470,"x":137,"width":141,"text":"剩余时间:","strokeColor":"#224882","stroke":5,"height":30,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":353,"x":232,"wordWrap":true,"width":266,"text":"每次升级将永久提高礼包等级(最高LV5)","strokeColor":"#224882","stroke":5,"height":23,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":614,"x":386,"wordWrap":true,"width":160,"text":"获得的礼包会自动放入宝箱库中","strokeColor":"#224882","stroke":5,"height":39,"fontSize":22,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":355,"x":128,"width":79,"var":"boxlv","text":"LV.1","strokeColor":"#224882","stroke":5,"height":36,"fontSize":35,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":530,"x":136,"width":204,"var":"timetxt","text":"00:00:00","strokeColor":"#224882","stroke":5,"height":30,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Image","props":{"y":452,"x":387,"var":"lvupBtn","skin":"ui/timegift/btn0.png"}},{"type":"Image","props":{"y":518,"x":388,"var":"getBtn","skin":"ui/timegift/btn2.png"}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}