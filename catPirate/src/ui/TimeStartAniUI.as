/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class TimeStartAniUI extends View {
		public var into:FrameAnimation;
		public var out:FrameAnimation;
		public var bmask:Image;
		public var panelbox:Box;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0,"alpha":2},"child":[{"type":"Image","props":{"y":490,"x":-649,"width":651,"skin":"ui/common_ex/blank.png","skewY":-5.5,"sizeGrid":"2,2,2,2","height":192},"compId":2},{"type":"Label","props":{"y":687,"x":137,"wordWrap":true,"width":362,"visible":false,"text":"轻点继续","strokeColor":"#000000","stroke":1,"height":47,"fontSize":28,"font":"Microsoft YaHei","color":"#ffffff","bold":true,"align":"center"}},{"type":"Animation","props":{"y":474,"x":-647,"width":300,"source":"TimeStart.ani","scaleY":1.5,"scaleX":1.5,"interval":100,"height":119,"autoPlay":true},"compId":10}]}],"animations":[{"nodes":[{"target":2,"keyframes":{"y":[{"value":483,"tweenMethod":"linearNone","tween":true,"target":2,"key":"y","index":0},{"value":331,"tweenMethod":"linearNone","tween":true,"target":2,"key":"y","index":5}],"x":[{"value":-657,"tweenMethod":"linearNone","tween":true,"target":2,"key":"x","index":0},{"value":-2,"tweenMethod":"linearNone","tween":true,"target":2,"key":"x","index":5}],"skewY":[{"value":-7,"tweenMethod":"linearNone","tween":true,"target":2,"key":"skewY","index":0},{"value":-6,"tweenMethod":"linearNone","tween":true,"target":2,"key":"skewY","index":10}]}},{"target":10,"keyframes":{"y":[{"value":474,"tweenMethod":"linearNone","tween":true,"target":10,"key":"y","index":0},{"value":315,"tweenMethod":"linearNone","tween":true,"target":10,"key":"y","index":10}],"x":[{"value":-647,"tweenMethod":"linearNone","tween":true,"target":10,"key":"x","index":0},{"value":-647,"tweenMethod":"linearNone","tween":true,"target":10,"label":null,"key":"x","index":5},{"value":1,"tweenMethod":"linearNone","tween":true,"target":10,"label":null,"key":"x","index":10}]}}],"name":"into","id":1,"frameRate":24,"action":0},{"nodes":[{"target":2,"keyframes":{"y":[{"value":331,"tweenMethod":"linearNone","tween":true,"target":2,"label":null,"key":"y","index":0},{"value":331,"tweenMethod":"linearNone","tween":true,"target":2,"label":null,"key":"y","index":5},{"value":266,"tweenMethod":"linearNone","tween":true,"target":2,"label":null,"key":"y","index":10}],"x":[{"value":-2,"tweenMethod":"linearNone","tween":true,"target":2,"label":null,"key":"x","index":0},{"value":-2,"tweenMethod":"linearNone","tween":true,"target":2,"label":null,"key":"x","index":5},{"value":646,"tweenMethod":"linearNone","tween":true,"target":2,"label":null,"key":"x","index":10}]}},{"target":10,"keyframes":{"y":[{"value":315,"tweenMethod":"linearNone","tween":true,"target":10,"label":null,"key":"y","index":0},{"value":226,"tweenMethod":"linearNone","tween":true,"target":10,"label":null,"key":"y","index":5}],"x":[{"value":1,"tweenMethod":"linearNone","tween":true,"target":10,"label":null,"key":"x","index":0},{"value":782,"tweenMethod":"linearNone","tween":true,"target":10,"key":"x","index":5}]}}],"name":"out","id":1,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}