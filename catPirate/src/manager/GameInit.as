package manager
{
    import Control.ActivityC;
    import Control.BankC;
    import Control.BaseC;
    import Control.BatteryC;
    import Control.CompenC;
    import Control.FightC;
    import Control.FishTypeC;
    import Control.HeartbeatC;
    import Control.HourseC;
    import Control.LevelC;
    import Control.LoginC;
    import Control.LoginInfoC;
    import Control.MatchC;
    import Control.MsgC;
    import Control.OnLineC;
    import Control.QuitC;
    import Control.RTipC;
    import Control.RedpointC;
    import Control.RegiC;
    import Control.RewardC;
    import Control.RoleInfoC;
    import Control.RuleC;
    import Control.ShopC;
    import Control.SmallC;
    import Control.SmallGameHeartbeatC;
    import Control.TaskC;
    import Control.UpgradeC;
	import Control.VipC;
	import Control.FishPondC;
	
    import Model.ActivityM;
    import Model.CompenM;
    import Model.FishTypeM;
    import Model.HorseM;
    import Model.LevelM;
    import Model.LoadTipM;
    import Model.LoginInfoM;
    import Model.LoginM;
    import Model.MsgM;
    import Model.OnLineM;
    import Model.QuitM;
    import Model.RTipM;
    import Model.RewardM;
    import Model.RoleInfoM;
    import Model.RuleM;
    import Model.SmallM;
    import Model.UpgradeM;
	import Model.FishPondM;

import control.GamemainC;

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

        }

        public function ControlInit():void
        {
            GamemainC.instance;
        }

        public function init():void
        {
            ModelInit();
            ControlInit();
        }
    }
}
