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
import manager.WxManager;

import model.PlayerInfoM;

import src.GameConfig;

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
        if(PlayerInfoM.instance.getNetConfigAD()){
            WxManager.instance.hideBannerAd();
        }

        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            UiManager.instance.closePanel("Friendrank");
            if(GameConfig.onWeiXin){
                WxManager.instance.closeWXFriendRank();
            }
            if(PlayerInfoM.instance.getNetConfigAD()){
                WxManager.instance.showBannerAd();
            }
        });

        if(GameConfig.onWeiXin){
            Laya.timer.once(200,this,function () {
                WxManager.instance.openWXFriendRank();
            })
        }else{
            friendlist.vScrollBarSkin="";
            friendlist.renderHandler=new Handler(this,updatelist);
            initFriendlist();
        }
    }


    private function initFriendlist():void
    {
        var rankObj:Array=[
            {name:"的潜伏期",score:852,url:"http://images.liqucn.com/img/h1/h988/img201711250928440_info400X400.jpg"},
            {name:"人3",score:785,url:"http://images.liqucn.com/img/h1/h991/img201712091118050_info400X400.jpg"},
            {name:"大旗网",score:711,url:"https://img.52z.com/upload/news/image/20180912/20180912124602_94176.jpg"},
            {name:"豆腐干",score:625,url:"http://img.52z.com/upload/news/image/20180801/20180801112619_37471.jpg"},
            {name:"妇女干部发挥",score:521,url:"https://img.52z.com/upload/news/image/20180222/20180222054805_74858.jpg"},
            {name:"纳入法庭火热",score:412,url:"http://img.besoo.com/file/201705/07/0829006945908.png"},
            {name:"跟3",score:218,url:"http://image.biaobaiju.com/uploads/20180802/00/1533142762-DMfxhnYpmZ.jpg"},
            {name:"规范岁的法国",score:211,url:"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3419746188,1692388766&fm=26&gp=0.jpg"},
            {name:"无名氏",score:0,url:"https://www.easyicon.net/api/resizeApi.php?id=1203084&size=72"}
        ];
        friendlist.array=rankObj;
    }

    private function updatelist(cell:Box,index:int):void
    {
        var cfg:Object=cell.dataSource;
        var name:String=cfg.name;
        var score:int=cfg.score;
        var headUrl:String=cfg.url;

        var ele_floor_img:Image=cell.getChildByName("floorImg") as Image;
        var ele_head_img:Image=cell.getChildByName("headBox").getChildByName("headimg") as Image;
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
    }
    public function unRegister():void
    {
    }

    public function closePanel():void
    {
        this.visible=false;
        GameEventDispatch.instance.event(GameEvent.RemoveRedPoint,"Friendrank");
    }
    public function clearAllNum():void
    {

    }

}
}
