package manager {
public class GameMath {

    public static var _instance:GameMath;
    public function GameMath() {
    }

    public static function get instance():GameMath
    {
        return _instance|| (_instance=new GameMath());
    }

    public function gethookColorImg():Array
    {
        //get blue img pos
        //get yellow img pos

        //
        return [100,300];
    }
}
}
