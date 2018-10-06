/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class GameMainUI extends View {
		public var scoreBox:Box;
		public var gold_txt:Label;
		public var plank_txt:Label;
		public var dropSp:Sprite;
		public var dropFishBox:Box;
		public var fishhookImg:Image;
		public var shipBox:Box;
		public var captainImg:Image;
		public var shipmateImg:Image;
		public var shipchefImg:Image;
		public var shipsoldierImg:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"scene/gameScene_0.jpg","height":1136}},{"type":"Box","props":{"y":29,"x":474,"var":"scoreBox"},"child":[{"type":"Image","props":{"skin":"ui/common_ex/goldScore_di.png"}},{"type":"Image","props":{"y":77,"skin":"ui/common_ex/plankScore_di.png"}},{"type":"Label","props":{"y":17,"x":9,"width":77,"var":"gold_txt","text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}},{"type":"Label","props":{"y":93,"x":9,"width":77,"var":"plank_txt","text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}}]},{"type":"Sprite","props":{"y":752,"x":8,"width":632,"var":"dropSp","height":226}},{"type":"Box","props":{"y":870,"x":66,"var":"dropFishBox"},"child":[{"type":"Image","props":{"y":32,"skin":"ui/gamemain/fishscroll.png"}},{"type":"Image","props":{"y":54,"x":75,"width":54,"var":"fishhookImg","skin":"ui/gamemain/fishhook.png","pivotY":54,"pivotX":27,"height":53}},{"type":"Box","props":{"y":24,"x":75},"child":[{"type":"Image","props":{"x":357,"skin":"ui/gamemain/color_yellow.png"}},{"type":"Image","props":{"x":125,"skin":"ui/gamemain/color_blue.png"}},{"type":"Image","props":{"y":27,"skin":"ui/gamemain/gfer.png","renderType":"mask"}}]}]},{"type":"Box","props":{"y":755,"x":311,"width":584,"var":"shipBox","rotation":0,"pivotY":489,"pivotX":293,"height":485},"child":[{"type":"Image","props":{"y":97,"x":356,"width":111,"var":"captainImg","pivotY":131,"pivotX":54,"height":131}},{"type":"Image","props":{"y":484,"x":303,"width":603,"skin":"ui/common/ship_A_1.png","pivotY":484,"pivotX":303,"height":487}},{"type":"Image","props":{"y":297,"x":420,"width":112,"var":"shipmateImg","pivotY":133,"pivotX":58,"height":131}},{"type":"Image","props":{"y":210,"x":229,"width":111,"var":"shipchefImg","pivotY":135,"pivotX":57,"height":133}},{"type":"Image","props":{"y":297,"x":92,"width":114,"var":"shipsoldierImg","pivotY":128,"pivotX":58,"height":128}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}