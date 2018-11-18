/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;
	import laya.display.EffectAnimation;
	import ui.Boxlibs_shakeboxUI;

	public class BoxlibsUI extends View {
		public var bmask:Image;
		public var panelbox:Box;
		public var boxlist:List;
		public var leftBtn:Image;
		public var rightBtn:Image;
		public var closeBtn:Image;
		public var stoveImg:Image;
		public var moreGiftBtn:Image;
		public var gameBoxBtn:Image;
		public var openAni:Animation;
		public var shakeBoxImg:Image;
		public var shakeAni:Boxlibs_shakeboxUI;
		public var shakelightAni:Animation;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0},"child":[{"type":"List","props":{"y":181,"x":84,"width":480,"var":"boxlist","spaceX":10,"repeatY":1,"repeatX":2,"height":153},"child":[{"type":"Box","props":{"y":0,"x":0,"width":235,"renderType":"render","height":152},"child":[{"type":"Image","props":{"y":0,"x":-2,"width":237,"skin":"ui/boxlibs/di4.png","sizeGrid":"29,46,38,37","height":152}},{"type":"Image","props":{"y":37,"x":20,"width":80,"skin":"ui/common_ex/giftBtn.png","name":"giftImg","height":80}},{"type":"Image","props":{"y":104,"x":119,"width":73,"skin":"ui/boxlibs/di1.png","sizeGrid":"11,14,12,13","height":30}},{"type":"Image","props":{"y":14,"x":118,"width":95,"skin":"ui/boxlibs/ceil1.png","sizeGrid":"19,24,25,19","height":61}},{"type":"Text","props":{"y":106,"x":196,"width":27,"text":"个","strokeColor":"#224882","stroke":5,"height":26,"fontSize":23,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":107,"x":126,"width":60,"text":"0000","strokeColor":"#224882","stroke":5,"name":"giftnum","height":24,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Text","props":{"y":26,"x":131,"width":73,"text":"LV.1","strokeColor":"#224882","stroke":5,"name":"giftlv","height":36,"fontSize":35,"font":"SimHei","color":"#ffffff","bold":true}}]}]},{"type":"Image","props":{"y":218,"x":23,"width":50,"var":"leftBtn","skin":"ui/common_ex/friendRank_close.png","height":80}},{"type":"Image","props":{"y":218,"x":574,"width":50,"var":"rightBtn","skin":"ui/common_ex/friendRank_open.png","height":80}},{"type":"Image","props":{"y":43,"x":534,"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":2,"height":107,"bottom":986}},{"type":"Image","props":{"y":350,"x":93,"width":463,"skin":"ui/boxlibs/di3.png","height":631}},{"type":"Image","props":{"y":486,"x":236,"width":184,"var":"stoveImg","skin":"ui/boxlibs/di2.png","height":185}},{"type":"Image","props":{"width":225,"skin":"ui/boxlibs/kuang1.png","height":225,"centerY":10,"centerX":5}},{"type":"Image","props":{"y":896,"x":346,"width":150,"var":"moreGiftBtn","skin":"ui/boxlibs/btn1.png","height":63}},{"type":"Image","props":{"y":896,"x":157,"width":149,"var":"gameBoxBtn","skin":"ui/boxlibs/btn2.png","height":64}},{"type":"Animation","props":{"y":417,"x":160,"width":228,"visible":false,"var":"openAni","source":"Boxlibs_openbox.ani","scaleY":1.5,"scaleX":1.5,"index":1,"height":215,"autoPlay":false}},{"type":"Image","props":{"y":581,"x":331,"width":120,"visible":false,"var":"shakeBoxImg","skin":"ui/common_ex/giftBtn.png","height":120,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Script","props":{"y":46,"x":45,"var":"shakeAni","runtime":"ui.Boxlibs_shakeboxUI"}}]},{"type":"Animation","props":{"y":486,"x":239,"width":62,"visible":false,"var":"shakelightAni","source":"Boxlibs_shakelight.ani","scaleY":1.5,"scaleX":3,"interval":100,"height":125,"autoPlay":false}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			View.regComponent("EffectAnimation",EffectAnimation);
			View.regComponent("ui.Boxlibs_shakeboxUI",Boxlibs_shakeboxUI);
			super.createChildren();
			createView(uiView);

		}

	}
}