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
            SoundManager.playSound(headStr+"/sound/sound_btn.wav?sign=74389e3510578b17d9d77aaa153aa57d&t=1543388645",playNum);
        }
        else if(soundName=="combo"){
            SoundManager.playSound(headStr+"/sound/sound_combo.wav?sign=0607979412d0e6716faa47271759fbff&t=1543388838",playNum);
        }
        else if(soundName=="combo2"){
            SoundManager.playSound(headStr+"/sound/sound_combo2.wav?sign=9e421280202df18386e69ad8fb3c5aea&t=1543388866",playNum);
        }
        else if(soundName=="gamestart"){
            SoundManager.playSound(headStr+"/sound/sound_gamestart.wav?sign=197c15277379aae6cd99b49725e9efd0&t=1543388906",playNum);
        }
        else if(soundName=="get0"){
            SoundManager.playSound(headStr+"/sound/sound_get0.wav?sign=b410c4193a195d95213cad1d9b5147a2&t=1543388947",playNum);
        }
        else if(soundName=="get1"){
            SoundManager.playSound(headStr+"/sound/sound_get1.wav?sign=7a856bba1617e4d2e1e8852216f09f70&t=1543388970",playNum);
        }
        else if(soundName=="get2"){
            SoundManager.playSound(headStr+"/sound/sound_get2.wav?sign=94a3d1171669747ec9a96a492ee82cd1&t=1543388996",playNum);
        }
        else if(soundName=="get3"){
            SoundManager.playSound(headStr+"/sound/sound_get3.wav?sign=3d7663cd9c493ed69111e09c505d43c2&t=1543389019",playNum);
        }
        else if(soundName=="get4"){
            SoundManager.playSound(headStr+"/sound/sound_get4.wav?sign=a5f58a4d02f70545e2788f99984431ce&t=1543389044",playNum);
        }
        else if(soundName=="timeover"){
            SoundManager.playSound(headStr+"/sound/sound_timeover0.wav?sign=f6630c228cdacd59dad99336ca59f957&t=1543391077",playNum);
        }
    }

    public static function onPlayMusic(musicName:String):void
    {
        var musicPlay:Boolean=PlayerInfoM.instance.getGameSetting().music;
        if(!musicPlay) return;

        _musicName=musicName;
        const headStr:String="https://6361-catpirate-data-a98557-1258046007.tcb.qcloud.la";
        if(musicName=="normal"){
            SoundManager.playMusic(headStr+"/music/normalMusic.mp3?sign=970b3b54b44d1b750e5b5b5279b0f6a9&t=1543388354");
            //SoundManager.playMusic(headStr+"/Av6372309.mp3?sign=3c35cfa989c887a2dd142e0e6f68a25d&t=1543333612");
        }
        else if(musicName=="fight"){
            SoundManager.playMusic(headStr+"/music/fightMusic2-3.wav?sign=af025c281c3d1f3a8ed434204fadac72&t=1543388429");
        }
        else if(musicName=="end"){
            SoundManager.playMusic(headStr+"/music/endMusic-1.wav?sign=80f8ab0a1b4773fa05fb15b6a40a7564&t=1543388451");
        }
    }
}
}
