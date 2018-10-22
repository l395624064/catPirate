package view.gamemap
{
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.map.GridSprite;
	import laya.map.MapLayer;
	import laya.map.TiledMap;
	import laya.maths.Point;
	import laya.maths.Rectangle;
	import laya.ui.Image;
	import laya.utils.Handler;
	
	import manager.UiManager;
	
	import src.GameConfig;
	
	import view.PanelVo;
	import ui.GameMapUI;
	
	public class Gamemap extends GameMapUI implements PanelVo
	{
		public static var _instance:Gamemap;
		
		private var tilemap:TiledMap;
		private var mapX:Number = 0;
		private var mapY:Number = 0;
		private var lastMouseX:Number = 0;
		private var lastMouseY:Number = 0;
		private var ship:Image;
		private var shipPoint:Point = new Point(200, 100);
		private var drawsideSp:Sprite;
		private var canmapMove:Boolean = true;
		
		private var myship:GridSprite;

        private var closeList:Array = [];
        private var openList:Array = [];
		private var waylist:Array=[];
        private var targetGrid:GridMsg;

        private var startGrid:GridMsg;
        private var endGrid:GridMsg;

		private var ifdrawTestGrid:Boolean=true;
		private var testgridSp:Sprite;
		private var testgridArr:Array=[];


		public function Gamemap()
		{
			super();
		}
		
		public static function get instance():Gamemap
		{
			return _instance || (_instance = new Gamemap());
		}
		
		public function openPanel(param:Object = null):void
		{
			initListener();
			initNum();
		}
		
		private function initListener():void
		{
			this.closeBtn.on(Event.MOUSE_DOWN, this, closePanel);
			this.setRoadBtn.on(Event.MOUSE_DOWN, this, changeMapRoadState, ["start"]);
			this.overRoadBtn.on(Event.MOUSE_DOWN, this, changeMapRoadState, ["over"]);
		}
		
		private function initNum():void
		{
			tilemap = new TiledMap();
			var viewRect:Rectangle = new Rectangle(0, 0, mapPanel.width, mapPanel.height);
			var gridSize:Point = new Point(512, 512);
			tilemap.createMap("TiledMap/tileMap.json", viewRect, Handler.create(this, maploadComplete), null, gridSize);
		}
		
		private function maploadComplete():void
		{
			if (!ship)
			{
				ship = new Image();
				ship.skin = "ui/gamemap/shipImg.png";
				ship.pivot(ship.width / 4, ship.height);
			}
			//var layer:MapLayer=tilemap.getLayerByName("landlayer");
			//layer._childs[0].addChild(ship);
			myship = tilemap.getLayerObject("objlayer", "myship");
			myship.addChild(ship);
			//console.log("--ship:",ship);
			
			tilemap.setViewPortPivotByScale(0, 0);
			tilemap.scale = 1;
			tilemap.moveViewPort(mapX, mapY);
			mapPanel.addChild(tilemap.mapSprite());


            testgridSp=new Sprite();
            testgridSp.size(tilemap.width,tilemap.height);
            testgridSp.mouseEnabled=false;
            testgridSp.pos(tilemap.x, tilemap.y);
            mapPanel.addChild(testgridSp);

			mapPanel.on(Event.MOUSE_DOWN, this, onMapeDown);
			Laya.stage.on(Event.RESIZE, this, resize);
		}
		
		private function changeMapRoadState(action:String):void
		{
			if (action == "start")
			{
				canmapMove = false;
			}
			else if (action == "over")
			{
                drawsideSp.graphics.clear();
				canmapMove = true;
			}
		}
		
		private function onMapeDown():void
		{
			if (canmapMove)
			{
				//return;
				lastMouseX = mousePointInMap.x;
				lastMouseY = mousePointInMap.y;
				
				mapPanel.on(Event.MOUSE_MOVE, this, onMapMove);
				mapPanel.on(Event.MOUSE_OUT, this, onMapUp);
				Laya.stage.on(Event.MOUSE_UP, this, onMapUp);
			}
			else
			{
				drawChooseRect(getGridPoint("landlayer"));
				//get bast way
				clearWay();
				getBastWay();
			}
		}
		
		private function onMapMove():void
		{
			var moveX:Number = mapX - (mousePointInMap.x - lastMouseX);
			var moveY:Number = mapY - (mousePointInMap.y - lastMouseY);
			moveX = repairPoint(moveX, moveY).x;
			moveY = repairPoint(moveX, moveY).y;

			tilemap.moveViewPort(moveX, moveY);
            testgridSp.pos(tilemap.x, tilemap.y);
		}
		
		private function onMapUp():void
		{
			mapX = mapX - (mousePointInMap.x - lastMouseX);
			mapY = mapY - (mousePointInMap.y - lastMouseY);
			mapX = repairPoint(mapX, mapY).x;
			mapY = repairPoint(mapX, mapY).y;
			
			mapPanel.off(Event.MOUSE_MOVE, this, onMapMove);
			mapPanel.off(Event.MOUSE_OUT, this, onMapUp);
			Laya.stage.off(Event.MOUSE_UP, this, onMapUp);
		}
		
		private function resize():void
		{
			tilemap.changeViewPort(mapX, mapY, mapPanel.width, mapPanel.height);
		}
		
		private function repairPoint(cx:Number = 0, cy:Number = 0):Point
		{
			var p:Point = new Point(cx, cy);
			if (cx <= 0) p.x = 0;
			if (cx >= tilemap.width - mapPanel.width) p.x = tilemap.width - mapPanel.width;
			if (cy <= 0) p.y = 0;
			if (cy >= tilemap.height - mapPanel.height) p.y = tilemap.height - mapPanel.height;
			return p;
		}
		

		private function getBastWay():void
		{
			startGrid = new GridMsg(startPos);//startpos
			startGrid.pointer = new Point(startPos.x, startPos.y);
			closeList.push(startGrid);
			
			endGrid = new GridMsg(endPos);//endPos
			
			//console.log("-getIdFromPos:", getGridIdFromPos("landlayer", pos.x, pos.y));
			console.log("-startPos:", startPos);
			console.log("-endPos:", endPos,getGridId("landlayer"));

			findoutEndPoint();
		}
		
		private function clearWay():void
		{
            waylist=[];
			openList = [];
			closeList = [];

			startGrid = null;
			endGrid = null;
			targetGrid = null;

            testgridSp.removeChildren();
		}
		
		private function findoutEndPoint():void
		{
            targetGrid = closeList[closeList.length-1];
			var minFgrid:GridMsg;
			while (addOpenlist(targetGrid))
			{
				//get min F num From openlist,Find the gridMsg
				minFgrid=findoutMinFromOpenlist();
				//close list push the gridMsg,
                addCloselist(minFgrid);
				//check min G Num grid,or repair gridMsg F num, around gridMsg From openlist
				checkMinGirdAround(minFgrid);
                targetGrid = closeList[closeList.length-1];//target pos
			}
            console.log("--find out best way");
			console.log("-endPos:",openList[openList.length-1]);

            targetGrid=openList[openList.length-1];//reverse check
			var cx:int;
			var cy:int;
			while (targetGrid.dx!=startPos.x && targetGrid.dy!=startPos.y){
                waylist.push(targetGrid);
				cx=targetGrid.pointer.x;
				cy=targetGrid.pointer.y;
                targetGrid=findoutGrid(closeList,cx,cy);
				drawTestRect(cx,cy,"#ff17fb");
			}
		}

		public function get startPos():Point
		{
			var gridW:Number = tilemap.tileWidth;
			var gridH:Number = tilemap.tileHeight;
			var p:Point = new Point();
			p.x = Math.floor(myship.x / gridW);
			p.y = Math.floor(myship.y / gridH);
			//console.log("-myship Point:", myship.x/gridW, myship.y/gridH);
			return p;
		}
		
		public function get endPos():Point
		{
			var pos:Point = getGridPos("landlayer");
			//console.log("-id:", getGridId("landlayer"));
			return new Point(pos.x, pos.y);
		}

		//gridMsg get
		public function gridPointer(dx:int,dy:int):Point
		{
			var msg:GridMsg;
			for (var i:int = 0; i < closeList.length; i++) 
			{
				msg = closeList[i];
				if (msg.dx==dx && msg.dy==dy){
					return msg.pointer;
				}
			}
			return null;
		}

		private function addCloselist(grid:GridMsg):void
		{
            closeList.push(grid);
            if(ifdrawTestGrid){
                drawTestRect(grid.dx,grid.dy,"#ff5f00");
            }
		}
		
		private function addOpenlist(grid:GridMsg):Boolean
		{
			const dx:int = grid.dx;
			const dy:int = grid.dy;
			var addAction:Array = [[-1, -1], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1]];
			
			var index:int = addAction.length;
			var gridmsg:GridMsg;
			var msg:Array = [];
			var ax:int;
			var ay:int;
			while (index > 0)
			{
				index--;
				msg = addAction[index];
				ax = msg[0] + dx;
				ay = msg[1] + dy;
				if (putInOpenlist(ax, ay))
				{
					gridmsg = new GridMsg(new Point(ax, ay));
					gridmsg.pointer = new Point(dx, dy);
                    gridmsg.update();
					openList.push(gridmsg);
					if(ifdrawTestGrid){
                        drawTestRect(ax,ay,"#fcff00");
                        //drawTestRectline(gridmsg);
					}
					if(ax==endPos.x && ay==endPos.y){
						return false;
					}
				}
			}
			return true;
		}

		private function checkMinGirdAround(grid:GridMsg):void
		{
            const dx:int = grid.dx;
            const dy:int = grid.dy;
            var addAction:Array = [[-1, -1], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1]];
            var msg:Array = [];
            var ax:int;
            var ay:int;

            for (var i:int=addAction.length-1;i>=0;i--){
                msg=addAction[i];
				ax=msg[0]+dx;
				ay=msg[1]+dy;
				var aroundGrid:GridMsg=findoutGrid(openList,ax,ay);
				if(aroundGrid){
					var gNum:int=signGNum(new Point(aroundGrid.dx,aroundGrid.dy),new Point(grid.dx,grid.dy));
					if(aroundGrid.G>grid.G+gNum){
                        aroundGrid.G=grid.G+gNum;
                        aroundGrid.pointer = new Point(dx, dy);
                        aroundGrid.update();
                        //drawTestRectline(aroundGrid);
					}
				}
			}
		}
		private function  findoutMinFromOpenlist():GridMsg
		{
            openList.sort(function (a:*,b:*):Number {
				return a.F>b.F ? -1:1;
            })
			return openList.pop();
            //console.log("--openlist a",openList);
		}

        public function signGNum(startP:Point,endP:Point):int
        {
            if (Math.abs(startP.x-endP.x)==1 && Math.abs(startP.y-endP.y)==1){
                return 14;
            }
            return 10;
        }

		private function findoutGrid(arr:Array,dx:int,dy:int):GridMsg
		{
			var gridmsg:GridMsg;
			for (var i:int=arr.length-1;i>=0;i--){
                gridmsg=arr[i];
				if(gridmsg.dx==dx && gridmsg.dy==dy){
					return gridmsg;
				}
			}
			return null;
		}

		private function putInOpenlist(dx:int, dy:int):Boolean
		{
            if (getGridIdFromPos("landlayer", dx, dy) != 169){
                return false;
            }
			else if(findoutGrid(closeList,dx,dy)){
				return false;
			}else if(findoutGrid(openList,dx,dy)){
				return false;
			}

			return true;
		}
		
		
		private function drawChooseRect(p:Point):void
		{
			drawsideSp ||= new Sprite();
			drawsideSp.graphics.clear();
			//drawsideSp.graphics.drawRect(0,0,32,32,"#ffffff");
			drawsideSp.graphics.drawLines(0, 0, [0, 0, 32, 0, 32, 32, 0, 32, 0, 0], "#ff0003", 3);
			drawsideSp.pos(p.x, p.y);
			mapPanel.addChild(drawsideSp);
		}

		private function drawTestRect(dx:int,dy:int,color:String):void
		{
			const rectW:int=32;
			var sp:Sprite=new Sprite();
			sp.graphics.drawRect(0,0,rectW,rectW,color);
			sp.pos(dx*rectW,dy*rectW);
            sp.alpha=.5;
            testgridSp.addChild(sp);
            testgridArr.push(sp);
		}

		private function drawTestRectline(grid:GridMsg):void
		{
            const rectW:int=32;
			const dx:int=grid.dx;
			const dy:int=grid.dy;
			const pointer:Point=grid.pointer;
			var sp:Sprite;
			var endX:int;
			var endY:int;

			for (var i:int=0;i<testgridArr.length;i++){
				sp=testgridArr[i];
				if(dx==sp.x && dy==sp.y){
					if(dx==pointer.x) endX=rectW/2;
					else (dx-pointer.x>0)? endX=0:endX=rectW;

                    if(dy==pointer.y) endY=rectW/2;
					else (dy-pointer.y>0)? endY=0:endY=rectW;

					console.log("--s");
                    sp.graphics.drawLine(rectW/2,rectW/2,endX,endY,"#ff00e3",3);
				}
			}
		}


		
		private function getGridPoint(layerName:String):Point
		{
			var layer:MapLayer = tilemap.getLayerByName(layerName);
			var p2:Point = maplocalPoint;
			layer.getTilePositionByScreenPos(p2.x, p2.y, p2);
			layer.getScreenPositionByTilePos(Math.floor(p2.x), Math.floor(p2.y), p2);
			return p2;
		}
		
		private function getGridId(layerName:String):int
		{
			var layer:MapLayer = tilemap.getLayerByName(layerName);
			var p2:Point = maplocalPoint;
			return layer.getTileDataByScreenPos(p2.x, p2.y);
		}
		
		private function getGridPos(layerName:String, cx:Number = -1, cy:Number = -1):Point
		{
			var layer:MapLayer = tilemap.getLayerByName(layerName);
			var p2:Point = maplocalPoint;
			var p3:Point = new Point();
			if (cx == -1 || cy == -1)
			{
				layer.getTilePositionByScreenPos(p2.x, p2.y, p3);
			}
			else
			{
				layer.getTilePositionByScreenPos(cx, cy, p3);
			}
			const repairPos:Number = 0.2;
			p3.x = Math.floor(p3.x);
			p3.y = Math.floor(p3.y);
			return p3;
		}
		
		private function getGridIdFromPos(layerName:String, dx:int, dy:int):int
		{
			var layer:MapLayer = tilemap.getLayerByName(layerName);
			return layer.getTileData(dx, dy);
		}
		
		private function get maplocalPoint():Point
		{
			var p:Point = new Point();
			if (tilemap.mapSprite().parent == Laya.stage)
			{
				p.x = Laya.stage.mouseX;
				p.y = Laya.stage.mouseY;
			}
			else
			{
				p.x = Laya.stage.mouseX;
				p.y = Laya.stage.mouseY;
				p = mapPanel.globalToLocal(p);
			}
			return p;
		}
		
		private function get mousePointInMap():Point
		{
			return mapPanel.globalToLocal(new Point(Laya.stage.mouseX, Laya.stage.mouseY));
		}
		
		public function register():void
		{
		
		}
		
		public function unRegister():void
		{
		
		}
		
		public function closePanel():void
		{
			this.visible = false;

			clearMapMSG();
			tilemap.destroy();
		}
		
		private function clearMapMSG():void
		{
			if (drawsideSp) drawsideSp.removeSelf();
			ship.removeSelf();
		}
		
		public function clearAllNum():void
		{
            clearWay();
            changeMapRoadState("over");
		}
	
	}
}

import laya.maths.Point;

import view.gamemap.Gamemap;
import view.gamemap.Gamemap;
class GridMsg
{
	public var G:int;
	public var H:int;
	public var F:int;

	public var dx:int;
	public var dy:int;
	public var pointer:Point;
	
	public function GridMsg(pos:Point)
	{
		dx = pos.x;
		dy = pos.y;
		
		//console.log("-Gamemap:",Gamemap.instance.endPos);
	}
	
	public function update():void
	{
		updateH();
		updateG();
		updateF();
	}
	
	private function updateH():void
	{
		var ax:int = Math.abs(Gamemap.instance.endPos.x - dx);
		var ay:int = Math.abs(Gamemap.instance.endPos.y - dy);
		H = (ax + ay)*10;
	}
	private function updateG():void
	{
		var stepPos:Point = new Point(dx, dy);
		var nextPos:Point = new Point(pointer.x,pointer.y);

		var startPos:Point=Gamemap.instance.startPos;
		do{
            G += Gamemap.instance.signGNum(stepPos, nextPos);
            stepPos.x = nextPos.x;
            stepPos.y = nextPos.y;
            nextPos = Gamemap.instance.gridPointer(stepPos.x, stepPos.y);
            if (!nextPos){
                console.log("-can not fond pointer form openlist");
                break;
            }
		}
		while (stepPos.x != startPos.x && stepPos.y != startPos.y)
	}

	private function updateF():void
	{
		F=G+H;
	}


}

