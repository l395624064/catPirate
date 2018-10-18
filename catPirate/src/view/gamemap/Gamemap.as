package view.gamemap {
import laya.events.Event;
import laya.map.TiledMap;
import laya.maths.Point;
import laya.maths.Rectangle;
import laya.ui.Image;
import laya.utils.Handler;

import manager.UiManager;

import src.GameConfig;

import view.PanelVo;
import ui.GameMapUI;

public class Gamemap extends GameMapUI implements PanelVo{

    public static var _instance:Gamemap;

    private var tilemap:TiledMap;
    private var mapX:Number=0;
    private var mapY:Number=0;
    private var lastMouseX:Number=0;
    private var lastMouseY:Number=0;
    private var ship:Image;
    private var shipPoint:Point=new Point(200,100);


    public function Gamemap() {
        super();
    }

    public static function get instance():Gamemap
    {
        return _instance || (_instance=new Gamemap());
    }

    public function openPanel(param:Object=null):void
    {
        initListener();
        initNum();
    }

    private function initListener():void
    {
        this.closeBtn.on(Event.MOUSE_DOWN,this,closePanel);
    }
    private function initNum():void
    {
        tilemap =new TiledMap();
        var viewRect:Rectangle = new Rectangle(0, 0, mapPanel.width, mapPanel.height);
        var gridSize:Point=new Point(512,512);
        tilemap.createMap("TiledMap/tileMap.json",viewRect,Handler.create(this,maploadComplete),null,gridSize);
    }


    private function maploadComplete():void
    {
        if(!ship){
            ship=new Image();
            ship.skin="ui/gamemap/shipImg.png";
        }
        updateShipPoint(mapX,mapY);
        tilemap.mapSprite().addChild(ship);

        tilemap.setViewPortPivotByScale(0,0);
        tilemap.scale=1;
        tilemap.moveViewPort(mapX,mapY);
        mapPanel.addChild(tilemap.mapSprite());

        mapPanel.on(Event.MOUSE_DOWN,this,onMapeDown);
        Laya.stage.on(Event.RESIZE,this,resize);
    }

    private function onMapeDown():void
    {
        lastMouseX=mousePointInMap.x;
        lastMouseY=mousePointInMap.y;

        mapPanel.on(Event.MOUSE_MOVE,this,onMapMove);
        mapPanel.on(Event.MOUSE_OUT,this,onMapUp);
        Laya.stage.on(Event.MOUSE_UP,this,onMapUp);
    }
    private function onMapMove():void
    {
        var moveX:Number=mapX-(mousePointInMap.x-lastMouseX);
        var moveY:Number=mapY-(mousePointInMap.y-lastMouseY);
        moveX=repairPoint(moveX,moveY).x;
        moveY=repairPoint(moveX,moveY).y;

        updateShipPoint(moveX,moveY);
        tilemap.moveViewPort(moveX,moveY);
    }
    private function onMapUp():void
    {
        mapX=mapX-(mousePointInMap.x-lastMouseX);
        mapY=mapY-(mousePointInMap.y-lastMouseY);
        mapX=repairPoint(mapX,mapY).x;
        mapY=repairPoint(mapX,mapY).y;

        updateShipPoint(mapX,mapY);

        mapPanel.off(Event.MOUSE_MOVE,this,onMapMove);
        mapPanel.off(Event.MOUSE_OUT,this,onMapUp);
        Laya.stage.off(Event.MOUSE_UP,this,onMapUp);
    }
    private function resize():void
    {
        tilemap.changeViewPort(mapX,mapY,mapPanel.width, mapPanel.height);
    }
    private function repairPoint(cx:Number=0,cy:Number=0):Point
    {
        var p:Point=new Point(cx,cy);
        if(cx<=0) p.x=0;
        if(cx>=tilemap.width-mapPanel.width) p.x=tilemap.width-mapPanel.width;
        if(cy<=0) p.y=0;
        if(cy>=tilemap.height-mapPanel.height) p.y=tilemap.height-mapPanel.height;
        return p;
    }
    private function get mousePointInMap():Point
    {
        return mapPanel.globalToLocal(new Point(Laya.stage.mouseX, Laya.stage.mouseY));
    }

    private function updateShipPoint(cx:Number,cy:Number):void
    {
        ship.pos(shipPoint.x-cx,shipPoint.y-cy);
    }




    public function register():void
    {

    }
    public function unRegister():void
    {

    }
    public function closePanel():void
    {
        this.visible=false;
        tilemap.destroy();
    }
    public function clearAllNum():void
    {

    }

}
}
