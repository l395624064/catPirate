package manager {
public class TimeManager {
    public static var _instance:TimeManager;
    public function TimeManager() {
    }
    public static function get instance():TimeManager
    {
        return _instance||=new TimeManager();
    }


    public function getTimeStr(delay:int):String
    {
        var timeObj:Object=getMinusTime(delay);
        var hour:int=timeObj.day*24+timeObj.hour;
        var min:int=timeObj.min;
        var second:int=timeObj.second;

        var hourStr:String,minStr,secondStr;
        if(hour<10){
            hourStr="0"+hour;
        }else {
            hourStr=""+hour;
        }

        if(min<10){
            minStr="0"+min;
        }else{
            minStr=""+min;
        }

        if(second<10){
            secondStr="0"+second;
        }else{
            secondStr=""+second;
        }

        return hourStr+":"+minStr+":"+secondStr;
    }

    public function getMinusTime(delay:int):Object
    {
        var timeObj:Object={
            day:0,
            hour:0,
            min:0,
            second:0
        };

        var allSecond:int=delay*1000;//默认传入单位:秒

        var day:int=Math.floor(allSecond/(1000*60*60*24))%365;
        var hour:int=Math.floor(allSecond/(1000*60*60))%24;
        var min:int=Math.floor(allSecond/(1000*60))%60;
        var second:int=Math.floor(allSecond/1000)%60;

        timeObj.day=day;
        timeObj.hour=hour;
        timeObj.min=min;
        timeObj.second=second;
        console.log(delay,"间隔时间："+day+"天"+hour+"时"+min+"分"+second+"秒");
        return timeObj;
    }
}
}
