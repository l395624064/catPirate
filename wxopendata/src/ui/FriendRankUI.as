/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class FriendRankUI extends View {
		public var panelbox:Box;
		public var friendlist:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0},"child":[{"type":"Panel","props":{"y":303,"x":127,"width":403,"height":630},"child":[{"type":"List","props":{"y":0,"x":0,"width":411,"var":"friendlist","spaceY":0,"repeatY":6,"repeatX":1,"height":630},"child":[{"type":"Box","props":{"y":0,"x":0,"width":405,"renderType":"render","height":102},"child":[{"type":"Image","props":{"y":5,"x":0,"width":403,"skin":"ui/wxrank/di2.png","sizeGrid":"29,29,30,30","name":"floorImg","height":95}},{"type":"Image","props":{"y":9,"x":15,"width":56,"skin":"ui/wxrank/ico1.png","name":"rankimg","height":76}},{"type":"Image","props":{"y":59,"x":285,"width":116,"skin":"ui/wxrank/p11.png","sizeGrid":"11,18,10,14","height":36}},{"type":"Text","props":{"y":38,"x":23,"width":38,"text":"0","strokeColor":"#ffffff","stroke":3,"name":"ranktxt","height":40,"fontSize":40,"font":"SimHei","color":"#0099ff","bold":true,"align":"center"}},{"type":"Text","props":{"y":65,"x":294,"width":100,"text":"100000","strokeColor":"#224882","stroke":5,"name":"scoretxt","height":24,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Text","props":{"y":16,"x":178,"width":222,"text":"很长的微信名字XXXX","strokeColor":"#ffffff","stroke":3,"name":"nametxt","height":23,"fontSize":20,"font":"SimHei","color":"#0099ff","bold":true,"align":"left"}},{"type":"Text","props":{"y":65,"x":177,"width":101,"text":"钓鱼大师","strokeColor":"#224882","stroke":5,"name":"titletxt","height":26,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Box","props":{"y":15,"x":87,"name":"headBox"},"child":[{"type":"Image","props":{"width":74,"sizeGrid":"0,0,0,0","name":"headimg","height":74}},{"type":"Sprite","props":{"y":1,"x":1,"renderType":"mask"},"child":[{"type":"Circle","props":{"y":36,"x":36,"radius":36,"lineWidth":1,"fillColor":"#ff0000"}}]}]}]}]}]}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}