package manager {
import laya.media.SoundManager;
import laya.utils.Handler;

import model.PlayerInfoM;

import src.GameConfig;

public class GameSoundManager {

    public static var _musicName:String;

    public function GameSoundManager() {
    }

    public static function onPlaySound(soundName:String):void
    {
        var soundPlay:Boolean=PlayerInfoM.instance.getGameSetting().sound;
        if(!soundPlay) return;

        const playNum:int=1;

        if(soundName=="btn"){
            SoundManager.playSound(GameConfig.weixinURL+"sound/sound_btn.mp3",playNum);
        }
        else if(soundName=="combo"){
            SoundManager.playSound(GameConfig.weixinURL+"sound/sound_combo.mp3",playNum);
        }
        else if(soundName=="combo2"){
            SoundManager.playSound(GameConfig.weixinURL+"sound/sound_combo2.mp3",playNum);
        }
        else if(soundName=="gamestart"){
            SoundManager.playSound(GameConfig.weixinURL+"sound/sound_gamestart.mp3",playNum);
        }
        else if(soundName=="get0"){
            SoundManager.playSound(GameConfig.weixinURL+"sound/sound_get0.mp3",playNum);
        }
        else if(soundName=="get1"){
            SoundManager.playSound(GameConfig.weixinURL+"sound/sound_get1.mp3",playNum);
        }
        else if(soundName=="get2"){
            SoundManager.playSound(GameConfig.weixinURL+"sound/sound_get2.mp3",playNum);
        }
        else if(soundName=="get3"){
            SoundManager.playSound(GameConfig.weixinURL+"sound/sound_get3.mp3",playNum);
        }
        else if(soundName=="get4"){
            SoundManager.playSound(GameConfig.weixinURL+"sound/sound_get4.mp3",playNum);
        }
        else if(soundName=="timeover"){
            SoundManager.playSound(GameConfig.weixinURL+"sound/sound_timeover0.mp3",playNum);
        }
    }

    public static function onPlayMusic(musicName:String):void
    {
        var musicPlay:Boolean=PlayerInfoM.instance.getGameSetting().music;
        if(!musicPlay) return;

        if(musicName=="")musicName=_musicName;
        else _musicName=musicName;

        if(musicName=="normal"){
            SoundManager.playMusic(GameConfig.weixinURL+"music/normalMusic.mp3");
            //SoundManager.playMusic(headStr+"/Av6372309.mp3?sign=3c35cfa989c887a2dd142e0e6f68a25d&t=1543333612");
        }
        else if(musicName=="fight"){
            SoundManager.playMusic(GameConfig.weixinURL+"music/fightMusic2-5.mp3");
        }
        else if(musicName=="boss"){
            SoundManager.playMusic(GameConfig.weixinURL+"music/fightMusic1-5.mp3");
        }
        else if(musicName=="end"){
            SoundManager.playMusic(GameConfig.weixinURL+"music/endMusic-2.mp3",1);
        }
    }

    public static function setmusicMuted(value:Boolean):void
    {
        SoundManager.musicMuted=value;
    }

    public static function setsoundMuted(value:Boolean):void
    {
        SoundManager.soundMuted=value;
    }

}
}
