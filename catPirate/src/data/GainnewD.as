package data {
import laya.utils.Handler;

public class GainnewD {

    //单项
    public var name:String="";
    public var explain_content:String="";//如果为空,展示信息则为str=name*1
    public var res:String="";
    public var callback:Handler=null;

    //获得多项
    public var award_type:Array=[];
    public var award_num:Array=[];

    public function GainnewD() {
    }
}
}
