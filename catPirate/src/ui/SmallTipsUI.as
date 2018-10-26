/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class SmallTipsUI extends View {
		public var tipsBox:Box;
		public var tips_Bg:Image;
		public var tips_Bg2:Image;
		public var content:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Box","props":{"y":10,"x":10,"width":433,"var":"tipsBox","height":62,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":0,"x":0,"width":432,"var":"tips_Bg","skin":"ui/common_ex/d.png","sizeGrid":"27,24,38,22","height":90}},{"type":"Image","props":{"y":7,"x":12,"width":410,"var":"tips_Bg2","skin":"ui/common_ex/p0.png","sizeGrid":"8,16,14,13","height":74}},{"type":"Label","props":{"y":9,"x":21,"wordWrap":true,"width":391,"var":"content","text":"这是一个提示信息这是一个提示一个提示信息这是一个提示","strokeColor":"#000000","stroke":1,"height":69,"fontSize":28,"font":"Microsoft YaHei","color":"#ffffff","bold":true,"align":"center"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}