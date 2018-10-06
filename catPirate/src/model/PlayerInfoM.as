package src.model {
public class PlayerInfoM {

    public static var _instance:PlayerInfoM;

    private var _goldNum:Number=0;
    private var _plankNum:Number=0;

    public function PlayerInfoM() {
    }

    public static function get instance():PlayerInfoM
    {
        return _instance || (_instance=new PlayerInfoM());
    }


    public function getGoldNum():Number
    {
        return _goldNum;
    }
    public function setGoldNum(gold:Number):void
    {
        _goldNum=gold;
    }

    public function getPlankNum():Number
    {
        return _plankNum;
    }
    public function setPlankNum(plank:Number):void
    {
        _plankNum=plank;
    }




}
}
