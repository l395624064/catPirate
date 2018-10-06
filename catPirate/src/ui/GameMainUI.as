/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class GameMainUI extends View {
		public var dropSp:Sprite;
		public var dropSolder:Box;
		public var shipSp:Box;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"scene/GameSea0.jpg","height":1136}},{"type":"Box","props":{"y":29,"x":474},"child":[{"type":"Image","props":{"skin":"ui/common_ex/goldScore_di.png"}},{"type":"Image","props":{"y":77,"skin":"ui/common_ex/plankScore_di.png"}},{"type":"Label","props":{"y":17,"x":9,"width":77,"text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}},{"type":"Label","props":{"y":93,"x":9,"width":77,"text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}}]},{"type":"Sprite","props":{"y":547,"x":8,"width":632,"var":"dropSp","height":372}},{"type":"Box","props":{"y":870,"x":66,"var":"dropSolder"},"child":[{"type":"Image","props":{"y":32,"skin":"ui/common_ex/fishscroll.png"}},{"type":"Image","props":{"y":54,"x":76,"width":54,"skin":"ui/common_ex/fishhook.png","pivotY":54,"pivotX":27,"height":53}},{"type":"Box","props":{"y":24,"x":75},"child":[{"type":"Image","props":{"x":357,"skin":"ui/common_ex/color_yellow.png"}},{"type":"Image","props":{"x":125,"skin":"ui/common_ex/color_blue.png"}},{"type":"Image","props":{"y":27,"skin":"ui/common_ex/gfer.png","renderType":"mask"}}]}]},{"type":"Box","props":{"y":755,"x":311,"width":584,"var":"shipSp","rotation":0,"pivotY":489,"pivotX":293,"height":485},"child":[{"type":"Image","props":{"y":484,"x":303,"width":603,"skin":"ui/common/ship2.png","pivotY":484,"pivotX":303,"height":487}},{"type":"Image","props":{"y":290,"x":364,"width":120,"skin":"ui/common/1.png","pivotY":136,"pivotX":59,"height":141}},{"type":"Image","props":{"y":298,"x":102,"width":112,"skin":"ui/common/5.png","pivotY":133,"pivotX":58,"height":131}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}