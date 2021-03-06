package manager
{
    public class GameEvent
    {
        //game save
        public static const StartSaveTime:String="StartSaveTime";
        public static const GameSaveInit:String="GameSaveInit";
        public static const GameNetConfig:String="GameNetConfig";
        public static const GameSaveRefresh:String="GameSaveRefresh";

        //loadview
        public static const StartLoad:String="StartLoad";

        //wait tip view
        public static const OpenWait:String="OpenWait";
        public static const CloseWait:String="CloseWait";
        //unopened tip view
        public static const UnopenedShow:String="UnopenedShow";
        public static const Unopenedhide:String="Unopenedhide";

        //main game
        public static const GoldRefresh:String="GoldRefresh";
        public static const PlankRefresh:String="PlankRefresh";
        public static const PearlRefresh:String="PearlRefresh";

        public static const ShipRole_CLICK:String="ShipRole_CLICK";
        public static const PlankScoreANI:String="PlankScoreANI";
        public static const GoldScoreANI:String="GoldScoreANI";
        public static const PearlScoreANI:String="PearlScoreANI";

        public static const MinusGoldANI:String="MinusGoldANI";
        public static const MinusPlankANI:String="MinusPlankANI";
        public static const MinusPearlANI:String="MinusPearlANI";

        public static const UpdateShipslot:String="UpdateShipslot";

        public static const GameLoad:String="GameLoad";
        public static const GameLoadOver:String="GameLoadOver";
        public static const GameReady:String="GameReady";
        public static const GameStart:String="GameStart";
        public static const GameEnd:String="GameEnd";
        public static const GameOver:String="GameOver";
        public static const GameTimeout:String="GameTimeout";
        public static const GameMatchStart:String="GameMatchStart";
        public static const GameEndAward:String="GameEndAward";

        public static const ShowRedPoint:String="ShowRedPoint";
        public static const RemoveRedPoint:String="RemoveRedPoint";

        //boss coming
        public static const BossComIngMode:String="BossComIngAni";

        public static const GameTimeOver:String="GameTimeOver";

        //playerInfoC
        public static const ADDwheelNum:String="ADDwheelNum";
        public static const MinuswheelNum:String="MinuswheelNum";
        public static const ADDwheelNumFromShare:String="ADDwheelNumFromShare";
        public static const ResetwheelNumFromShare:String="ResetwheelNumFromShare";

        public static const StopGiftBoxTime:String="CheckGiftBoxLVUP";
        public static const CheckGiftBoxTime:String="CheckGiftBoxTime";
        public static const MinusBoxTime:String="MinusBoxTime";


        //GameTimeC
        public static const StartLoopTime:String="StartLoopTime";
        public static const UPdateGiftBoxTime:String="UPdateGiftBoxTime";
        public static const CheckGiftResetTime:String="GainGiftBox";

        //GainnewpopC
        public static const GainNewPOP:String="GainNewPOP";
        //ShowbuyC
        public static const ShopBuy:String="ShopBuy";
        //TipsC
        public static const ShowTips:String="ShowTips";
        //Stips
        public static const ShowStips:String="ShowStips";
        //shiprefitC
        public static const ShipSlotEquip:String="ShipSlotEquip";
        public static const FishhookEquip:String="FishhookEquip";
        public static const TimeAwardEquip:String="TimeAwardEquip";
        public static const ShipSlotInit:String="ShipSlotInit";
        //ShipRoleC
        public static const CreatShipRole:String="CreatShipRole";

        //guide
        public static const GameGuideNext:String="GameGuideNext";
    }
}
