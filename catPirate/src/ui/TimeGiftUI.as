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
		public var getBtn:Button;
		public var lvupBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":339,"x":94,"skin":"ui/timegift/bg1.png"}},{"type":"Image","props":{"width":77,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":58,"height":77,"bottom":783}},{"type":"Image","props":{"y":262,"x":100,"width":80,"skin":"ui/common_ex/giftBtn.png","height":80}},{"type":"Text","props":{"y":470,"x":137,"width":141,"text":"剩余时间:","strokeColor":"#224882","stroke":5,"height":30,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":353,"x":232,"wordWrap":true,"width":266,"text":"升级礼包后,将有概率永久提升礼包等级(最高LV5)","strokeColor":"#224882","stroke":5,"height":23,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":570,"x":107,"wordWrap":true,"width":268,"text":"获得的礼包会自动放入宝箱库中","strokeColor":"#224882","stroke":5,"height":16,"fontSize":15,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Text","props":{"y":355,"x":128,"width":79,"var":"boxlv","text":"LV.1","strokeColor":"#224882","stroke":5,"height":36,"fontSize":35,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":530,"x":136,"width":204,"var":"timetxt","text":"00:00:00","strokeColor":"#224882","stroke":5,"height":30,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Button","props":{"y":516,"x":386,"width":125,"var":"getBtn","stateNum":1,"skin":"ui/common_ex/btn_s_r.png","labelStrokeColor":"#393838","labelStroke":7,"labelSize":22,"labelFont":"SimHei","labelColors":"#ffffff","label":"分享好友","height":84}},{"type":"Button","props":{"y":434,"x":387,"width":126,"var":"lvupBtn","stateNum":1,"skin":"ui/common_ex/btn_s_y.png","labelStrokeColor":"#393838","labelStroke":5,"labelSize":23,"labelFont":"SimHei","labelColors":"#ffffff","label":"免费升级","height":87},"child":[{"type":"Image","props":{"y":28,"x":-54,"width":52,"skin":"ui/common_ex/video-2.png","height":33}},{"type":"Text","props":{"y":4,"x":-14,"wordWrap":true,"width":156,"text":"看视频/免费升级礼包","strokeColor":"#224882","stroke":3,"height":12,"fontSize":12,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}}]}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}