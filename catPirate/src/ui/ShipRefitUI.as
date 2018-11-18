/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class ShipRefitUI extends View {
		public var bmask:Image;
		public var panelbox:Box;
		public var modelist:List;
		public var scrollleftBtn:Image;
		public var scrollrightBtn:Image;
		public var closeBtn:Image;
		public var tabBtn:Tab;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"height":1136},"child":[{"type":"Image","props":{"width":1080,"var":"bmask","skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","height":2244,"centerY":0,"centerX":0}},{"type":"Box","props":{"width":640,"var":"panelbox","height":1136,"centerY":0,"centerX":0},"child":[{"type":"Box","props":{"y":778,"x":0,"width":640,"height":358,"centerX":0,"bottom":0},"child":[{"type":"Image","props":{"y":59,"width":639,"skin":"ui/common_ex/d.png","sizeGrid":"25,23,28,26","height":297,"centerX":-3}},{"type":"List","props":{"y":63,"x":10,"width":640,"var":"modelist","spaceX":0,"repeatY":1,"repeatX":1,"mouseEnabled":false,"height":293},"child":[{"type":"Box","props":{"y":19,"x":3,"width":630,"renderType":"render","height":264},"child":[{"type":"Box","props":{"y":-22,"x":80,"scaleY":1,"scaleX":1,"name":"popimg_box"},"child":[{"type":"Image","props":{"width":230,"skin":"ui/common_ex/ptdk.png","height":230}},{"type":"Image","props":{"y":25,"x":26,"width":180,"sizeGrid":"0,0,0,0","name":"pop_img","height":180}},{"type":"Image","props":{"y":175,"x":21,"width":190,"skin":"ui/common_ex/p5.png","sizeGrid":"11,13,12,14","height":31}},{"type":"Text","props":{"y":181,"x":34,"width":166,"text":"基础组件","strokeColor":"#ffffff","stroke":3,"name":"popname_txt","height":23,"fontSize":20,"font":"SimHei","color":"#0099ff","bold":true,"align":"left"}},{"type":"Image","props":{"y":18,"x":13,"width":200,"skin":"ui/common_ex/p5.png","sizeGrid":"3,3,3,3","name":"lock_img","height":197},"child":[{"type":"Image","props":{"y":105,"x":152,"width":79,"skin":"ui/common_ex/lock.png","height":95}}]}]},{"type":"Box","props":{"y":76,"x":344,"name":"proBar_box"},"child":[{"type":"ProgressBar","props":{"y":0,"x":63,"width":151,"value":1,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","name":"pronum0","height":30}},{"type":"ProgressBar","props":{"y":38,"x":63,"width":151,"value":1,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","name":"pronum1","height":30}},{"type":"ProgressBar","props":{"y":76,"x":63,"width":151,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","name":"pronum2","height":30}},{"type":"ProgressBar","props":{"y":114,"x":63,"width":151,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","name":"pronum3","height":30}},{"type":"ProgressBar","props":{"y":152,"x":63,"width":151,"skin":"ui/common_ex/p0.png","sizeGrid":"8,10,8,10","name":"pronum4","height":30}},{"type":"Text","props":{"y":3,"width":48,"text":"耐久","strokeColor":"#224882","stroke":5,"name":"proname_txt0","height":24,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":41,"width":48,"text":"战斗","strokeColor":"#224882","stroke":5,"name":"proname_txt1","height":24,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":79,"width":48,"text":"学识","strokeColor":"#224882","stroke":5,"name":"proname_txt2","height":24,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":117,"width":48,"text":"速度","strokeColor":"#224882","stroke":5,"name":"proname_txt3","height":24,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Text","props":{"y":155,"width":48,"text":"感知","strokeColor":"#224882","stroke":5,"name":"proname_txt4","height":24,"fontSize":20,"font":"SimHei","color":"#ffffff","bold":true}},{"type":"Image","props":{"y":-5,"x":170,"width":39,"skin":"ui/common_ex/arrowsBtn2.png","name":"item0","height":35}},{"type":"Image","props":{"y":33,"x":170,"width":39,"skin":"ui/common_ex/arrowsBtn2.png","name":"item1","height":35}},{"type":"Image","props":{"y":71,"x":170,"width":39,"skin":"ui/common_ex/arrowsBtn2.png","name":"item2","height":35}},{"type":"Image","props":{"y":109,"x":170,"width":39,"skin":"ui/common_ex/arrowsBtn2.png","name":"item3","height":35}},{"type":"Image","props":{"y":147,"x":170,"width":39,"skin":"ui/common_ex/arrowsBtn2.png","name":"item4","height":35}}]},{"type":"Box","props":{"y":-6,"x":317,"name":"cost1_box"},"child":[{"type":"Image","props":{"y":17,"x":18,"width":116,"skin":"ui/common_ex/p11.png","sizeGrid":"11,18,10,14","height":36}},{"type":"Image","props":{"width":47,"skin":"ui/common_ef/gold.png","name":"cost1_img","height":54}},{"type":"Text","props":{"y":27,"x":48,"width":78,"text":"100000","strokeColor":"#224882","stroke":5,"name":"cost1_txt","height":24,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true}}]},{"type":"Box","props":{"y":-6,"x":476,"name":"cost2_box"},"child":[{"type":"Image","props":{"y":17,"x":18,"width":116,"skin":"ui/common_ex/p11.png","sizeGrid":"11,18,10,14","height":36}},{"type":"Image","props":{"width":47,"skin":"ui/common_ef/plank.png","name":"cost2_img","height":54}},{"type":"Text","props":{"y":27,"x":48,"width":78,"text":"100000","strokeColor":"#224882","stroke":5,"name":"cost2_txt","height":24,"fontSize":25,"font":"SimHei","color":"#ffffff","bold":true}}]},{"type":"Button","props":{"y":197,"x":107,"width":178,"stateNum":1,"skin":"ui/common_ex/btn_s_r.png","sizeGrid":"24,27,25,33","name":"buyBtn","labelStrokeColor":"#5d1514","labelStroke":2,"labelSize":35,"labelPadding":"0,0,0,5","labelFont":"SimHei","labelColors":"#ffffff","label":"购买","hitTestPrior":true,"height":72}}]}]},{"type":"Image","props":{"y":158,"x":15,"width":58,"var":"scrollleftBtn","skin":"ui/common_ex/friendRank_close.png","height":88}},{"type":"Image","props":{"y":158,"x":587,"width":58,"var":"scrollrightBtn","skin":"ui/common_ex/friendRank_open.png","height":88}},{"type":"Image","props":{"width":107,"var":"closeBtn","skin":"ui/common_ex/closeBtn.png","right":9,"height":107,"bottom":273}},{"type":"Tab","props":{"y":7,"x":21,"width":501,"var":"tabBtn","skin":"ui/common_ex/tab.png","selectedIndex":0,"left":9,"labels":"船体,船帆,船舱,船杆","labelSize":30,"labelPadding":"5,0,0,0","labelFont":"SimHei","labelColors":"#ffffff","height":56,"bottom":295}}]}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}