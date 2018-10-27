package model {
public class PlayerInfoM {

    public static var _instance:PlayerInfoM;

    private var _goldNum:Number=1000;
    private var _plankNum:Number=1000;

    private var _luckNum:Number=0;


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
