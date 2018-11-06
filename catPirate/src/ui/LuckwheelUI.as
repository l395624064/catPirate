/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class LuckwheelUI extends View {
		public var bmask:Image;
		public var closeBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":70,"x":70,"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"y":0,"x":0,"width":644,"height":1135},"child":[{"type":"Image","props":{"y":253,"width":639,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":765,"centerX":-4}},{"type":"Image","props":{"y":297,"x":50,"skin":"ui/luckwheel/m1.png"}},{"type":"Image","props":{"y":385,"x":118,"width":131,"skin":"ui/luckwheel/di2.png","sizeGrid":"13,19,16,11","name":"item0","height":364}},{"type":"Image","props":{"y":385,"x":259,"width":131,"skin":"ui/luckwheel/di2.png","sizeGrid":"13,19,16,11","name":"item1","height":364}},{"type":"Image","props":{"y":385,"x":400,"width":131,"skin":"ui/luckwheel/di2.png","sizeGrid":"13,19,16,11","name":"item2","height":364}},{"type":"Box","props":{"y":324,"x":100,"width":447,"height":480},"child":[{"type":"Image","props":{"y":61,"x":0,"width":462,"skin":"ui/luckwheel/mask1.png","sizeGrid":"10,10,10,10","renderType":"mask","height":364}},{"type":"Image","props":{"y":140,"x":55,"skin":"ui/common_ef/luck5.png"}},{"type":"Image","props":{"y":60,"x":55,"skin":"ui/common_ef/luck4.png"}},{"type":"Image","props":{"y":300,"x":55,"skin":"ui/common_ef/luck3.png"}},{"type":"Image","props":{"y":380,"x":55,"skin":"ui/common_ef/luck2.png"}},{"type":"Image","props":{"y":460,"x":55,"skin":"ui/common_ef/luck1.png"}},{"type":"Image","props":{"y":220,"x":55,"skin":"ui/common_ef/luck6.png"}}]},{"type":"Image","props":{"y":508,"x":118,"width":414,"skin":"ui/common_ex/blank.png","height":80}},{"type":"Button","props":{"y":801,"x":245,"width":149,"stateNum":1,"skin":"ui/common_ex/btn_s_y.png","label":"label","height":100}},{"type":"Button","props":{"y":255,"x":549,"width":87,"stateNum":2,"skin":"ui/common_ex/btn_wenhao.png","label":"label","height":87}},{"type":"Image","props":{"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":3,"height":107,"bottom":881}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}