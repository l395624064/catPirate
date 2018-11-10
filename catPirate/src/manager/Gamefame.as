package manager {
public class Gamefame {

    public static var _instance:Gamefame;
    public function Gamefame() {
    }

    public static function get instance():Gamefame
    {
        return _instance||=new Gamefame();
    }


    public function getPlayerTitle(weight:Number,maxWeight:Number):String
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
