package manager
{
import control.GamemainC;
import control.ShopBuy;

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
            ShopBuy.instance;
        }

        public function init():void
        {
            ModelInit();
            ControlInit();
        }
    }
}
