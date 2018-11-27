/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.ui.AdvImage;
	import laya.display.Text;

	public class GameMainUI extends View {
		public var ani1:FrameAnimation;
		public var bmask:Image;
		public var panelbox:Box;
		public var bgImg:Image;
		public var skystarAni:Animation;
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
		public var scoreBox:Box;
		public var goldScoreImg:Image;
		public var gold_txt:Label;
		public var plankScoreImg:Image;
		public var plank_txt:Label;
		public var pearlScoreImg:Image;
		public var pearl_txt:Label;
		public var rightbtnBox:Box;
		public var friendRankBtn:Button;
		public var shopBtn:Button;
		public var shareBtn:Image;
		public var leftbtnBox:Box;
		public var timegiftBtn:Image;
		public var gameboxBtn:Image;
		public var boxlibsBtn:Image;
		public var luckwheelBtn:Button;
		public var timeBox:Box;
		public var timeclip:FontClip;
		public var dropFishBox:Box;
		public var floorbarAni:Animation;
		public var fireAni:Animation;
		public var powerBox:Box;
		public var powerMaskSp:Sprite;
		public var getScoreClip:FontClip;
		public var bossmarkImg:Image;
		public var fishhookImg:Image;
		public var bossPowerBox:Box;
		public var powermask:Image;
		public var fishhookMask:Box;
		public var yellowImg:Image;
		public var blueImg:Image;
		public var rainbowImg:Image;
		public var coloursImg:Image;
		public var refreshAni:Animation;
		public var getpowerAni:Animation;
		public var dropSp:Sprite;
		public var settingBtn:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":640,"var":"panelbox","scaleY":1,"scaleX":1,"height":1136,"centerY":0,"centerX":0},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"var":"bgImg","skin":"ui/gamemain/gamemain_0.png","height":1136}},{"type":"Animation","props":{"y":581,"x":346,"width":284,"visible":false,"var":"skystarAni","source":"GameMain_skystar.ani","height":549,"autoPlay":false,"alpha":0.8}},{"type":"Image","props":{"y":821,"x":-34,"width":747,"skin":"ui/gamemain/bowen.png","skewY":0,"skewX":0,"height":322,"alpha":1},"compId":87},{"type":"Box","props":{"y":790,"x":327,"width":584,"var":"shipBox","rotation":0.5,"pivotY":489,"pivotX":293,"height":485},"child":[{"type":"Image","props":{"y":98,"x":458,"width":89,"var":"shipmateImg","height":105}},{"type":"Image","props":{"y":122,"x":392,"width":199,"skin":"ui/shipskin/cabin_1.png","name":"cabin","height":155}},{"type":"Image","props":{"y":-82,"x":100,"width":101,"var":"shipsoldierImg","pivotY":0,"pivotX":0,"height":113}},{"type":"Image","props":{"y":-110,"x":59,"width":198,"skin":"ui/shipskin/tower_1.png","name":"tower","height":376}},{"type":"Image","props":{"y":125,"x":58,"width":97,"var":"shipchefImg","height":117}},{"type":"Sprite","props":{"y":200,"x":61,"width":210,"var":"fishboxsp","height":50}},{"type":"Image","props":{"y":176,"x":8,"width":551,"skin":"ui/shipskin/shipbody_1.png","name":"body","height":260}},{"type":"Image","props":{"y":-14,"x":271,"width":140,"skin":"ui/shipskin/sail_1.png","name":"sail","height":296}},{"type":"Image","props":{"y":171,"x":271,"width":99,"var":"captainImg","height":117},"child":[{"type":"Image","props":{"y":110,"x":10,"width":7,"skin":"ui/gamemain/yg01.png","rotation":-24,"pivotY":149,"pivotX":4,"height":150}}]},{"type":"Button","props":{"y":311,"x":229,"width":133,"var":"gameStartBtn","stateNum":1,"skin":"ui/common_ex/btn_s_r.png","sizeGrid":"21,16,25,27","labelSize":50,"labelFont":"Microsoft YaHei","height":105},"child":[{"type":"Image","props":{"y":10,"x":41,"width":53,"skin":"ui/gamemain/btn1.png","height":82}}]}]},{"type":"Image","props":{"y":703,"x":-2,"width":640,"skin":"ui/gamemain/water-2.png","height":120},"compId":88},{"type":"Box","props":{"y":18,"x":6,"visible":false},"child":[{"type":"Image","props":{"y":199,"width":76,"var":"mapBtn","skin":"ui/common_ex/mapBtn.png","height":76}},{"type":"Image","props":{"y":97,"x":6,"width":76,"var":"remouldBtn","skin":"ui/common_ex/remouldBtn.png","height":76}},{"type":"Image","props":{"x":4,"width":69,"var":"bookBtn","skin":"ui/common_ex/bookBtn.png","height":76}}]},{"type":"Box","props":{"y":22,"x":492,"width":158,"var":"scoreBox","height":136},"child":[{"type":"Image","props":{"y":30,"x":71,"width":141,"var":"goldScoreImg","skin":"ui/common_ex/goldScore_di.png","scaleY":1,"scaleX":1,"height":61,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Label","props":{"y":17,"x":9,"width":77,"var":"gold_txt","text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}}]},{"type":"Image","props":{"y":95,"x":71,"var":"plankScoreImg","skin":"ui/common_ex/plankScore_di.png","scaleY":1,"scaleX":1,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Label","props":{"y":16,"x":9,"width":77,"var":"plank_txt","text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}}]},{"type":"Image","props":{"y":157,"x":69,"var":"pearlScoreImg","skin":"ui/common_ex/pearlScore_di.png","anchorY":0.5,"anchorX":0.5},"child":[{"type":"Label","props":{"y":17,"x":9,"width":77,"var":"pearl_txt","text":"0","height":23,"fontSize":23,"color":"#7d632c","bold":true,"align":"left"}}]}]},{"type":"Box","props":{"y":209,"x":511,"var":"rightbtnBox"},"child":[{"type":"Button","props":{"y":9,"x":-33,"width":78,"var":"friendRankBtn","stateNum":1,"skin":"ui/gamemain/btn9.png","labelSize":35,"height":73}},{"type":"Button","props":{"y":5,"x":53,"width":71,"var":"shopBtn","stateNum":1,"skin":"ui/gamemain/btn4.png","labelSize":35,"height":77}},{"type":"Image","props":{"y":90,"x":58,"width":70,"var":"shareBtn","skin":"ui/common_ex/shareBtn.png","height":74}},{"type":"AdvImage","props":{"y":91,"x":-29,"width":71,"iconSign":"ADSprite","height":71}}]},{"type":"Box","props":{"y":30,"x":2,"var":"leftbtnBox"},"child":[{"type":"Image","props":{"y":95,"x":8,"width":67,"var":"timegiftBtn","skin":"ui/gamemain/btn6.png","height":74}},{"type":"Image","props":{"y":-4,"x":102,"width":89,"visible":false,"var":"gameboxBtn","skin":"ui/gamemain/btn5.png","height":63}},{"type":"Image","props":{"y":188,"x":5,"width":78,"var":"boxlibsBtn","skin":"ui/gamemain/btn2.png","height":65}},{"type":"Button","props":{"y":268,"x":7,"width":72,"var":"luckwheelBtn","stateNum":1,"skin":"ui/gamemain/btn3b.png","labelSize":35,"height":74}}]},{"type":"Box","props":{"y":110,"x":233,"width":158,"var":"timeBox","height":124},"child":[{"type":"Text","props":{"y":0,"x":21,"width":110,"text":"剩余:","strokeColor":"#224882","stroke":10,"height":47,"fontSize":50,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"FontClip","props":{"y":59,"x":8,"width":146,"var":"timeclip","value":"30","skin":"font/font_3.png","sheet":"0123456789","height":60,"align":"center"}}]},{"type":"Box","props":{"y":857,"x":58,"var":"dropFishBox"},"child":[{"type":"Animation","props":{"y":1,"x":61,"width":150,"visible":false,"var":"floorbarAni","source":"GameMain_floorbar.ani","scaleY":2.5,"scaleX":3,"height":57}},{"type":"Animation","props":{"y":-82,"x":-27,"width":75,"visible":false,"var":"fireAni","source":"GameMain_fire.ani","scaleY":2,"scaleX":2,"height":91,"autoPlay":false}},{"type":"Box","props":{"y":73,"x":52,"width":100,"var":"powerBox","pivotY":51,"pivotX":54,"height":100},"child":[{"type":"Image","props":{"width":100,"skin":"ui/gamemain/sp_di.png","height":100}},{"type":"Box","props":{"y":2,"x":2},"child":[{"type":"Sprite","props":{"y":0,"x":0,"width":97,"var":"powerMaskSp","renderType":"mask","height":97,"endAngle":-220},"child":[{"type":"Pie","props":{"y":49,"x":48,"startAngle":0,"radius":47,"name":"piemask","lineWidth":1,"fillColor":"#ff0000","endAngle":335}}]},{"type":"Image","props":{"y":0,"x":0,"width":97,"skin":"ui/gamemain/sp_ceil.png","height":97}}]},{"type":"Image","props":{"width":100,"skin":"ui/gamemain/sp_di3.png","height":100}}]},{"type":"Image","props":{"y":32,"x":0,"skin":"ui/gamemain/fishscroll.png"}},{"type":"FontClip","props":{"y":0,"x":61,"width":64,"var":"getScoreClip","value":"+1","skin":"font/font_1.png","sheet":"/.+-0123456789枚万亿","height":43,"anchorY":1,"anchorX":0}},{"type":"Image","props":{"y":53,"x":449,"width":50,"visible":false,"var":"bossmarkImg","skin":"ui/gamemain/bjImg.png","height":80,"anchorY":1,"anchorX":0.5}},{"type":"Image","props":{"y":54,"x":500,"width":54,"visible":false,"var":"fishhookImg","skin":"ui/gamemain/fishhook.png","pivotY":54,"pivotX":27,"height":53}},{"type":"Box","props":{"y":51,"x":75,"width":438,"visible":false,"var":"bossPowerBox","height":48},"child":[{"type":"Image","props":{"y":4,"x":10,"width":427,"skin":"ui/gamemain/power3.png","height":39}},{"type":"Image","props":{"y":-3,"x":10,"width":30,"var":"powermask","skin":"ui/gamemain/color_yellow.png","sizeGrid":"29,29,32,29","renderType":"mask","height":52}}]},{"type":"Box","props":{"y":51,"x":75,"width":468,"var":"fishhookMask","height":48},"child":[{"type":"Image","props":{"y":18,"x":600,"width":90,"var":"yellowImg","skin":"ui/gamemain/color_yellow.png","anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":18,"x":600,"width":90,"var":"blueImg","skin":"ui/gamemain/color_blue.png","height":90,"anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":18,"x":600,"var":"rainbowImg","skin":"ui/gamemain/color_rainbow.png","anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":18,"x":600,"var":"coloursImg","skin":"ui/gamemain/color_colours.png","anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":4,"x":-4,"width":448,"skin":"ui/gamemain/gfer.png","renderType":"mask","height":39}},{"type":"Animation","props":{"y":2,"x":15,"width":419,"visible":false,"var":"refreshAni","source":"GameMain_refreshFish.ani","scaleY":1,"scaleX":1,"height":44,"autoPlay":false}}]},{"type":"Animation","props":{"y":5,"x":-14,"width":137,"var":"getpowerAni","source":"GameMain_getpower.ani","height":140,"autoPlay":false}}]},{"type":"Sprite","props":{"y":739,"x":0,"width":632,"var":"dropSp","height":226}},{"type":"Image","props":{"y":974,"x":66,"width":533,"skin":"ui/common_ex/blank.png","height":155,"centerY":486},"child":[{"type":"Text","props":{"y":48,"x":131,"width":338,"text":"banner广告位","height":72,"fontSize":50,"font":"SimHei","color":"#ffffff"}}]},{"type":"Image","props":{"y":30,"x":4,"width":78,"var":"settingBtn","skin":"ui/common_ex/settingBtn.png","height":78}}]}],"animations":[{"nodes":[{"target":87,"keyframes":{"y":[{"value":821,"tweenMethod":"linearNone","tween":true,"target":87,"key":"y","index":0},{"value":815,"tweenMethod":"linearNone","tween":true,"target":87,"key":"y","index":40},{"value":821,"tweenMethod":"linearNone","tween":true,"target":87,"label":null,"key":"y","index":80}],"width":[{"value":747,"tweenMethod":"linearNone","tween":true,"target":87,"key":"width","index":0},{"value":725,"tweenMethod":"linearNone","tween":true,"target":87,"key":"width","index":40},{"value":747,"tweenMethod":"linearNone","tween":true,"target":87,"label":null,"key":"width","index":80}],"skewY":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":87,"key":"skewY","index":0},{"value":0,"tweenMethod":"linearNone","tween":true,"target":87,"key":"skewY","index":40},{"value":0,"tweenMethod":"linearNone","tween":true,"target":87,"label":null,"key":"skewY","index":80}],"skewX":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":87,"key":"skewX","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":87,"key":"skewX","index":40},{"value":0,"tweenMethod":"linearNone","tween":true,"target":87,"label":null,"key":"skewX","index":80}],"alpha":[{"value":1,"tweenMethod":"linearNone","tween":true,"target":87,"key":"alpha","index":0},{"value":0.8,"tweenMethod":"linearNone","tween":true,"target":87,"key":"alpha","index":40},{"value":1,"tweenMethod":"linearNone","tween":true,"target":87,"label":null,"key":"alpha","index":80}]}},{"target":88,"keyframes":{"y":[{"value":703,"tweenMethod":"linearNone","tween":true,"target":88,"key":"y","index":0},{"value":695,"tweenMethod":"linearNone","tween":true,"target":88,"key":"y","index":40},{"value":703,"tweenMethod":"linearNone","tween":true,"target":88,"label":null,"key":"y","index":80}],"x":[{"value":-2,"tweenMethod":"linearNone","tween":true,"target":88,"key":"x","index":0},{"value":-2,"tweenMethod":"linearNone","tween":true,"target":88,"label":null,"key":"x","index":40},{"value":-2,"tweenMethod":"linearNone","tween":true,"target":88,"label":null,"key":"x","index":80}],"height":[{"value":120,"tweenMethod":"linearNone","tween":true,"target":88,"key":"height","index":0},{"value":128,"tweenMethod":"linearNone","tween":true,"target":88,"key":"height","index":40},{"value":120,"tweenMethod":"linearNone","tween":true,"target":88,"label":null,"key":"height","index":80}]}}],"name":"ani1","id":1,"frameRate":24,"action":2}]};
		override protected function createChildren():void {
			View.regComponent("AdvImage",AdvImage);
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}