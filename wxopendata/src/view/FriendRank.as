package view
{
	import ui.FriendRankUI;
	import laya.utils.Handler;
	/**
	 * ...
	 * @author
	 */
	public class FriendRank extends FriendRankUI{
		private var _instance:FriendRank;
		public function FriendRank(){
			friendlist.vScrollBarSkin="";
			friendlist.renderHandler=new Handler(this,updatelist);
            friendlist.array=[];
		}

		public static function get instance():FriendRank
		{
			return _instance||=new FriendRank();
		}

		public function initNum(arr:Array):void
		{
			arr=setScore(arr);
            friendlist.array=arr;
			//console.log("-friendlist.array:",friendlist.array);
		}

		private function updatelist(cell:Box,index:int):void
    	{
        	var cfg:Object=cell.dataSource;
        	var name:String=cfg.nickname;
        	var score:int=cfg.score;
        	var headUrl:String=cfg.avatarUrl;
			var rankNum:int=cfg.rank;

        	var ele_floor_img:Image=cell.getChildByName("floorImg") as Image;
        	var ele_head_img:Image=cell.getChildByName("headBox").getChildByName("headimg") as Image;
        	var ele_rank_img:Image=cell.getChildByName("rankimg") as Image;

        	var ele_title_txt:Text=cell.getChildByName("titletxt") as Text;
        	var ele_name_txt:Text=cell.getChildByName("nametxt") as Text;
        	var ele_rank_txt:Text=cell.getChildByName("ranktxt") as Text;
        	var ele_score_txt:Text=cell.getChildByName("scoretxt") as Text;
			
        	ele_head_img.skin=headUrl;
        	ele_name_txt.text=name;
        	ele_title_txt.text=getPlayerTitle(score,1000);
        	ele_rank_txt.text=(index+1)+"";
        	ele_score_txt.text=score+"";

			/*
			if(index%2) ele_floor_img.skin="";
			if(rankNum>3){
            	ele_rank_img.skin="";
        	}
			
        	if(index%2) ele_floor_img.skin="ui/friendrank/di2.png";
        	else ele_floor_img.skin="ui/friendrank/di3.png";

        	if(index<3){
            	ele_rank_img.skin="ui/friendrank/ico"+(index+1)+".png";
        	}else{
            	ele_rank_img.skin="";
        	}
			*/
    	}

		private function setScore(_arr:Array):Array
		{
			for(var i:int=0;i<_arr.length;i++){
				var score:Number=parseInt(_arr[i].KVDataList[0].value);
				_arr[i].score=score;
			}
			sortArr(_arr);
			setRankNum(_arr);
			return _arr;
		}
    	private function sortArr(_arr:Array):void
    	{
        	_arr.sort(function (a,b):Number {
            	return (a.score>b.score)? -1:1
        	});
    	}
		private function setRankNum(_arr:Array):void
		{
			for(var i:int=0;i<_arr.length;i++){
				_arr[i].rank=i+1;
			}
		}

    	private function getPlayerTitle(weight:Number,maxWeight:Number):String
    	{
        	var lvNum:Number=maxWeight/10;
        	var str:String;

        	if(weight>=maxWeight){
           		str="盖世无双";
        	}
        	else if(weight<maxWeight && weight>=lvNum*9){
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

	}
}