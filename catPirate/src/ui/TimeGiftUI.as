/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class TimeGiftUI extends View {
		public var bmask:Image;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":80,"x":80,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":647,"height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":477,"width":268,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":123,"centerX":-89}},{"type":"Image","props":{"y":486,"x":121,"width":174,"skin":"ui/common_ex/p0.png","sizeGrid":"9,12,10,11","height":44}},{"type":"Image","props":{"y":478,"x":382,"width":159,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":123,"centerX":138}},{"type":"Image","props":{"y":544,"x":121,"width":235,"skin":"ui/common_ex/p0.png","sizeGrid":"9,12,10,11","height":44}},{"type":"Image","props":{"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":39,"height":107,"bottom":720}},{"type":"Image","props":{"y":299,"x":89,"width":106,"skin":"ui/common_ex/giftBtn.png","height":117}},{"type":"Image","props":{"y":414,"width":451,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":56,"centerX":-5}},{"type":"Button","props":{"y":540,"x":395,"width":130,"stateNum":1,"skin":"ui/common_ex/btn_s_r.png","sizeGrid":"24,27,25,33","name":"buyBtn","labelStrokeColor":"#5d1514","labelStroke":2,"labelSize":23,"labelPadding":"0,0,0,5","labelFont":"SimHei","labelColors":"#ffffff","label":"一键获取","hitTestPrior":true,"height":63}},{"type":"Button","props":{"y":478,"x":395,"width":130,"stateNum":1,"skin":"ui/common_ex/btn_s_y.png","sizeGrid":"24,27,25,33","name":"buyBtn","labelStrokeColor":"#5d1514","labelStroke":2,"labelSize":23,"labelPadding":"0,0,0,5","labelFont":"SimHei","labelColors":"#ffffff","label":"升级礼包","hitTestPrior":true,"height":63}},{"type":"Text","props":{"y":493,"x":142,"width":141,"text":"剩余时间:","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":30,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":425,"x":118,"width":118,"text":"LV.1","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":36,"fontSize":35,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":423,"x":264,"wordWrap":true,"width":266,"text":"每次升级将永久提高礼包等级(最高LV5)","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":23,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":550,"x":139,"width":204,"text":"00:00:00","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":30,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Text","props":{"y":612,"x":399,"wordWrap":true,"width":160,"text":"获得的礼包会自动放入宝箱库中","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":39,"fontSize":22,"font":"SimHei","color":"#ffffff","bold":true}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}