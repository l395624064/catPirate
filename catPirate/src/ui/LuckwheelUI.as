/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class LuckwheelUI extends View {
		public var bmask:Image;
		public var panelbox:Box;
		public var maskBox:Box;
		public var explainBtn:Button;
		public var shareBtn:Button;
		public var startBtn:Button;
		public var closeBtn:Image;
		public var rollnum_txt:Text;
		public var explainBox:Box;
		public var explainCloseBtn:Image;
		public var explainlist:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":402,"x":119,"width":392,"skin":"ui/luckwheel/z.png","sizeGrid":"10,10,10,10","height":334}},{"type":"Box","props":{"y":333,"x":106,"width":447,"var":"maskBox","height":480},"child":[{"type":"Image","props":{"y":87,"x":26,"width":368,"skin":"ui/luckwheel/mask1.png","sizeGrid":"10,10,10,10","height":300}},{"type":"Image","props":{"y":8,"x":56,"width":80,"skin":"ui/luckwheel/b.png","sizeGrid":"5,5,5,5","height":400}},{"type":"Image","props":{"y":8,"x":171,"width":80,"skin":"ui/luckwheel/b.png","sizeGrid":"5,5,5,5","height":400}},{"type":"Image","props":{"y":8,"x":285,"width":80,"skin":"ui/luckwheel/b.png","sizeGrid":"5,5,5,5","height":400}},{"type":"Box","props":{"y":8,"x":56,"width":80,"name":"box0","height":400},"child":[{"type":"Image","props":{"y":0,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item4","height":80}},{"type":"Image","props":{"y":80,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item3","height":80}},{"type":"Image","props":{"y":160,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item2","height":80}},{"type":"Image","props":{"y":240,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item1","height":80}},{"type":"Image","props":{"y":320,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item0","height":80}}]},{"type":"Box","props":{"y":8,"x":171,"name":"box1"},"child":[{"type":"Image","props":{"width":80,"skin":"ui/common_ef/luck4.png","name":"item4","height":80}},{"type":"Image","props":{"y":80,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item3","height":80}},{"type":"Image","props":{"y":160,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item2","height":80}},{"type":"Image","props":{"y":240,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item1","height":80}},{"type":"Image","props":{"y":320,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item0","height":80}}]},{"type":"Box","props":{"y":8,"x":285,"name":"box2"},"child":[{"type":"Image","props":{"width":80,"skin":"ui/common_ef/luck4.png","name":"item4","height":80}},{"type":"Image","props":{"y":80,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item3","height":80}},{"type":"Image","props":{"y":160,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item2","height":80}},{"type":"Image","props":{"y":240,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item1","height":80}},{"type":"Image","props":{"y":320,"x":0,"width":80,"skin":"ui/common_ef/luck4.png","name":"item0","height":80}}]},{"type":"Image","props":{"y":168,"x":15,"width":388,"skin":"ui/common_ex/blank.png","height":80}}]},{"type":"Image","props":{"y":297,"x":50,"width":520,"skin":"ui/luckwheel/m1.png","height":596}},{"type":"Image","props":{"y":334,"x":174,"width":336,"skin":"ui/luckwheel/gun dong.png","height":24}},{"type":"Button","props":{"y":317,"x":496,"width":56,"var":"explainBtn","stateNum":2,"skin":"ui/common_ex/btn_wenhao.png","height":56}},{"type":"Button","props":{"y":745,"x":354,"width":149,"var":"shareBtn","stateNum":1,"skin":"ui/common_ex/btn_s_y.png","labelStrokeColor":"#393838","labelStroke":7,"labelSize":25,"labelFont":"SimHei","labelColors":"#ffffff","label":"分享加次数","height":100}},{"type":"Button","props":{"y":745,"x":137,"width":149,"var":"startBtn","stateNum":1,"skin":"ui/common_ex/btn_s_r.png","labelStrokeColor":"#393838","labelStroke":7,"labelSize":30,"labelFont":"SimHei","labelColors":"#ffffff","label":"开始","height":100}},{"type":"Image","props":{"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":4,"height":107,"bottom":818}},{"type":"Text","props":{"y":338,"x":365,"width":40,"var":"rollnum_txt","text":"1","strokeColor":"#f110f1","stroke":5,"height":19,"fontSize":15,"font":"SimHei","color":"#ffffff","align":"center"}},{"type":"Text","props":{"y":338,"x":257,"width":109,"text":"今日剩余次数:","strokeColor":"#f110f1","stroke":4,"height":19,"fontSize":15,"font":"SimHei","color":"#ffffff","align":"center"}},{"type":"Box","props":{"width":642,"visible":false,"var":"explainBox","height":1136,"centerY":0,"centerX":-1},"child":[{"type":"Image","props":{"y":0,"x":0,"width":642,"skin":"ui/common_ex/blank.png","height":1136}},{"type":"Image","props":{"y":245,"width":545,"skin":"ui/common_ex/di2.png","sizeGrid":"25,23,28,26","height":754,"centerX":1}},{"type":"Image","props":{"width":107,"var":"explainCloseBtn","skin":"ui/common_ex/closeBtn.png","right":2,"height":107,"bottom":823}},{"type":"Text","props":{"y":275,"x":210,"width":255,"text":"轮盘规则说明","strokeColor":"#224882","stroke":5,"height":45,"fontSize":40,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":361,"x":89,"width":452,"text":"相同三种图案可获得奖励如下","strokeColor":"#224882","stroke":5,"height":40,"fontSize":30,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"List","props":{"y":434,"x":85,"width":467,"var":"explainlist","spaceY":15,"repeatY":5,"repeatX":1,"renderType":"render","height":536},"child":[{"type":"Box","props":{"y":0,"x":0,"renderType":"render"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":464,"skin":"ui/common_ex/tiao1.png","sizeGrid":"7,17,10,13","height":95}},{"type":"Image","props":{"y":8,"x":18,"skin":"ui/common_ef/luck5.png","name":"popImg"}},{"type":"Text","props":{"y":32,"x":112,"width":49,"text":"*3","strokeColor":"#224882","stroke":5,"height":45,"fontSize":40,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Box","props":{"y":20,"x":321,"name":"award1_box"},"child":[{"type":"Image","props":{"y":17,"x":18,"width":116,"skin":"ui/common_ex/tiaodi.png","sizeGrid":"11,18,10,14","height":36}},{"type":"Image","props":{"width":47,"skin":"ui/common_ef/plank.png","name":"award1_img","height":54}},{"type":"Text","props":{"y":27,"x":48,"width":78,"text":"100000","strokeColor":"#224882","stroke":5,"name":"award1_txt","height":24,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true}}]},{"type":"Box","props":{"y":20,"x":178,"name":"award2_box"},"child":[{"type":"Image","props":{"y":17,"x":18,"width":116,"skin":"ui/common_ex/tiaodi.png","sizeGrid":"11,18,10,14","height":36}},{"type":"Image","props":{"width":47,"skin":"ui/common_ef/gold.png","name":"award2_img","height":54}},{"type":"Text","props":{"y":27,"x":48,"width":78,"text":"100000","strokeColor":"#224882","stroke":5,"name":"award2_txt","height":24,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true}}]}]}]}]}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}