/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class LuckwheelUI extends View {
		public var bmask:Image;
		public var maskBox:Box;
		public var shareBtn:Button;
		public var startBtn:Button;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":70,"x":70,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"y":0,"x":0,"width":644,"height":1135},"child":[{"type":"Image","props":{"y":402,"x":119,"width":392,"skin":"ui/luckwheel/z.png","sizeGrid":"10,10,10,10","height":334}},{"type":"Box","props":{"y":333,"x":106,"width":447,"var":"maskBox","height":480},"child":[{"type":"Image","props":{"y":87,"x":26,"width":368,"skin":"ui/luckwheel/mask1.png","sizeGrid":"10,10,10,10","height":300}},{"type":"Image","props":{"y":8,"x":56,"width":80,"skin":"ui/luckwheel/b.png","sizeGrid":"5,5,5,5","height":400}},{"type":"Image","props":{"y":8,"x":171,"width":80,"skin":"ui/luckwheel/b.png","sizeGrid":"5,5,5,5","height":400}},{"type":"Image","props":{"y":8,"x":285,"width":80,"skin":"ui/luckwheel/b.png","sizeGrid":"5,5,5,5","height":400}},{"type":"Box","props":{"y":8,"x":56,"width":80,"name":"box0","height":400},"child":[{"type":"Image","props":{"y":0,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item4","height":80}},{"type":"Image","props":{"y":80,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item3","height":80}},{"type":"Image","props":{"y":160,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item2","height":80}},{"type":"Image","props":{"y":240,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item1","height":80}},{"type":"Image","props":{"y":320,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item0","height":80}}]},{"type":"Box","props":{"y":8,"x":171,"name":"box1"},"child":[{"type":"Image","props":{"width":80,"skin":"ui/common_ef/luck4.png","name":"item4","height":80}},{"type":"Image","props":{"y":80,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item3","height":80}},{"type":"Image","props":{"y":160,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item2","height":80}},{"type":"Image","props":{"y":240,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item1","height":80}},{"type":"Image","props":{"y":320,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item0","height":80}}]},{"type":"Box","props":{"y":8,"x":285,"name":"box2"},"child":[{"type":"Image","props":{"width":80,"skin":"ui/common_ef/luck4.png","name":"item4","height":80}},{"type":"Image","props":{"y":80,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item3","height":80}},{"type":"Image","props":{"y":160,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item2","height":80}},{"type":"Image","props":{"y":240,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item1","height":80}},{"type":"Image","props":{"y":320,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item0","height":80}}]},{"type":"Image","props":{"y":168,"x":15,"width":388,"skin":"ui/common_ex/blank.png","height":80}}]},{"type":"Image","props":{"y":297,"x":50,"width":520,"skin":"ui/luckwheel/m1.png","height":596}},{"type":"Image","props":{"y":334,"x":174,"width":336,"skin":"ui/luckwheel/gun dong.png","height":24}},{"type":"Button","props":{"y":317,"x":496,"width":56,"stateNum":2,"skin":"ui/common_ex/btn_wenhao.png","height":56}},{"type":"Button","props":{"y":745,"x":354,"width":149,"var":"shareBtn","stateNum":1,"skin":"ui/common_ex/btn_s_y.png","labelStrokeColor":"#393838","labelStroke":7,"labelSize":28,"labelFont":"SimHei","labelColors":"#ffffff","label":"获得次数","height":100}},{"type":"Button","props":{"y":745,"x":137,"width":149,"var":"startBtn","stateNum":1,"skin":"ui/common_ex/btn_s_r.png","labelStrokeColor":"#393838","labelStroke":7,"labelSize":30,"labelFont":"SimHei","labelColors":"#ffffff","label":"开始","height":100}},{"type":"Image","props":{"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":4,"height":107,"bottom":818}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}