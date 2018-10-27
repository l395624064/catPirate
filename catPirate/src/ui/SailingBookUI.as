/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class SailingBookUI extends View {
		public var bmask:Image;
		public var player_img:Image;
		public var playername_txt:Text;
		public var proBar_box:Box;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":70,"x":70,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":664,"height":514,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":2,"width":639,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":511,"centerX":-3}},{"type":"Box","props":{"y":10,"x":20,"scaleY":1,"scaleX":1},"child":[{"type":"Image","props":{"width":230,"skin":"ui/common_ex/ptdk.png","height":230}},{"type":"Image","props":{"y":25,"x":26,"width":180,"var":"player_img","sizeGrid":"0,0,0,0","height":180}},{"type":"Image","props":{"y":164,"x":21,"width":190,"skin":"ui/common_ex/p5.png","sizeGrid":"11,13,12,14","height":42},"child":[{"type":"Text","props":{"y":7,"x":13,"width":166,"var":"playername_txt","text":"船长","strokeColor":"#ffffff","stroke":3,"height":31,"fontSize":30,"font":"SimHei","color":"#0099ff","bold":true,"align":"left"}}]}]},{"type":"Box","props":{"y":30,"x":291,"var":"proBar_box","scaleY":1.2,"scaleX":1.2},"child":[{"type":"ProgressBar","props":{"y":0,"x":63,"width":151,"value":1,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","name":"pronum0","height":30}},{"type":"ProgressBar","props":{"y":38,"x":63,"width":151,"value":1,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","name":"pronum1","height":30}},{"type":"ProgressBar","props":{"y":76,"x":63,"width":151,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","name":"pronum2","height":30}},{"type":"ProgressBar","props":{"y":114,"x":63,"width":151,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","name":"pronum3","height":30}},{"type":"ProgressBar","props":{"y":152,"x":63,"width":151,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","name":"pronum4","height":30}},{"type":"Text","props":{"y":3,"width":48,"text":"耐久","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":24,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":41,"width":48,"text":"战斗","strokeColor":"#224882","stroke":5,"name":"proname_txt1","height":24,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":79,"width":48,"text":"学识","strokeColor":"#224882","stroke":5,"name":"proname_txt2","height":24,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":117,"width":48,"text":"速度","strokeColor":"#224882","stroke":5,"name":"proname_txt3","height":24,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":155,"width":48,"text":"感知","strokeColor":"#224882","stroke":5,"name":"proname_txt4","height":24,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}}]},{"type":"Image","props":{"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":11,"height":107,"bottom":461}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}