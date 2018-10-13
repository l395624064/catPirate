package manager
{
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
