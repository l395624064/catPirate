/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class FriendRankUI extends View {
		public var bmask:Image;
		public var friendlist:List;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":20,"x":20,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"y":10,"x":10,"width":640,"height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":281,"x":102,"width":447,"skin":"ui/friendrank/di3.png","sizeGrid":"10,10,10,10","height":715}},{"type":"List","props":{"y":303,"x":124,"width":420,"var":"friendlist","spaceY":0,"repeatY":7,"repeatX":1,"height":713},"child":[{"type":"Box","props":{"y":0,"x":-7,"width":423,"renderType":"render","height":105},"child":[{"type":"Image","props":{"y":0,"x":1,"width":421,"skin":"ui/friendrank/di2.png","sizeGrid":"29,29,30,30","name":"floorImg","height":106}},{"type":"Image","props":{"y":2,"x":74,"width":99,"visible":false,"skin":"ui/common_ex/ptdk.png","height":99}},{"type":"Image","props":{"y":15,"x":87,"width":74,"sizeGrid":"0,0,0,0","name":"headimg","height":74}},{"type":"Image","props":{"y":9,"x":15,"width":56,"skin":"ui/friendrank/ico1.png","name":"rankimg","height":76}},{"type":"Image","props":{"y":59,"x":285,"width":116,"skin":"ui/common_ex/p11.png","sizeGrid":"11,18,10,14","height":36}},{"type":"Text","props":{"y":38,"x":23,"width":38,"text":"1","strokeColor":"#ffffff","stroke":3,"name":"ranktxt","height":40,"fontSize":40,"font":"SimHei","color":"#0099ff","bold":true,"align":"center"}},{"type":"Text","props":{"y":65,"x":294,"width":100,"text":"100000","strokeColor":"#224882","stroke":5,"name":"scoretxt","height":24,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Text","props":{"y":16,"x":178,"width":222,"text":"很长的微信名字XXXX","strokeColor":"#ffffff","stroke":3,"name":"nametxt","height":23,"fontSize":20,"font":"SimHei","color":"#0099ff","bold":true,"align":"left"}},{"type":"Text","props":{"y":65,"x":177,"width":101,"text":"钓鱼大师","strokeColor":"#224882","stroke":5,"name":"titletxt","height":26,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true}}]}]},{"type":"Image","props":{"x":52,"width":533,"visible":false,"skin":"ui/common_ex/blank.png","height":155,"centerY":490},"child":[{"type":"Text","props":{"y":48,"x":131,"width":338,"text":"banner广告位","height":72,"fontSize":50,"font":"SimHei","color":"#ffffff"}}]},{"type":"Image","props":{"y":-2,"x":0,"width":642,"skin":"ui/friendrank/dibg.png","height":1041}},{"type":"Image","props":{"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":22,"height":107,"bottom":966}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}