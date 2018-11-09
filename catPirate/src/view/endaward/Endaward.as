package view.endaward {
import laya.events.Event;

import manager.GameEvent;

import manager.GameEventDispatch;

import ui.EndawardUI;

import view.PanelVo;

public class Endaward extends EndawardUI implements PanelVo{

    public static var _instance:Endaward;
    public static var _maxWeight:Number=0;

    public function Endaward() {
        super();
    }
    public static function get instance():Endaward
    {
        return _instance||=new Endaward();
    }

    public function openPanel(param:Object=null):void
    {
        ani1.play(0,false);
        backBtn.on(Event.MOUSE_DOWN,this,function () {
            GameEventDispatch.instance.event(GameEvent.GameOver);
        });

        playerImg.skin = param['img'];
        _maxWeight=param['maxweight'];
        playertitle.text=getPlayerTitle(param['weight']);
        weightTxt.text=param['weight']+"kg";
    }

    private function getPlayerTitle(weight:Number):String
    {
        var lvNum:Number=_maxWeight/10;
        var str:String;

        if(weight>=_maxWeight){
            str="盖世无双";
        }
        else if(weight<_maxWeight && weight>=lvNum*9){
            str="变化如神";
        }
        else if(weight<lvNum*9 && weight>=lvNum*8){
            str="出神入化";
        }
        else if(weight<lvNum*8 && weight>=lvNum*7){
            str="所向披靡";
        }
        else if(weight<lvNum*7 && weight>=lvNum*6){
            str="风驰电掣";
        }
        else if(weight<lvNum*6 && weight>=lvNum*5){
            str="电光石火";
        }
        else if(weight<lvNum*5 && weight>=lvNum*4){
            str="出类拔萃";
        }
        else if(weight<lvNum*4 && weight>=lvNum*3){
            str="一鸣惊人";
        }
        else if(weight<lvNum*3 && weight>=lvNum*2){
            str="小试牛刀";
        }
        else if(weight<lvNum*2 && weight>=lvNum*1){
            str="平平如也";
        }else{
            str="初入茅庐";
        }
        return str;
    }
    public function clearAllNum():void
    {
        ani1.stop();
    }
    public function closePanel():void
    {
        this.visible=false;
    }
    public function register():void
    {

    }
    public function unRegister():void
    {

    }
}
}
