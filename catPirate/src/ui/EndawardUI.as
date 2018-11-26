/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class EndawardUI extends View {
		public var ani1:FrameAnimation;
		public var bmask:Image;
		public var panelbox:Box;
		public var playertitle:Label;
		public var playerImg:Image;
		public var weightTxt:Label;
		public var backBtn:Button;
		public var shareBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0},"child":[{"type":"Box","props":{"y":542,"x":322,"scaleY":1,"scaleX":1,"centerY":-23,"centerX":0,"anchorY":0.5,"anchorX":0.5,"alpha":1},"compId":29,"child":[{"type":"Image","props":{"width":452,"skin":"ui/common_ex/endtitle.png","height":416}},{"type":"Label","props":{"y":95,"x":101,"width":123,"text":"称号:","strokeColor":"#224882","stroke":10,"rotation":-7,"height":50,"fontSize":50,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Label","props":{"y":157,"x":121,"wordWrap":true,"width":123,"var":"playertitle","text":"钓鱼大师","strokeColor":"#224882","stroke":10,"rotation":-7,"padding":"20,10,10,10","leading":20,"height":166,"fontSize":50,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"},"compId":24},{"type":"Image","props":{"y":154,"x":261,"width":110,"var":"playerImg","skin":"ui/common_ex/ico1.png","skewX":0,"rotation":-8,"height":110},"compId":27}]},{"type":"Box","props":{"y":741,"x":149,"centerY":210,"centerX":1,"alpha":1},"compId":30,"child":[{"type":"Image","props":{"width":407,"skin":"ui/common_ex/d.png","sizeGrid":"27,24,38,22","height":72}},{"type":"Label","props":{"y":10,"x":36,"width":174,"text":"总重量:","strokeColor":"#f90a06","stroke":10,"rotation":0,"height":51,"fontSize":50,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Label","props":{"y":12,"x":231,"width":172,"var":"weightTxt","text":"125kg","strokeColor":"#f90a06","stroke":10,"rotation":0,"height":54,"fontSize":50,"font":"SimHei","color":"#ffffff","bold":true},"compId":26}]},{"type":"Button","props":{"y":847,"x":131,"width":178,"var":"backBtn","stateNum":1,"skin":"ui/common_ex/btn_s_r.png","sizeGrid":"24,27,25,33","labelStrokeColor":"#5d1514","labelStroke":2,"labelSize":35,"labelPadding":"0,0,0,5","labelFont":"SimHei","labelColors":"#ffffff","label":"返回","hitTestPrior":true,"height":72,"alpha":1},"compId":31},{"type":"Button","props":{"y":847,"x":336,"width":178,"var":"shareBtn","stateNum":1,"skin":"ui/common_ex/btn_s_y.png","sizeGrid":"21,18,21,22","labelStrokeColor":"#ffffff","labelStroke":2,"labelSize":32,"labelFont":"SimHei","label":"分享抽好礼","hitTestPrior":true,"height":72,"alpha":1},"compId":33}]}],"animations":[{"nodes":[{"target":30,"keyframes":{"x":[{"value":149,"tweenMethod":"linearNone","tween":true,"target":30,"label":null,"key":"x","index":0},{"value":149,"tweenMethod":"linearNone","tween":true,"target":30,"key":"x","index":5},{"value":149,"tweenMethod":"linearNone","tween":true,"target":30,"label":null,"key":"x","index":11},{"value":149,"tweenMethod":"linearNone","tween":true,"target":30,"label":null,"key":"x","index":13}],"centerY":[{"value":600,"tweenMethod":"linearNone","tween":true,"target":30,"label":null,"key":"centerY","index":0},{"value":600,"tweenMethod":"linearNone","tween":true,"target":30,"key":"centerY","index":5},{"value":190,"tweenMethod":"linearNone","tween":true,"target":30,"label":null,"key":"centerY","index":11},{"value":210,"tweenMethod":"linearNone","tween":true,"target":30,"label":null,"key":"centerY","index":13}],"centerX":[{"value":1,"tweenMethod":"linearNone","tween":true,"target":30,"label":null,"key":"centerX","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":30,"key":"centerX","index":5},{"value":1,"tweenMethod":"linearNone","tween":true,"target":30,"label":null,"key":"centerX","index":11},{"value":1,"tweenMethod":"linearNone","tween":true,"target":30,"label":null,"key":"centerX","index":13}],"alpha":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":30,"key":"alpha","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":30,"key":"alpha","index":11},{"value":1,"tweenMethod":"linearNone","tween":true,"target":30,"label":null,"key":"alpha","index":13}]}},{"target":29,"keyframes":{"x":[{"value":322,"tweenMethod":"linearNone","tween":true,"target":29,"key":"x","index":0},{"value":322,"tweenMethod":"linearNone","tween":true,"target":29,"key":"x","index":6},{"value":322,"tweenMethod":"linearNone","tween":true,"target":29,"label":null,"key":"x","index":8}],"scaleY":[{"value":5,"tweenMethod":"linearNone","tween":true,"target":29,"key":"scaleY","index":0},{"value":0.8,"tweenMethod":"linearNone","tween":true,"target":29,"key":"scaleY","index":6},{"value":1,"tweenMethod":"linearNone","tween":true,"target":29,"label":null,"key":"scaleY","index":8}],"scaleX":[{"value":5,"tweenMethod":"linearNone","tween":true,"target":29,"key":"scaleX","index":0},{"value":0.8,"tweenMethod":"linearNone","tween":true,"target":29,"key":"scaleX","index":6},{"value":1,"tweenMethod":"linearNone","tween":true,"target":29,"label":null,"key":"scaleX","index":8}],"alpha":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":29,"key":"alpha","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":29,"key":"alpha","index":6},{"value":1,"tweenMethod":"linearNone","tween":true,"target":29,"label":null,"key":"alpha","index":8}]}},{"target":26,"keyframes":{"x":[{"value":240,"tweenMethod":"linearNone","tween":true,"target":26,"key":"x","index":0},{"value":231,"tweenMethod":"linearNone","tween":true,"target":26,"key":"x","index":20}],"width":[{"value":135,"tweenMethod":"linearNone","tween":true,"target":26,"key":"width","index":0},{"value":172,"tweenMethod":"linearNone","tween":true,"target":26,"key":"width","index":20}],"var":[{"value":"weightTxt","tweenMethod":"linearNone","tween":false,"target":26,"key":"var","index":0},{"value":"weightTxt","tweenMethod":"linearNone","tween":false,"target":26,"key":"var","index":20}],"height":[{"value":60,"tweenMethod":"linearNone","tween":true,"target":26,"key":"height","index":0},{"value":54,"tweenMethod":"linearNone","tween":true,"target":26,"key":"height","index":20}]}},{"target":27,"keyframes":{"var":[{"value":"playerImg","tweenMethod":"linearNone","tween":false,"target":27,"key":"var","index":0},{"value":"playerImg","tweenMethod":"linearNone","tween":false,"target":27,"key":"var","index":20}]}},{"target":24,"keyframes":{"var":[{"value":"playertitle","tweenMethod":"linearNone","tween":false,"target":24,"key":"var","index":0},{"value":"playertitle","tweenMethod":"linearNone","tween":false,"target":24,"key":"var","index":20}]}},{"target":31,"keyframes":{"y":[{"value":847,"tweenMethod":"linearNone","tween":true,"target":31,"key":"y","index":0},{"value":854,"tweenMethod":"linearNone","tween":true,"target":31,"key":"y","index":12},{"value":826,"tweenMethod":"linearNone","tween":true,"target":31,"key":"y","index":18},{"value":832,"tweenMethod":"linearNone","tween":true,"target":31,"key":"y","index":20}],"x":[{"value":131,"tweenMethod":"linearNone","tween":true,"target":31,"key":"x","index":0},{"value":131,"tweenMethod":"linearNone","tween":true,"target":31,"label":null,"key":"x","index":12},{"value":131,"tweenMethod":"linearNone","tween":true,"target":31,"key":"x","index":18},{"value":131,"tweenMethod":"linearNone","tween":true,"target":31,"label":null,"key":"x","index":20}],"alpha":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":31,"key":"alpha","index":0},{"value":0,"tweenMethod":"linearNone","tween":true,"target":31,"key":"alpha","index":12},{"value":1,"tweenMethod":"linearNone","tween":true,"target":31,"key":"alpha","index":18},{"value":1,"tweenMethod":"linearNone","tween":true,"target":31,"label":null,"key":"alpha","index":20}]}},{"target":33,"keyframes":{"y":[{"value":847,"tweenMethod":"linearNone","tween":true,"target":33,"key":"y","index":0},{"value":853,"tweenMethod":"linearNone","tween":true,"target":33,"key":"y","index":13},{"value":826,"tweenMethod":"linearNone","tween":true,"target":33,"key":"y","index":19},{"value":832,"tweenMethod":"linearNone","tween":true,"target":33,"key":"y","index":21}],"x":[{"value":336,"tweenMethod":"linearNone","tween":true,"target":33,"key":"x","index":0},{"value":336,"tweenMethod":"linearNone","tween":true,"target":33,"label":null,"key":"x","index":13},{"value":336,"tweenMethod":"linearNone","tween":true,"target":33,"key":"x","index":19},{"value":336,"tweenMethod":"linearNone","tween":true,"target":33,"label":null,"key":"x","index":21}],"alpha":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":33,"key":"alpha","index":0},{"value":0,"tweenMethod":"linearNone","tween":true,"target":33,"key":"alpha","index":13},{"value":1,"tweenMethod":"linearNone","tween":true,"target":33,"key":"alpha","index":19},{"value":1,"tweenMethod":"linearNone","tween":true,"target":33,"label":null,"key":"alpha","index":21}]}}],"name":"ani1","id":1,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}