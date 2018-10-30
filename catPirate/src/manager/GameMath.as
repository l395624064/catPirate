package manager {
import laya.maths.Point;
import laya.ui.Image;

import model.ShiprefitM;

public class GameMath {

    public static var _instance:GameMath;
    public function GameMath() {
    }

    public static function get instance():GameMath
    {
        return _instance|| (_instance=new GameMath());
    }




}
}
