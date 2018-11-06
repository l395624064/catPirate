/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class ExplainbookUI extends View {
		public var bmask:Image;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":80,"x":80,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"y":10,"x":10,"width":647,"height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":120,"width":639,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":876,"centerX":-3}},{"type":"Image","props":{"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":10,"height":107,"bottom":1016}},{"type":"List","props":{"y":131,"x":17,"spaceX":20,"repeatY":1,"repeatX":1},"child":[{"type":"Box","props":{"renderType":"render"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":612,"skin":"ui/common_ex/blank.png","name":"img","height":855}}]}]},{"type":"Tab","props":{"width":368,"skin":"ui/common_ex/tab.png","selectedIndex":0,"left":16,"labels":"玩法,道具,鱼类","labelSize":30,"labelPadding":"5,0,0,0","labelFont":"SimHei","labelColors":"#ffffff","height":56,"bottom":1013}},{"type":"Image","props":{"y":890,"x":430,"width":67,"skin":"ui/common_ex/friendRank_close.png","height":100}},{"type":"Image","props":{"y":894,"x":549,"width":66,"skin":"ui/common_ex/friendRank_open.png","height":99}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}