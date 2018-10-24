/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class ShipRefitUI extends View {
		public var bmask:Image;
		public var scrollleftBtn:Image;
		public var scrollrightBtn:Image;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":60,"x":60,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":664,"height":333,"centerX":0,"bottom":0},"child":[{"type":"Image","props":{"y":83,"width":639,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":252,"centerX":-3}},{"type":"Tab","props":{"width":501,"skin":"ui/common_ex/tab.png","selectedIndex":0,"left":9,"labels":"船体,船帆,船舱,船杆","labelSize":30,"labelPadding":"5,0,0,0","labelFont":"SimHei","labelColors":"#ffffff","height":56,"bottom":248}},{"type":"List","props":{"y":94,"x":10,"width":639,"spaceX":100,"repeatY":1,"repeatX":3,"mouseEnabled":false,"height":226},"child":[{"type":"Box","props":{"y":19,"x":109,"width":452,"renderType":"render","height":200},"child":[{"type":"ProgressBar","props":{"y":8,"x":246,"width":208,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","height":39}},{"type":"ProgressBar","props":{"y":60,"x":246,"width":208,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","height":39}},{"type":"ProgressBar","props":{"y":111,"x":246,"width":208,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","height":39}},{"type":"Image","props":{"y":-22,"x":-21,"width":230,"skin":"ui/common_ex/ptdk.png","height":230}},{"type":"Image","props":{"y":3,"x":5,"width":180,"skin":"ui/common_ex/ico2.png","sizeGrid":"0,0,0,0","height":180}},{"type":"Image","props":{"y":-4,"x":-8,"width":200,"skin":"ui/common_ex/p5.png","sizeGrid":"3,3,3,3","height":197},"child":[{"type":"Image","props":{"y":105,"x":152,"width":79,"skin":"ui/common_ex/lock.png","height":95}}]}]}]},{"type":"Image","props":{"y":166,"x":25,"width":44,"var":"scrollleftBtn","skin":"ui/common_ex/friendRank_close.png","height":66}},{"type":"Image","props":{"y":166,"x":598,"width":44,"var":"scrollrightBtn","skin":"ui/common_ex/friendRank_open.png","height":66}},{"type":"Image","props":{"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":9,"height":107,"bottom":232}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}