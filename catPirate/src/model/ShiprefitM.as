package model {
import conf.cfg_currency;
import conf.cfg_module_ship;

import manager.ConfigManager;

public class ShiprefitM {

    public static var _instance:ShiprefitM;

    private var _shipmoduleBuyArr=[
        [1,1,1],
        [1,1,1,1,1,1],
        [1,1,1,1,1,1],
        [1,1,1,1,1,1]
    ];

    private var _shipslotDic:Object={body:null,sail:null,tower:null,cabin:null};//body sail tower cabin

    //min:0 max:100
    /*耐久度(船体):CON
    提升船的耐久度上限值;船航行期间会损耗耐久,耐久度降为0后,船会停止航行
    */
    private var _CON:Number=0;
    /*战斗力(炮台):STR
     * 提升船的战斗力;当遇到其它海贼团时,数值越高越容易获胜
    */
    private var _STR:Number=0;
    /*仓库容量(船尾的小厨房):LER
    *提升仓库的容量;仓库容量影响食物库存总量
    * */
    private var _LER:Number=0;
    /*航行速度(船帆):SPD
    *提升船的速度;船在航海图上,移动格子所需的时间
    * */
    private var _SPD:Number=0;
    /*感知力(桅杆):DEX
    *提升船的视野范围
    * */
    private var _DEX:Number=0;


    public function ShiprefitM() {
    }

    public static function get instance():ShiprefitM
    {
        return _instance || (_instance=new ShiprefitM());
    }





    public function setShipslotDic(obj:Object):void
    {
        _shipslotDic=obj;
    }
    public function getShipslotDic():Object
    {
        return _shipslotDic;
    }


    public function getShipslotByName(name:String):Object
    {
        return _shipslotDic[name];
    }
    public function setShipslotByName(name:String, slot:*):void
    {
        if(_shipslotDic.hasOwnProperty(name)){
            _shipslotDic[name]=slot;
        }
        else{
            throw new Error("Game Error shipSlot undefind");
        }
        updateShipProperty();
    }

    private function updateShipProperty():void
    {
        clearShipProperty();
        var slot:Object;
        var proNumArr:Array=[];//CON,STR,LER,SPD,DEX
        var value:Number;
        for(var str:String in _shipslotDic){
            slot=_shipslotDic[str];
            if(slot){
                proNumArr=slot['property_num'];
                for(var i:int=0;i<proNumArr.length;i++){
                    value=proNumArr[i];
                    if(i==0) updateCON(value);
                    else if(i==1) updateSTR(value);
                    else if(i==2) updateLER(value);
                    else if(i==3) updateSPD(value);
                    else if(i==4) updateDEX(value);
                }
            }
        }
    }

    public function clearShipProperty():void
    {
        _CON=0;
        _STR=0;
        _LER=0;
        _SPD=0;
        _DEX=0;
    }

    public function updateCON(value:Number):void{
        _CON+=value;
    }
    public function updateSTR(value:Number):void{
        _STR+=value;
    }
    public function updateLER(value:Number):void{
        _LER+=value;
    }
    public function updateSPD(value:Number):void{
        _SPD+=value;
    }
    public function updateDEX(value:Number):void{
        _DEX+=value;
    }


    public function set CON(value:Number):void{
        _CON=value;
    }
    public function get CON():Number{
        return _CON;
    }
    public function set STR(value:Number):void{
        _STR=value;
    }
    public function get STR():Number{
        return _STR;
    }
    public function set LER(value:Number):void{
        _LER=value;
    }
    public function get LER():Number{
        return _LER;
    }
    public function set SPD(value:Number):void{
        _SPD=value;
    }
    public function get SPD():Number{
        return _SPD;
    }
    public function set DEX(value:Number):void{
        _DEX=value;
    }
    public function get DEX():Number{
        return _DEX;
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


    public function getTablistArray(type:int):Array
    {
        //tab:0 1 2 3
        //Id:401 101 301 201
        //typeId:1001 1002 1004 1003
        var typeid:int;
        switch (type){
            case 0:typeid=1001
            break;
            case 1:typeid=1002
            break;
            case 2:typeid=1004
            break;
            case 3:typeid=1003
            break;
            default:
            break;
        }

        var arr:Array=ConfigManager.filter("cfg_module_ship",function (item) {
            if(item['typeId']==typeid){
                return item;
            }
        });
        return arr;
    }

    public function getCostIco(id:int):String
    {
        return cfg_currency.instance(id)['res'];
    }
}
}
