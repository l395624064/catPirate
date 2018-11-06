/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class FriendRankUI extends View {
		public var bmask:Image;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":20,"x":20,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"y":10,"x":10,"width":640,"height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"scene/gameScene_0.jpg","height":1136}},{"type":"Image","props":{"x":64,"width":533,"skin":"ui/common_ex/blank.png","height":155,"centerY":478},"child":[{"type":"Text","props":{"y":48,"x":131,"width":338,"text":"banner广告位","height":72,"fontSize":50,"font":"SimHei","color":"#ffffff"}}]},{"type":"Image","props":{"y":169,"width":594,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":780,"centerX":-3}},{"type":"List","props":{"y":198,"x":47,"width":549,"spaceY":20,"repeatY":6,"repeatX":1,"height":739},"child":[{"type":"Box","props":{"y":0,"x":0,"width":544,"renderType":"render","height":105},"child":[{"type":"Image","props":{"y":0,"x":-1,"width":545,"skin":"ui/common_ex/d.png","sizeGrid":"29,29,30,30","height":104}},{"type":"Image","props":{"y":2,"x":69,"width":99,"skin":"ui/common_ex/ptdk.png","height":99}},{"type":"Image","props":{"y":15,"x":82,"width":74,"sizeGrid":"0,0,0,0","name":"pop_img","height":74}},{"type":"Text","props":{"y":25,"x":10,"width":57,"text":"99","strokeColor":"#ffffff","stroke":3,"name":"popname_txt","height":48,"fontSize":50,"font":"SimHei","color":"#0099ff","bold":true,"align":"left"}},{"type":"Image","props":{"y":55,"x":403,"width":116,"skin":"ui/common_ex/p11.png","sizeGrid":"11,18,10,14","height":36}},{"type":"Text","props":{"y":61,"x":425,"width":78,"text":"100000","strokeColor":"#224882","stroke":5,"name":"cost1_txt","height":24,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":16,"x":189,"width":194,"text":"很长的微信名字XXXX","strokeColor":"#ffffff","stroke":3,"name":"popname_txt","height":26,"fontSize":20,"font":"SimHei","color":"#0099ff","bold":true,"align":"left"}},{"type":"Text","props":{"y":68,"x":190,"width":85,"text":"未知区域","strokeColor":"#ffffff","stroke":3,"name":"popname_txt","height":26,"fontSize":20,"font":"SimHei","color":"#0099ff","bold":true,"align":"left"}},{"type":"Text","props":{"y":66,"x":308,"width":74,"text":"xxxx市","strokeColor":"#ffffff","stroke":3,"name":"popname_txt","height":24,"fontSize":20,"font":"SimHei","color":"#0099ff","bold":true,"align":"left"}},{"type":"Text","props":{"y":68,"x":286,"width":16,"text":"-","strokeColor":"#ffffff","stroke":3,"name":"popname_txt","height":23,"fontSize":20,"font":"SimHei","color":"#0099ff","bold":true,"align":"left"}},{"type":"Text","props":{"y":15,"x":412,"width":101,"text":"钓鱼大师","strokeColor":"#224882","stroke":5,"name":"cost1_txt","height":26,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true}}]}]},{"type":"Image","props":{"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":22,"height":107,"bottom":966}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}