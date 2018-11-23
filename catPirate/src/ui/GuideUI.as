/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*;
	import laya.display.Text;

	public class GuideUI extends View {
		public var guideTip:Box;
		public var confirmBtn:Button;
		public var cancelBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":640,"mouseThrough":true,"height":1136},"child":[{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"var":"guideTip","height":1136},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Image","props":{"y":515,"x":66,"width":498,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":196}},{"type":"Text","props":{"y":566,"x":227,"wordWrap":true,"width":305,"text":"进入新手引导,可以获得礼包嚯!","strokeColor":"#a43c6d","stroke":6,"height":67,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Button","props":{"y":626,"x":246,"width":94,"var":"confirmBtn","stateNum":1,"skin":"ui/common_ex/btn_s_y.png","sizeGrid":"24,27,25,33","labelStrokeColor":"#5d1514","labelStroke":5,"labelSize":18,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"进入","hitTestPrior":true,"height":65}},{"type":"Button","props":{"y":626,"x":421,"width":97,"var":"cancelBtn","stateNum":1,"skin":"ui/common_ex/btn_s_r.png","sizeGrid":"24,27,25,33","labelStrokeColor":"#5d1514","labelStroke":5,"labelSize":18,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"取消","hitTestPrior":true,"height":65}},{"type":"Image","props":{"y":569,"x":90,"width":119,"skin":"ui/common_img/role3.png","height":116}}]},{"type":"Box","props":{"y":0,"x":0,"visible":false,"name":"taskBox_1","mouseThrough":true,"mouseEnabled":true},"child":[{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_1","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":338,"x":77,"width":1,"name":"area","height":1},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":1,"lineWidth":1,"height":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":1136,"alpha":0}},{"type":"Image","props":{"y":354,"x":88,"width":439,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":184}},{"type":"Image","props":{"y":407,"x":113,"width":115,"skin":"ui/common_img/role3.png","height":104}},{"type":"Button","props":{"y":464,"x":413,"width":94,"stateNum":1,"skin":"ui/common_ex/btn_s_r.png","sizeGrid":"24,27,25,33","name":"nextBtn","labelStrokeColor":"#5d1514","labelStroke":5,"labelSize":18,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"next","hitTestPrior":true,"height":57}},{"type":"Text","props":{"y":436,"x":274,"wordWrap":true,"width":189,"text":"俺系你滴导师","strokeColor":"#a43c6d","stroke":6,"height":35,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Text","props":{"y":382,"x":184,"wordWrap":true,"width":271,"text":"欢迎来到<钓了个鱼>","strokeColor":"#a43c6d","stroke":6,"height":35,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_2","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":730,"x":18,"width":602,"name":"area","height":231},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":602,"lineWidth":1,"height":243,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":732,"alpha":0}},{"type":"Image","props":{"y":965,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":172,"alpha":0}},{"type":"Image","props":{"y":551,"x":95,"width":415,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":169}},{"type":"Text","props":{"y":609,"x":277,"wordWrap":true,"width":200,"text":"点击以下区域,扔下鱼钩","strokeColor":"#a43c6d","stroke":6,"height":62,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Image","props":{"y":589,"x":119,"width":148,"skin":"ui/common_img/role1.png","height":104}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_3","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":813,"x":18,"width":602,"name":"area","height":156},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":602,"lineWidth":1,"height":161,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":812,"alpha":0}},{"type":"Image","props":{"y":968,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":170,"alpha":0}},{"type":"Image","props":{"y":610,"x":90,"width":490,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":197}},{"type":"Image","props":{"y":660,"x":115,"width":140,"skin":"ui/common_img/role2.png","height":120}},{"type":"Text","props":{"y":672,"x":257,"wordWrap":true,"width":301,"text":"再次点击可以收杆啦！(鱼钩越靠近色块中间,奖励越高哦)","strokeColor":"#a43c6d","stroke":6,"height":96,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_4","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":1,"x":491,"width":148,"name":"area","height":175},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":150,"lineWidth":1,"height":181,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":1136,"alpha":0}},{"type":"Image","props":{"y":71,"x":113,"width":357,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":195}},{"type":"Text","props":{"y":113,"x":257,"wordWrap":true,"width":168,"text":"金币,海星和珍珠是你最宝贵的财富哟！","strokeColor":"#a43c6d","stroke":6,"height":93,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Image","props":{"y":127,"x":136,"width":119,"skin":"ui/common_img/role3.png","height":113}},{"type":"Button","props":{"y":193,"x":351,"width":94,"stateNum":1,"skin":"ui/common_ex/btn_s_r.png","sizeGrid":"24,27,25,33","name":"nextBtn","labelStrokeColor":"#5d1514","labelStroke":5,"labelSize":18,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"next","hitTestPrior":true,"height":57}}]}]},{"type":"Box","props":{"y":0,"x":0,"visible":false,"name":"taskBox_2","mouseThrough":true,"mouseEnabled":true},"child":[{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_1","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":258,"x":-3,"width":100,"name":"area","height":100},"child":[{"type":"Circle","props":{"y":50,"x":50,"radius":50,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":644,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":267,"alpha":0}},{"type":"Image","props":{"y":370,"x":0,"width":644,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":612,"alpha":0}},{"type":"Image","props":{"y":259,"x":110,"width":531,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":148,"alpha":0}},{"type":"Image","props":{"y":296,"x":159,"width":374,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":168}},{"type":"Text","props":{"y":341,"x":197,"wordWrap":true,"width":184,"text":"让我们在转转乐里获得更多金币吧！","strokeColor":"#a43c6d","stroke":6,"height":93,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Image","props":{"y":351,"x":379,"skin":"ui/common_img/role4.png"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_2","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":298,"x":459,"width":100,"name":"area","height":100},"child":[{"type":"Circle","props":{"y":50,"x":50,"radius":50,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":643,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":295,"alpha":0}},{"type":"Image","props":{"y":410,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":723,"alpha":0}},{"type":"Image","props":{"y":176,"x":520,"width":124,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":151,"alpha":0}},{"type":"Image","props":{"y":142,"x":110,"width":345,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":143}},{"type":"Image","props":{"y":118,"x":277,"width":146,"skin":"ui/common_img/role6.png","scaleX":-1,"height":139}},{"type":"Text","props":{"y":190,"x":273,"wordWrap":true,"width":166,"text":"让我们来看下倍率说明","strokeColor":"#a43c6d","stroke":6,"height":70,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_3","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":206,"x":535,"width":100,"name":"area","height":100},"child":[{"type":"Circle","props":{"y":50,"x":50,"radius":50,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":643,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":203,"alpha":0}},{"type":"Image","props":{"y":308,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":825,"alpha":0}},{"type":"Image","props":{"y":124,"x":0,"width":535,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":243,"alpha":0}},{"type":"Image","props":{"y":97,"x":96,"width":397,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":180}},{"type":"Image","props":{"y":141,"x":273,"width":155,"skin":"ui/common_img/role4.png","scaleX":-1,"height":110}},{"type":"Text","props":{"y":153,"x":279,"wordWrap":true,"width":166,"text":"规则会时常更新哦,记得多看看牙","strokeColor":"#a43c6d","stroke":6,"height":70,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_4","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":752,"x":115,"width":200,"name":"area","height":80},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":200,"lineWidth":1,"height":80,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":642,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":731,"alpha":0}},{"type":"Image","props":{"y":667,"x":335,"width":305,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":272,"alpha":0}},{"type":"Image","props":{"y":862,"x":0,"width":642,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":272,"alpha":0}},{"type":"Image","props":{"y":912,"x":261,"width":305,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":143}},{"type":"Image","props":{"y":936,"x":422,"skin":"ui/common_img/role8.png"}},{"type":"Text","props":{"y":945,"x":315,"wordWrap":true,"width":126,"text":"让我们转起来!","strokeColor":"#a43c6d","stroke":6,"height":70,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_5","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":400,"x":130,"width":380,"name":"area","height":320},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":380,"lineWidth":1,"height":320,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":1136,"alpha":0}},{"type":"Image","props":{"y":805,"x":213,"width":318,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":154}},{"type":"Image","props":{"y":800,"x":371,"width":144,"skin":"ui/common_img/role6.png","height":136}},{"type":"Text","props":{"y":854,"x":244,"wordWrap":true,"width":150,"text":"稍等片刻.祈祷好运","strokeColor":"#a43c6d","stroke":6,"height":70,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_6","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":409,"x":122,"width":400,"name":"area","height":400},"child":[{"type":"Circle","props":{"y":200,"x":200,"radius":200,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":383,"alpha":0}},{"type":"Image","props":{"y":819,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":319,"alpha":0}},{"type":"Image","props":{"y":812,"x":221,"width":340,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":158}},{"type":"Text","props":{"y":848,"x":266,"wordWrap":true,"width":166,"text":"吼,中大奖了呢(其实是送你的)","strokeColor":"#a43c6d","stroke":6,"height":70,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Image","props":{"y":851,"x":409,"skin":"ui/common_img/role8.png"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_7","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":201,"x":521,"width":120,"name":"area","height":120},"child":[{"type":"Circle","props":{"y":60,"x":60,"radius":60,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":201,"alpha":0}},{"type":"Image","props":{"y":315,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":823,"alpha":0}},{"type":"Image","props":{"y":134,"x":0,"width":524,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":258,"alpha":0}},{"type":"Image","props":{"y":117,"x":178,"width":335,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":162}},{"type":"Image","props":{"y":167,"x":324,"skin":"ui/common_img/role4.png","scaleX":-1}},{"type":"Text","props":{"y":159,"x":315,"wordWrap":true,"width":166,"text":"转转乐每天都会刷新,记得常来哦","strokeColor":"#a43c6d","stroke":6,"height":70,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]}]},{"type":"Box","props":{"y":0,"x":0,"visible":false,"name":"taskBox_3","mouseThrough":true,"mouseEnabled":true},"child":[{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_1","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":177,"x":2,"width":90,"name":"area","height":90},"child":[{"type":"Circle","props":{"y":45,"x":45,"radius":45,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":644,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":178,"alpha":0}},{"type":"Image","props":{"y":268,"x":0,"width":644,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":714,"alpha":0}},{"type":"Image","props":{"y":136,"x":100,"width":541,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":271,"alpha":0}},{"type":"Image","props":{"y":132,"x":117,"width":354,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":181}},{"type":"Text","props":{"y":183,"x":149,"wordWrap":true,"width":166,"text":"刚才获得的宝箱都在这里哟","strokeColor":"#a43c6d","stroke":6,"height":70,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Image","props":{"y":146,"x":293,"skin":"ui/common_img/role5.png"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_2","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":193,"x":565,"width":70,"name":"area","height":120},"child":[{"type":"Rect","props":{"width":70,"lineWidth":1,"height":120,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":643,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":189,"alpha":0}},{"type":"Image","props":{"y":320,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":813,"alpha":0}},{"type":"Image","props":{"y":158,"x":0,"width":558,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":206,"alpha":0}},{"type":"Image","props":{"y":19,"x":99,"width":380,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":179}},{"type":"Image","props":{"y":33,"x":121,"width":146,"skin":"ui/common_img/role3.png","scaleX":1,"height":139}},{"type":"Text","props":{"y":73,"x":281,"wordWrap":true,"width":166,"text":"让我们来找到刚才的宝箱吧","strokeColor":"#a43c6d","stroke":6,"height":70,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_3","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":180,"x":81,"width":485,"name":"area","height":683},"child":[{"type":"Rect","props":{"width":485,"lineWidth":1,"height":683,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":643,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":186,"alpha":0}},{"type":"Image","props":{"y":849,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":284,"alpha":0}},{"type":"Image","props":{"y":124,"x":0,"width":327,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":235,"alpha":0}},{"type":"Image","props":{"y":712,"x":237,"width":372,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":181}},{"type":"Image","props":{"y":740,"x":439,"skin":"ui/common_img/role9.png"}},{"type":"Text","props":{"y":764,"x":274,"wordWrap":true,"width":166,"text":"把宝箱拖进来,将会有好事发生哦!","strokeColor":"#a43c6d","stroke":6,"height":70,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_4","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":400,"x":130,"width":380,"name":"area","height":320},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":380,"lineWidth":1,"height":320,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":1136,"alpha":0}},{"type":"Image","props":{"y":804,"x":214,"width":322,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":156}},{"type":"Image","props":{"y":800,"x":369,"width":144,"skin":"ui/common_img/role6.png","height":136}},{"type":"Text","props":{"y":866,"x":248,"wordWrap":true,"width":138,"text":"好运快来,好运快来","strokeColor":"#a43c6d","stroke":6,"height":70,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_5","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":409,"x":122,"width":400,"name":"area","height":400},"child":[{"type":"Circle","props":{"y":200,"x":200,"radius":200,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":383,"alpha":0}},{"type":"Image","props":{"y":819,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":319,"alpha":0}},{"type":"Image","props":{"y":809,"x":227,"width":317,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":159}},{"type":"Text","props":{"y":854,"x":263,"wordWrap":true,"width":150,"text":"哇哦,开到好东西了呢","strokeColor":"#a43c6d","stroke":6,"height":63,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Image","props":{"y":848,"x":400,"skin":"ui/common_img/role8.png"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_6","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":38,"x":519,"width":120,"name":"area","height":120},"child":[{"type":"Circle","props":{"y":60,"x":60,"radius":60,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":513,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":197,"alpha":0}},{"type":"Image","props":{"y":167,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":971,"alpha":0}},{"type":"Image","props":{"y":40,"x":146,"width":341,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":163}},{"type":"Image","props":{"y":88,"x":295,"skin":"ui/common_img/role4.png","scaleX":-1}},{"type":"Text","props":{"y":77,"x":293,"wordWrap":true,"width":150,"text":"开箱越多,幸运值越高哟!","strokeColor":"#a43c6d","stroke":6,"height":63,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]}]},{"type":"Box","props":{"y":0,"x":0,"visible":false,"name":"taskBox_4","mouseThrough":true,"mouseEnabled":true},"child":[{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_1","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":180,"x":556,"width":90,"name":"area","height":90},"child":[{"type":"Circle","props":{"y":45,"x":45,"radius":45,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":644,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":178,"alpha":0}},{"type":"Image","props":{"y":268,"x":0,"width":644,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":714,"alpha":0}},{"type":"Image","props":{"y":136,"x":0,"width":558,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":271,"alpha":0}},{"type":"Image","props":{"y":57,"x":179,"width":347,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":175}},{"type":"Text","props":{"y":103,"x":344,"wordWrap":true,"width":150,"text":"接下来我们去商店买点东西","strokeColor":"#a43c6d","stroke":6,"height":63,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Image","props":{"y":67,"x":351,"skin":"ui/common_img/role5.png","scaleX":-1}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_2","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":350,"x":493,"width":102,"name":"area","height":57},"child":[{"type":"Rect","props":{"width":102,"lineWidth":1,"height":57,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":643,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":346,"alpha":0}},{"type":"Image","props":{"y":417,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":716,"alpha":0}},{"type":"Image","props":{"y":16,"x":80,"width":386,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":184}},{"type":"Image","props":{"y":35,"x":102,"width":146,"skin":"ui/common_img/role3.png","scaleX":1,"height":139}},{"type":"Text","props":{"y":71,"x":255,"wordWrap":true,"width":188,"text":"升级后可增加最大重量及出现概率哟","strokeColor":"#a43c6d","stroke":6,"height":63,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_3","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":689,"x":147,"width":151,"name":"area","height":70},"child":[{"type":"Rect","props":{"width":151,"lineWidth":1,"height":70,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":643,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":671,"alpha":0}},{"type":"Image","props":{"y":784,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":349,"alpha":0}},{"type":"Image","props":{"y":435,"x":319,"width":313,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":426,"alpha":0}},{"type":"Image","props":{"y":781,"x":103,"width":413,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":185}},{"type":"Text","props":{"y":839,"x":302,"wordWrap":true,"width":198,"text":"升级等级越高,需要花费越高,请留心","strokeColor":"#a43c6d","stroke":6,"height":63,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Image","props":{"y":836,"x":128,"width":171,"skin":"ui/common_img/role1.png","height":103}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_4","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":689,"x":147,"width":1,"name":"area","height":1},"child":[{"type":"Rect","props":{"width":1,"lineWidth":1,"height":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":1136,"alpha":0}},{"type":"Image","props":{"y":656,"x":137,"width":430,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":199}},{"type":"Image","props":{"y":697,"x":379,"width":171,"skin":"ui/common_img/role8.png","height":134}},{"type":"Button","props":{"y":784,"x":454,"width":94,"stateNum":1,"skin":"ui/common_ex/btn_s_r.png","sizeGrid":"24,27,25,33","name":"nextBtn","labelStrokeColor":"#5d1514","labelStroke":5,"labelSize":18,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"next","hitTestPrior":true,"height":57}},{"type":"Text","props":{"y":702,"x":186,"wordWrap":true,"width":198,"text":"小鱼重量虽不及大鱼,但是combo后能钓起很多哟","strokeColor":"#a43c6d","stroke":6,"height":63,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_5","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":120,"alpha":0}},{"type":"Image","props":{"y":209,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":926,"alpha":0}},{"type":"Image","props":{"y":33,"x":0,"width":548,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":264,"alpha":0}},{"type":"Sprite","props":{"y":119,"x":552,"width":90,"name":"area","height":90},"child":[{"type":"Circle","props":{"y":45,"x":45,"radius":45,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":69,"x":115,"width":387,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":185}},{"type":"Text","props":{"y":126,"x":278,"wordWrap":true,"width":198,"text":"每种鱼的特性都不一样,请留心观察","strokeColor":"#a43c6d","stroke":6,"height":63,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Image","props":{"y":94,"x":279,"width":144,"skin":"ui/common_img/role6.png","scaleX":-1,"height":136}}]}]},{"type":"Box","props":{"y":0,"x":0,"visible":false,"name":"taskBox_5","mouseThrough":true,"mouseEnabled":true},"child":[{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_1","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":540,"x":533,"width":1,"name":"area","height":1},"child":[{"type":"Circle","props":{"y":45,"x":45,"radius":1,"lineWidth":1,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":644,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":178,"alpha":0}},{"type":"Image","props":{"y":268,"x":0,"width":644,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":714,"alpha":0}},{"type":"Image","props":{"y":136,"x":0,"width":558,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":271,"alpha":0}},{"type":"Image","props":{"y":518,"x":314,"width":75,"skin":"ui/common_img/role3.png","height":73}},{"type":"Image","props":{"y":503,"x":393,"width":103,"skin":"ui/common_img/role9.png","height":90}},{"type":"Image","props":{"y":500,"x":311,"width":123,"skin":"ui/common_img/role8.png","scaleX":-1,"height":92}},{"type":"Image","props":{"y":582,"x":176,"width":339,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":150}},{"type":"Text","props":{"y":607,"x":250,"wordWrap":true,"width":198,"text":"据说伟大的秘宝就隐藏在这片海域之中!","strokeColor":"#a43c6d","stroke":6,"height":63,"fontSize":30,"font":"SimHei","color":"#ffffff"}},{"type":"Button","props":{"y":680,"x":416,"width":94,"stateNum":1,"skin":"ui/common_ex/btn_s_r.png","sizeGrid":"24,27,25,33","name":"nextBtn","labelStrokeColor":"#5d1514","labelStroke":5,"labelSize":18,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"next","hitTestPrior":true,"height":57}}]},{"type":"Box","props":{"y":0,"x":0,"width":640,"visible":false,"name":"stepbox_2","mouseThrough":true,"mouseEnabled":true,"height":1136,"cacheAs":"bitmap"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"bg","height":1136}},{"type":"Sprite","props":{"y":583,"x":193,"width":287,"name":"area","height":128},"child":[{"type":"Rect","props":{"width":287,"lineWidth":1,"height":128,"fillColor":"#ff0000"}}]},{"type":"Image","props":{"y":0,"x":0,"width":643,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":575,"alpha":0}},{"type":"Image","props":{"y":702,"x":0,"width":640,"skin":"ui/common_ex/blank.png","sizeGrid":"2,2,2,2","name":"item0","mouseEnabled":true,"height":431,"alpha":0}},{"type":"Image","props":{"y":722,"x":151,"width":405,"skin":"ui/common_ex/word-di.png","sizeGrid":"23,38,28,31","height":182}},{"type":"Image","props":{"y":729,"x":176,"width":153,"skin":"ui/common_img/role3.png","height":149}},{"type":"Text","props":{"y":776,"x":335,"wordWrap":true,"width":198,"text":"不过在此之前,还是勤加练习吧!","strokeColor":"#a43c6d","stroke":6,"height":63,"fontSize":30,"font":"SimHei","color":"#ffffff"}}]}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}