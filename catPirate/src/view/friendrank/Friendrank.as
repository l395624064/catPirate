package view.friendrank {
import laya.display.Text;
import laya.events.Event;
import laya.ui.Box;
import laya.ui.Image;
import laya.utils.Handler;

import manager.GameEvent;

import manager.GameEventDispatch;

import manager.Gamefame;

import manager.UiManager;

import ui.FriendRankUI;

import view.PanelVo;

public class Friendrank extends FriendRankUI implements PanelVo{
    public static var _instance:Friendrank;
    public function Friendrank() {
        super();
    }
    public static function get instance():Friendrank
    {
        return _instance||=new Friendrank();
    }

    public function openPanel(param:Object=null):void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Friendrank");
        });

        friendlist.vScrollBarSkin="";
        friendlist.renderHandler=new Handler(this,updatelist);

        var rankObj:Array=[
            {name:"的潜伏期",score:852,url:"https://www.easyicon.net/api/resizeApi.php?id=1203098&size=72"},
            {name:"人3",score:785,url:"https://www.easyicon.net/api/resizeApi.php?id=1203058&size=72"},
            {name:"大旗网",score:711,url:"https://www.easyicon.net/api/resizeApi.php?id=1203048&size=72"},
            {name:"豆腐干",score:625,url:"https://www.easyicon.net/api/resizeApi.php?id=1203057&size=72"},
            {name:"妇女干部发挥",score:521,url:"https://www.easyicon.net/api/resizeApi.php?id=1203052&size=72"},
            {name:"纳入法庭火热",score:412,url:"https://www.easyicon.net/api/resizeApi.php?id=1203087&size=72"},
            {name:"跟3",score:218,url:"https://www.easyicon.net/api/resizeApi.php?id=1203122&size=72"},
            {name:"规范岁的法国",score:211,url:"https://www.easyicon.net/api/resizeApi.php?id=1203084&size=72"}
        ];
        GameEventDispatch.instance.event(GameEvent.GetFriendRank,[rankObj]);
    }

    private function initFriendlist(arr:Array):void
    {
        arr.push({name:"无名氏",score:0,url:"https://www.easyicon.net/api/resizeApi.php?id=1203084&size=72"});
        friendlist.array=arr;
    }

    private function updatelist(cell:Box,index:int):void
    {
        var cfg:Object=cell.dataSource;
        var name:String=cfg.name;
        var score:int=cfg.score;
        var headUrl:String=cfg.url;

        var ele_floor_img:Image=cell.getChildByName("floorImg") as Image;
        var ele_head_img:Image=cell.getChildByName("headimg") as Image;
        var ele_rank_img:Image=cell.getChildByName("rankimg") as Image;

        var ele_title_txt:Text=cell.getChildByName("titletxt") as Text;
        var ele_name_txt:Text=cell.getChildByName("nametxt") as Text;
        var ele_rank_txt:Text=cell.getChildByName("ranktxt") as Text;
        var ele_score_txt:Text=cell.getChildByName("scoretxt") as Text;

        ele_head_img.skin=headUrl;

        if(index%2) ele_floor_img.skin="ui/friendrank/di2.png";
        else ele_floor_img.skin="ui/friendrank/di3.png";

        if(index<3){
            ele_rank_img.skin="ui/friendrank/ico"+(index+1)+".png";
        }else{
            ele_rank_img.skin="";
        }

        ele_name_txt.text=name;
        ele_title_txt.text=Gamefame.instance.getPlayerTitle(score,1000);
        ele_rank_txt.text=(index+1)+"";
        ele_score_txt.text=score+"";
    }









    public function register():void
    {
        GameEventDispatch.instance.on(GameEvent.GetFriendRank,this,initFriendlist);
    }
    public function unRegister():void
    {
        GameEventDispatch.instance.off(GameEvent.GetFriendRank,this,initFriendlist);
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
