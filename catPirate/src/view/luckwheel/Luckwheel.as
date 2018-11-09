package view.luckwheel {
import laya.events.Event;
import laya.ui.Box;
import laya.ui.Image;

import manager.UiManager;

import ui.LuckwheelUI;
import view.PanelVo;

public class Luckwheel extends LuckwheelUI implements PanelVo{
    public static var _instance:Luckwheel;

    private var _popboxArr:Array=[];
    private var _spdLv1:Number=1;
    private var _spdLv2:Number=2;
    private var _spdLv3:Number=4;
    private var _spdLv4:Number=6;
    private var _spdLv5:Number=8;
    private var _skinArr:Array=[
            "ui/common_ef/luck1.png",
            "ui/common_ef/luck2.png",
            "ui/common_ef/luck3.png",
            "ui/common_ef/luck4.png",
            "ui/common_ef/luck5.png"
    ];

    public function Luckwheel() {
        super();
    }
    public static function get instance():Luckwheel
    {
        return _instance||=new Luckwheel();
    }

    public function openPanel(param:Object=null):void
    {
        getPopBox();
        this.closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Luckwheel");
        });

        startBtn.on(Event.MOUSE_DOWN,this,changewheelState,["start"]);
    }

    private function getSpdLv(index:int,max:int):Number
    {
        var spd:Number;
        const updateNum:int=3;
        if(index>=max-updateNum){
            spd=_spdLv1;
        }
        else if(index>=max-updateNum*2 && index<max-updateNum){
            spd=_spdLv2
        }
        else if(index>=max-updateNum*3 && index<max-updateNum*2){
            spd=_spdLv3
        }
        else if(index>=max-updateNum*4 && index<max-updateNum*3){
            spd=_spdLv4
        }
        else{
            spd=_spdLv5
        }
        return spd;
    }

    private function getPoPName(index:int):void
    {
        var index:int=index%_skinArr.length;
        var popName:String;
        switch (index){
            case 0:popName="苹果"
                break;
            case 1:popName="星星"
                break;
            case 2:popName="西瓜"
                break;
            case 3:popName="橘子"
                break;
            case 4:popName="山竹"
                break;
        }
        console.log("--道具:",popName);
    }

    private function getPopBox():void
    {
        _popboxArr=[];
        var box:Box;
        for(var i:int=0;i<3;i++){
            box=maskBox.getChildByName("box"+i) as Box;
            box["skinIndex"]=_skinArr.length-1;
            box["headImage"]=box.getChildByName("item"+4) as Image;
            box["tailImage"]=box.getChildByName("item"+0) as Image;
            box["Spd"]=_spdLv5;
            setItemSkin(box);
            _popboxArr.push(box);

            box["popIndex"]=30+Math.floor(Math.random()*5);
            getPoPName(box["popIndex"]);
        }
    }


    private function setItemSkin(box:Box):void
    {
        var img:Image;
        for(var i:int=0;i<box.numChildren-1;i++){
            img=box.getChildByName("item"+i) as Image;
            img.skin=_skinArr[i];
        }
    }

    private function changewheelState(action:String):void
    {
        if(action=="start"){
            Laya.timer.once(100,this,function () {
                _popboxArr[0]['state']="begin";
            });
            Laya.timer.once(500,this,function () {
                _popboxArr[1]['state']="begin";
            });
            Laya.timer.once(1000,this,function () {
                _popboxArr[2]['state']="begin";
            });
            Laya.timer.frameLoop(1,this,onTimer);
        }
        else if(action=="stop"){
            Laya.timer.clear(this,onTimer);
        }
    }

    private function onTimer():void
    {
        var stopNum:int=0;
        for(var i:int=0;i<_popboxArr.length;i++){
            var box:Box=_popboxArr[i];
            if(box['state']=="begin")checkItem(box);
            else if(box['state']=="stop") stopNum++;
        }
        if(stopNum>=3){
            changewheelState("stop");
        }
    }


    private function checkItem(box:Box):void
    {
        var img:Image;
        if(box["headImage"].y>=box["headImage"].height){
            //add box
            img=new Image(_skinArr[box["skinIndex"]%_skinArr.length]);
            img.pos(0,0);
            box["skinIndex"]++;
            img.name="item"+box["skinIndex"];
            box["headImage"]=img;
            box.addChild(img);

            //delet box
            box.removeChild(box["tailImage"]);
            box["tailImage"]=null;
            box["tailImage"]=box.getChildByName("item"+(box["skinIndex"]-4)) as Image;
        }

        box["Spd"]=getSpdLv(box["skinIndex"],box["popIndex"]);
        if(box["popIndex"]==box["skinIndex"]-2){
            box['state']="stop";
            box['Spd']=0;
        }

        for(var i:int=box.numChildren-1;i>=0;i--){
            img=box.getChildAt(i) as Image;
            img.y+=box["Spd"];//move
        }
        //console.log("popIndex:",box["popIndex"],"skinIndex:",box["skinIndex"],box["Spd"]);
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
    }
    public function clearAllNum():void
    {

    }

}
}
