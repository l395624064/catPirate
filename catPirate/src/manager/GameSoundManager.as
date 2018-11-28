package manager {
import laya.media.SoundManager;
import laya.utils.Handler;

import model.PlayerInfoM;

public class GameSoundManager {

    public static var _musicName:String;

    public function GameSoundManager() {
    }

    public static function onPlaySound(soundName:String):void
    {
        var soundPlay:Boolean=PlayerInfoM.instance.getGameSetting().sound;
        if(!soundPlay) return;

        const playNum:int=1;
        const headStr:String="https://6361-catpirate-data-a98557-1258046007.tcb.qcloud.la";

        if(soundName=="btn"){
            SoundManager.playSound(headStr+"/sound/sound_btn.mp3?sign=82ca91b33d677c6647c7a48d7dd8909e&t=1543393597",playNum);
        }
        else if(soundName=="combo"){
            SoundManager.playSound(headStr+"/sound/sound_combo.mp3?sign=a9266f75cb27765981fe36d7e0f5b1be&t=1543393627",playNum);
        }
        else if(soundName=="combo2"){
            SoundManager.playSound(headStr+"/sound/sound_combo2.mp3?sign=add2666dc07fefd5f9a53873a7d3aac7&t=1543393661",playNum);
        }
        else if(soundName=="gamestart"){
            SoundManager.playSound(headStr+"/sound/sound_gamestart.mp3?sign=6189ed439ca98fba02f3dc12176d85ce&t=1543393681",playNum);
        }
        else if(soundName=="get0"){
            SoundManager.playSound(headStr+"/sound/sound_get0.mp3?sign=631485c5b48ba451e3b783e6c1f8084f&t=1543393698",playNum);
        }
        else if(soundName=="get1"){
            SoundManager.playSound(headStr+"/sound/sound_get1.mp3?sign=8dc911d86c845789a047053d613c8355&t=1543393721",playNum);
        }
        else if(soundName=="get2"){
            SoundManager.playSound(headStr+"/sound/sound_get2.mp3?sign=7259c4d89dfc48b6c74ea761b600ebfb&t=1543393739",playNum);
        }
        else if(soundName=="get3"){
            SoundManager.playSound(headStr+"/sound/sound_get3.mp3?sign=de7191e3746fb650ce76e261e53e95eb&t=1543393762",playNum);
        }
        else if(soundName=="get4"){
            SoundManager.playSound(headStr+"/sound/sound_get4.mp3?sign=a1bde282f9123a0e8e6141bcfe61f3b3&t=1543393784",playNum);
        }
        else if(soundName=="timeover"){
            SoundManager.playSound(headStr+"/sound/sound_timeover0.mp3?sign=cb917e0df263a19f9c6c5deba7abcb76&t=1543393799",playNum);
        }
    }

    public static function onPlayMusic(musicName:String):void
    {
        var musicPlay:Boolean=PlayerInfoM.instance.getGameSetting().music;
        if(!musicPlay) return;

        if(musicName=="")musicName=_musicName;
        else _musicName=musicName;

        const headStr:String="https://6361-catpirate-data-a98557-1258046007.tcb.qcloud.la";
        if(musicName=="normal"){
            SoundManager.playMusic(headStr+"/music/normalMusic.mp3?sign=970b3b54b44d1b750e5b5b5279b0f6a9&t=1543388354");
            //SoundManager.playMusic(headStr+"/Av6372309.mp3?sign=3c35cfa989c887a2dd142e0e6f68a25d&t=1543333612");
        }
        else if(musicName=="fight"){
            SoundManager.playMusic(headStr+"/music/fightMusic2-5.mp3?sign=0fcec54642db56b00fb7ddf821b4b35a&t=1543393164");
        }
        else if(musicName=="boss"){
            SoundManager.playMusic(headStr+"/music/fightMusic1-5.mp3?sign=1c8ee0a9ca873808d337370fe21ca8c7&t=1543394432");
        }
        else if(musicName=="end"){
            SoundManager.playMusic(headStr+"/music/endMusic-2.mp3?sign=611f8f8f713dba9a43dce2b411b60a37&t=1543392646",1);
        }
    }
}
}
