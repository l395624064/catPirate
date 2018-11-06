/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class BoxlibsUI extends View {
		public var bmask:Image;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":90,"x":90,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":647,"height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":357,"width":491,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":519,"centerX":-4}},{"type":"Image","props":{"y":160,"x":3,"width":641,"skin":"ui/common_ex/jbbg.png","sizeGrid":"28,20,29,20","height":193}},{"type":"List","props":{"y":181,"x":84,"width":489,"spaceX":10,"repeatY":1,"repeatX":2,"height":153},"child":[{"type":"Box","props":{"y":0,"x":0,"renderType":"render"},"child":[{"type":"Image","props":{"width":236,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":151}},{"type":"Image","props":{"y":95,"x":133,"width":87,"skin":"ui/common_ex/p0.png","sizeGrid":"9,12,10,11","height":44}},{"type":"Image","props":{"y":19,"x":12,"width":106,"skin":"ui/common_ex/giftBtn.png","height":117}},{"type":"Text","props":{"y":60,"x":137,"width":74,"text":"数量:","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":30,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":101,"x":142,"width":66,"text":"0000","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":30,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":18,"x":137,"width":74,"text":"LV.1","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":30,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true}}]}]},{"type":"Image","props":{"y":212,"x":11,"width":68,"skin":"ui/common_ex/friendRank_close.png","height":102}},{"type":"Image","props":{"y":214,"x":571,"width":66,"skin":"ui/common_ex/friendRank_open.png","height":100}},{"type":"Image","props":{"y":492,"width":242,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":219,"centerX":-2}},{"type":"Image","props":{"y":509,"x":215,"width":215,"skin":"ui/common_ex/p0.png","sizeGrid":"9,12,10,11","height":187}},{"type":"Text","props":{"y":755,"x":183,"width":290,"text":"拖拽至此处打开宝箱","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":32,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Image","props":{"y":43,"x":534,"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":2,"height":107,"bottom":986}},{"type":"Image","props":{"y":901,"width":463,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":123,"centerX":1}},{"type":"Button","props":{"y":924,"x":372,"width":162,"stateNum":1,"skin":"ui/common_ex/btn_s_r.png","sizeGrid":"24,27,25,33","name":"buyBtn","labelStrokeColor":"#5d1514","labelStroke":2,"labelSize":30,"labelPadding":"0,0,0,5","labelFont":"SimHei","labelColors":"#ffffff","label":"更多礼包","hitTestPrior":true,"height":79}},{"type":"Button","props":{"y":923,"x":113,"width":162,"stateNum":1,"skin":"ui/common_ex/btn_s_y.png","sizeGrid":"24,27,25,33","name":"buyBtn","labelStrokeColor":"#5d1514","labelStroke":2,"labelSize":30,"labelPadding":"0,0,0,5","labelFont":"SimHei","labelColors":"#ffffff","label":"游戏盒子","hitTestPrior":true,"height":79}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}