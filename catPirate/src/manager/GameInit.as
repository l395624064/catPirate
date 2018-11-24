package manager
{
import control.GainnewpopC;
import control.GamemainC;
import control.PlayerInfoC;
import control.SaveC;
import control.ShipRoleC;
import control.ShiprefitC;
import control.ShopbuyC;
import control.SmallTipsC;
import control.TipsC;

import model.FishM;

import model.GamemainM;

import model.PlayerInfoM;

import model.ShipRoleM;

import model.ShiprefitM;

import src.model.ShopM;

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
            ShipRoleM.instance;
            PlayerInfoM.instance;
            GamemainM.instance;
            ShopM.instance;
            FishM.instance;
        }

        public function ControlInit():void
        {
            GamemainC.instance;
            ShopbuyC.instance;
            SmallTipsC.instance;
            TipsC.instance;
            GainnewpopC.instance;
            ShiprefitC.instance;
            ShipRoleC.instance;
            PlayerInfoC.instance;
            SaveC.instance;
        }

        public function init():void
        {
            ModelInit();
            ControlInit();
        }
    }
}
