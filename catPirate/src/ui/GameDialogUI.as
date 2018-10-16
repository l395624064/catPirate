/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;

	public class GameDialogUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"y":5,"x":4,"width":627,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":248}},{"type":"Image","props":{"y":38,"x":12,"width":200,"skin":"ui/common/shipmate_1.png","height":200}},{"type":"Image","props":{"y":38,"x":424,"width":200,"skin":"ui/common/shipsoldier_1.png","height":200}},{"type":"Image","props":{"y":57,"x":334,"width":80,"skin":"ui/common_ef/q6.png","height":80}},{"type":"Image","props":{"y":56,"x":304,"width":80,"skin":"ui/common_ef/q7.png","scaleX":-1,"height":80}},{"type":"Image","props":{"y":956,"x":11,"width":627,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":65}},{"type":"Image","props":{"y":278,"x":6,"width":627,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":646}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}