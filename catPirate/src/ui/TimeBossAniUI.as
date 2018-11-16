/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class TimeBossAniUI extends View {
		public var ani1:FrameAnimation;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Box","props":{"y":0,"x":0,"width":640,"height":1135,"alpha":2},"child":[{"type":"Box","props":{"y":1,"x":1,"scaleY":1,"centerY":0,"centerX":0},"compId":8,"child":[{"type":"Image","props":{"y":0,"x":-1,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":192}},{"type":"Image","props":{"y":26,"x":39,"width":562,"skin":"ui/common_ef/bosscome.PNG","height":129}}]},{"type":"Label","props":{"y":687,"x":137,"wordWrap":true,"width":362,"text":"作战准备","strokeColor":"#000000","stroke":1,"height":47,"fontSize":28,"font":"Microsoft YaHei","color":"#ffffff","bold":true,"align":"center"}}]}],"animations":[{"nodes":[{"target":8,"keyframes":{"y":[{"value":672,"tweenMethod":"linearNone","tween":true,"target":8,"key":"y","index":0},{"value":672,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"y","index":5},{"value":672,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"y","index":7},{"value":672,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"y","index":9},{"value":672,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"y","index":11},{"value":672,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"y","index":13}],"x":[{"value":320,"tweenMethod":"linearNone","tween":true,"target":8,"key":"x","index":0},{"value":320,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"x","index":5},{"value":320,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"x","index":7},{"value":320,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"x","index":9},{"value":320,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"x","index":11},{"value":320,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"x","index":13}],"skewX":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":8,"key":"skewX","index":0},{"value":0,"tweenMethod":"linearNone","tween":true,"target":8,"key":"skewX","index":5},{"value":-20,"tweenMethod":"linearNone","tween":true,"target":8,"key":"skewX","index":7},{"value":0,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"skewX","index":9},{"value":10,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"skewX","index":11},{"value":0,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"skewX","index":13}],"scaleY":[{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"key":"scaleY","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"key":"scaleY","index":7},{"value":1.5,"tweenMethod":"linearNone","tween":true,"target":8,"key":"scaleY","index":9},{"value":0.8,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"scaleY","index":11},{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"scaleY","index":13}],"scaleX":[{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"key":"scaleX","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"key":"scaleX","index":9},{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"scaleX","index":11},{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"scaleX","index":13}],"centerY":[{"value":-57,"tweenMethod":"linearNone","tween":true,"target":8,"key":"centerY","index":9},{"value":7,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"centerY","index":11}],"centerX":[{"value":-650,"tweenMethod":"linearNone","tween":true,"target":8,"key":"centerX","index":0},{"value":0,"tweenMethod":"linearNone","tween":true,"target":8,"key":"centerX","index":5},{"value":0,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"centerX","index":7},{"value":0,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"centerX","index":9},{"value":0,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"centerX","index":11},{"value":0,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"centerX","index":13}],"anchorY":[{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"key":"anchorY","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"anchorY","index":5},{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"anchorY","index":7},{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"anchorY","index":9},{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"anchorY","index":11},{"value":1,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"anchorY","index":13}],"anchorX":[{"value":0.5,"tweenMethod":"linearNone","tween":true,"target":8,"key":"anchorX","index":0},{"value":0.5,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"anchorX","index":5},{"value":0.5,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"anchorX","index":7},{"value":0.5,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"anchorX","index":9},{"value":0.5,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"anchorX","index":11},{"value":0.5,"tweenMethod":"linearNone","tween":true,"target":8,"label":null,"key":"anchorX","index":13}]}}],"name":"ani1","id":1,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}