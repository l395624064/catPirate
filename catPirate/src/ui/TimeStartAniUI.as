/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class TimeStartAniUI extends View {
		public var ani1:FrameAnimation;
		public var ani2:FrameAnimation;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Box","props":{"y":0,"x":0,"width":640,"height":1135},"child":[{"type":"Box","props":{"y":472,"x":1,"centerY":0,"centerX":0},"compId":5,"child":[{"type":"Image","props":{"y":0,"x":-1,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":192}},{"type":"Image","props":{"y":26,"x":85,"width":478,"skin":"ui/common_ef/start.png","height":129}}]},{"type":"Label","props":{"y":687,"x":137,"wordWrap":true,"width":362,"text":"轻点继续","strokeColor":"#000000","stroke":1,"height":47,"fontSize":28,"font":"Microsoft YaHei","color":"#ffffff","bold":true,"align":"center"},"compId":6}]}],"animations":[{"nodes":[{"target":5,"keyframes":{"x":[{"value":1,"tweenMethod":"linearNone","tween":true,"target":5,"key":"x","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":5,"key":"x","index":5}],"scaleY":[{"value":1,"tweenMethod":"linearNone","tween":true,"target":5,"key":"scaleY","index":0},{"value":0.8,"tweenMethod":"linearNone","tween":true,"target":5,"key":"scaleY","index":7},{"value":1.2,"tweenMethod":"linearNone","tween":true,"target":5,"key":"scaleY","index":9},{"value":1,"tweenMethod":"linearNone","tween":true,"target":5,"key":"scaleY","index":12}],"centerX":[{"value":641,"tweenMethod":"linearNone","tween":true,"target":5,"key":"centerX","index":0},{"value":0,"tweenMethod":"linearNone","tween":true,"target":5,"key":"centerX","index":5}]}}],"name":"ani1","id":1,"frameRate":24,"action":0},{"nodes":[{"target":6,"keyframes":{"x":[{"value":137,"tweenMethod":"linearNone","tween":true,"target":6,"key":"x","index":0},{"value":137,"tweenMethod":"linearNone","tween":true,"target":6,"key":"x","index":10},{"value":137,"tweenMethod":"linearNone","tween":true,"target":6,"key":"x","index":20},{"value":137,"tweenMethod":"linearNone","tween":true,"target":6,"label":null,"key":"x","index":31}],"alpha":[{"value":1,"tweenMethod":"linearNone","tween":true,"target":6,"key":"alpha","index":0},{"value":0,"tweenMethod":"linearNone","tween":true,"target":6,"key":"alpha","index":10},{"value":1,"tweenMethod":"linearNone","tween":true,"target":6,"key":"alpha","index":20}]}}],"name":"ani2","id":2,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}