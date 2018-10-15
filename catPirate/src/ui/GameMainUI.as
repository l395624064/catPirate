/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class GameMainUI extends View {
		public var scoreBox:Box;
		public var goldScoreImg:Image;
		public var gold_txt:Label;
		public var plankScoreImg:Image;
		public var plank_txt:Label;
		public var dropSp:Sprite;
		public var dropFishBox:Box;
		public var getScoreClip:FontClip;
		public var fishhookImg:Image;
		public var fishhookMask:Box;
		public var yellowImg:Image;
		public var blueImg:Image;
		public var rainbowImg:Image;
		public var coloursImg:Image;
		public var shipBox:Box;
		public var captainImg:Image;
		public var shipmateImg:Image;
		public var shipchefImg:Image;
		public var shipsoldierImg:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"scene/gameScene_0.jpg","height":1136}},{"type":"Box","props":{"y":29,"x":474,"var":"scoreBox"},"child":[{"type":"Image","props":{"y":30,"x":70,"width":141,"var":"goldScoreImg","skin":"ui/common_ex/goldScore_di.png","height":61,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Label","props":{"y":17,"x":9,"width":77,"var":"gold_txt","text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}}]},{"type":"Image","props":{"y":107,"x":70,"var":"plankScoreImg","skin":"ui/common_ex/plankScore_di.png","scaleY":1,"scaleX":1,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Label","props":{"y":16,"x":9,"width":77,"var":"plank_txt","text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}}]}]},{"type":"Sprite","props":{"y":752,"x":8,"width":632,"var":"dropSp","height":226}},{"type":"Box","props":{"y":870,"x":66,"var":"dropFishBox"},"child":[{"type":"Image","props":{"y":32,"skin":"ui/gamemain/fishscroll.png"}},{"type":"FontClip","props":{"y":0,"x":61,"width":64,"var":"getScoreClip","value":"+1","skin":"font/font_1.png","sheet":"/.+-0123456789枚万亿","height":43,"anchorY":1,"anchorX":0}},{"type":"Image","props":{"y":54,"x":75,"width":54,"var":"fishhookImg","skin":"ui/gamemain/fishhook.png","pivotY":54,"pivotX":27,"height":53}},{"type":"Box","props":{"y":24,"x":75,"width":468,"var":"fishhookMask","height":135},"child":[{"type":"Image","props":{"y":45,"x":600,"width":90,"var":"yellowImg","skin":"ui/gamemain/color_yellow.png","anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":45,"x":600,"width":90,"var":"blueImg","skin":"ui/gamemain/color_blue.png","height":90,"anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":45,"x":600,"var":"rainbowImg","skin":"ui/gamemain/color_rainbow.png","anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":45,"x":600,"var":"coloursImg","skin":"ui/gamemain/color_colours.png","anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":27,"skin":"ui/gamemain/gfer.png","renderType":"mask"}}]}]},{"type":"Box","props":{"y":755,"x":311,"width":584,"var":"shipBox","rotation":0,"pivotY":489,"pivotX":293,"height":485},"child":[{"type":"Image","props":{"y":97,"x":356,"width":111,"var":"captainImg","pivotY":131,"pivotX":54,"height":131}},{"type":"Image","props":{"y":484,"x":303,"width":603,"skin":"ui/common/ship_A_1.png","pivotY":484,"pivotX":303,"height":487}},{"type":"Image","props":{"y":297,"x":420,"width":112,"var":"shipmateImg","pivotY":133,"pivotX":58,"height":131}},{"type":"Image","props":{"y":210,"x":229,"width":111,"var":"shipchefImg","pivotY":135,"pivotX":57,"height":133}},{"type":"Image","props":{"y":297,"x":92,"width":114,"var":"shipsoldierImg","pivotY":128,"pivotX":58,"height":128}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}