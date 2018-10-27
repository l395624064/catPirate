package manager
{
import control.GainnewpopC;
import control.GamemainC;
import control.ShopbuyC;
import control.SmallTipsC;
import control.TipsC;

import model.ShiprefitM;

public class GameInit
    {
        private static var _instance:GameInit;

        public function GameInit()
        {

        }

        public static function get instance():GameInit
        {
            return _instance || (_instance = new GameInit());
        }

        public function ModelInit():void
        {
            ShiprefitM.instance;

        }

        public function ControlInit():void
        {
            GamemainC.instance;
            ShopbuyC.instance;
            SmallTipsC.instance;
            TipsC.instance;
            GainnewpopC.instance;
        }

        public function init():void
        {
            ModelInit();
            ControlInit();
        }
    }
}
