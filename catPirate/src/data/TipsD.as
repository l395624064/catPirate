package data {
import laya.utils.Handler;

import manager.GameEvent;

public class TipsD {

    public var content:String="是否确认购买";
    public var autoCloseTime:int=10;
    public var aotoClose:Boolean=true;

    public var confirmCallback:Handler=null;
    public var conFirmEvent:String=GameEvent.ShopBuy;
    public var conFirmArgs:Object=null;

    public var buySucceedCallback:Handler=null;


    public function TipsD() {
    }
}
}
