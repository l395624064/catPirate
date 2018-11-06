/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class GameMainUI extends View {
		public var scoreBox:Box;
		public var goldScoreImg:Image;
		public var gold_txt:Label;
		public var plankScoreImg:Image;
		public var plank_txt:Label;
		public var pearlScoreImg:Image;
		public var pearl_txt:Label;
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
		public var shipmateImg:Image;
		public var shipsoldierImg:Image;
		public var shipchefImg:Image;
		public var fishboxsp:Sprite;
		public var captainImg:Image;
		public var gameStartBtn:Button;
		public var mapBtn:Image;
		public var remouldBtn:Image;
		public var bookBtn:Image;
		public var rightbtnBox:Box;
		public var friendRankBtn:Button;
		public var shopBtn:Button;
		public var luckwheelBtn:Button;
		public var leftbtnBox:Box;
		public var timegiftBtn:Image;
		public var gameboxBtn:Image;
		public var boxlibsBtn:Image;
		public var timeBox:Box;
		public var timeclip:FontClip;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"scene/gameScene_0.jpg","height":1136}},{"type":"Box","props":{"width":637,"height":1130,"centerY":0,"centerX":0},"child":[{"type":"Box","props":{"x":492,"width":158,"var":"scoreBox","height":136},"child":[{"type":"Image","props":{"y":30,"x":71,"width":141,"var":"goldScoreImg","skin":"ui/common_ex/goldScore_di.png","scaleY":1,"scaleX":1,"height":61,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Label","props":{"y":17,"x":9,"width":77,"var":"gold_txt","text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}}]},{"type":"Image","props":{"y":95,"x":71,"var":"plankScoreImg","skin":"ui/common_ex/plankScore_di.png","scaleY":1,"scaleX":1,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Label","props":{"y":16,"x":9,"width":77,"var":"plank_txt","text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}}]},{"type":"Image","props":{"y":157,"x":69,"var":"pearlScoreImg","skin":"ui/common_ex/pearlScore_di.png","anchorY":0.5,"anchorX":0.5},"child":[{"type":"Label","props":{"y":17,"x":9,"width":77,"var":"pearl_txt","text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}}]}]},{"type":"Sprite","props":{"y":739,"width":632,"var":"dropSp","height":226}},{"type":"Box","props":{"y":857,"x":58,"var":"dropFishBox"},"child":[{"type":"Image","props":{"y":32,"skin":"ui/gamemain/fishscroll.png"}},{"type":"FontClip","props":{"y":0,"x":61,"width":64,"var":"getScoreClip","value":"+1","skin":"font/font_1.png","sheet":"/.+-0123456789枚万亿","height":43,"anchorY":1,"anchorX":0}},{"type":"Image","props":{"y":54,"x":75,"width":54,"var":"fishhookImg","skin":"ui/gamemain/fishhook.png","pivotY":54,"pivotX":27,"height":53}},{"type":"Box","props":{"y":51,"x":75,"width":468,"var":"fishhookMask","height":48},"child":[{"type":"Image","props":{"y":18,"x":600,"width":90,"var":"yellowImg","skin":"ui/gamemain/color_yellow.png","anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":18,"x":600,"width":90,"var":"blueImg","skin":"ui/gamemain/color_blue.png","height":90,"anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":18,"x":600,"var":"rainbowImg","skin":"ui/gamemain/color_rainbow.png","anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":18,"x":600,"var":"coloursImg","skin":"ui/gamemain/color_colours.png","anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":0,"x":0,"skin":"ui/gamemain/gfer.png","renderType":"mask"}}]},{"type":"Box","props":{"y":34,"x":1},"child":[{"type":"Sprite","props":{"y":4,"x":4,"width":70,"renderType":"mask","height":70},"child":[{"type":"Pie","props":{"y":35,"x":35,"startAngle":-180,"radius":35,"lineWidth":1,"fillColor":"#00ffea","endAngle":-90.93485610931266}}]},{"type":"Sprite","props":{"y":4,"x":4,"width":70,"height":70},"child":[{"type":"Circle","props":{"y":35,"x":35,"radius":35,"lineWidth":1,"fillColor":"#ff1400"}}]}]}]},{"type":"Box","props":{"y":742,"x":303,"width":584,"var":"shipBox","rotation":0,"pivotY":489,"pivotX":293,"height":485},"child":[{"type":"Image","props":{"y":98,"x":458,"width":89,"var":"shipmateImg","height":105}},{"type":"Image","props":{"y":122,"x":392,"width":199,"skin":"ui/shipskin/cabin_1.png","name":"cabin","height":155}},{"type":"Image","props":{"y":-82,"x":100,"width":101,"var":"shipsoldierImg","pivotY":0,"pivotX":0,"height":113}},{"type":"Image","props":{"y":-110,"x":59,"width":198,"skin":"ui/shipskin/tower_1.png","name":"tower","height":376}},{"type":"Image","props":{"y":125,"x":58,"width":97,"var":"shipchefImg","height":117}},{"type":"Sprite","props":{"y":200,"x":61,"width":210,"var":"fishboxsp","height":50}},{"type":"Image","props":{"y":176,"x":8,"width":551,"skin":"ui/shipskin/shipbody_1.png","name":"body","height":260}},{"type":"Image","props":{"y":-14,"x":271,"width":140,"skin":"ui/shipskin/sail_1.png","name":"sail","height":296}},{"type":"Image","props":{"y":171,"x":271,"width":99,"var":"captainImg","height":117},"child":[{"type":"Image","props":{"y":110,"x":10,"width":7,"skin":"ui/gamemain/yg01.png","rotation":-24,"pivotY":149,"pivotX":4,"height":150}}]},{"type":"Button","props":{"y":298,"x":195,"width":217,"var":"gameStartBtn","stateNum":2,"skin":"ui/common_ex/btn_blue.png","labelSize":50,"label":"计时赛","height":135}}]},{"type":"Box","props":{"y":18,"x":6,"visible":false},"child":[{"type":"Image","props":{"y":199,"width":76,"var":"mapBtn","skin":"ui/common_ex/mapBtn.png","height":76}},{"type":"Image","props":{"y":97,"x":6,"width":76,"var":"remouldBtn","skin":"ui/common_ex/remouldBtn.png","height":76}},{"type":"Image","props":{"x":4,"width":69,"var":"bookBtn","skin":"ui/common_ex/bookBtn.png","height":76}}]},{"type":"Box","props":{"y":181,"x":504,"var":"rightbtnBox"},"child":[{"type":"Button","props":{"width":133,"var":"friendRankBtn","stateNum":2,"skin":"ui/common_ex/btn_blue.png","labelSize":35,"label":"排行","height":77}},{"type":"Button","props":{"y":72,"x":1,"width":127,"var":"shopBtn","stateNum":2,"skin":"ui/common_ex/btn_blue.png","labelSize":35,"label":"商城","height":70}},{"type":"Button","props":{"y":134,"x":3,"width":131,"var":"luckwheelBtn","stateNum":2,"skin":"ui/common_ex/btn_blue.png","labelSize":35,"label":"转转乐","height":67}}]},{"type":"Box","props":{"y":4,"x":2,"var":"leftbtnBox"},"child":[{"type":"Image","props":{"y":126,"x":1,"width":84,"var":"timegiftBtn","skin":"ui/common_ex/giftBtn.png","height":93},"child":[{"type":"Text","props":{"y":94,"x":-15,"wordWrap":true,"width":125,"text":"限时礼包","mouseEnabled":false,"height":27,"fontSize":30,"font":"SimHei","color":"#ff0400"}}]},{"type":"Image","props":{"y":-4,"x":102,"var":"gameboxBtn","skin":"ui/common_ex/d.png"},"child":[{"type":"Text","props":{"y":13,"x":11,"wordWrap":true,"width":66,"text":"游戏盒子","mouseEnabled":false,"height":63,"fontSize":30,"font":"SimHei","color":"#ff0400"}}]},{"type":"Image","props":{"y":258,"x":1,"var":"boxlibsBtn","skin":"ui/common_ex/d.png"},"child":[{"type":"Text","props":{"y":11,"x":10,"wordWrap":true,"width":66,"text":"宝箱库","mouseEnabled":false,"height":63,"fontSize":30,"font":"SimHei","color":"#ff0400"}}]}]},{"type":"Box","props":{"y":110,"x":233,"width":158,"var":"timeBox","height":124},"child":[{"type":"Text","props":{"y":0,"x":21,"width":110,"text":"剩余:","strokeColor":"#224882","stroke":10,"height":47,"fontSize":50,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"FontClip","props":{"y":59,"x":8,"width":146,"var":"timeclip","value":"30","skin":"font/font_3.png","sheet":"0123456789","height":60,"align":"center"}}]},{"type":"Image","props":{"y":974,"x":66,"width":533,"skin":"ui/common_ex/blank.png","height":155,"centerY":486},"child":[{"type":"Text","props":{"y":48,"x":131,"width":338,"text":"banner广告位","height":72,"fontSize":50,"font":"SimHei","color":"#ffffff"}}]},{"type":"Image","props":{"y":4,"x":4,"width":78,"skin":"ui/common_ex/settingBtn.png","height":78}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}