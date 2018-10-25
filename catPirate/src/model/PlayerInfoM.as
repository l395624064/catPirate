package model {
public class PlayerInfoM {

    public static var _instance:PlayerInfoM;

    private var _goldNum:Number=0;
    private var _plankNum:Number=0;

    private var _luckNum:Number=0;

    private var _shipmoduleBuyArr=[
        [1,1,1],
        [1,1,1,1,1,1],
        [1,1,1,1,1,1],
        [1,1,1,1,1,1]
    ];


    public function PlayerInfoM() {
    }

    public static function get instance():PlayerInfoM
    {
        return _instance || (_instance=new PlayerInfoM());
    }

    public function getluckNum():Number
    {
        return _luckNum;
    }
    public function setluckNum(value:Number):void
    {
        _luckNum=value;
    }

    public function getshipmoduleBuyArr():Array
    {
        return _shipmoduleBuyArr;
    }
    public function setshipmoduleBuyArr(arr:Array):void
    {
        _shipmoduleBuyArr=arr;
    }

    public function setshipmoduleBuy(tabId:int,id:int):void
    {
        _shipmoduleBuyArr[tabId][id]=0;
    }
    public function getshipmoduleBuy(tabId:int,id:int):int
    {
        return _shipmoduleBuyArr[tabId][id];
    }


    public function getGoldNum():Number
    {
        return _goldNum;
    }
    public function setGoldNum(value:Number):void
    {
        _goldNum=value;
    }

    public function getPlankNum():Number
    {
        return _plankNum;
    }
    public function setPlankNum(value:Number):void
    {
        _plankNum=value;
    }




}
}
