package view.setting {
import laya.events.Event;
import laya.media.SoundManager;

import manager.UiManager;

import model.PlayerInfoM;

import ui.SettingUI;

import view.PanelVo;

public class Setting extends SettingUI implements PanelVo{

    public static var _instance:Setting;
    private var _settingObj:Object={};
    public function Setting() {
        super();
    }
    public static function get instance():Setting
    {
        return _instance||=new Setting();
    }

    public function openPanel(param:Object=null):void
    {
        closeBtn.on(Event.MOUSE_DOWN,this,function () {
            changeBtnState("save");
            UiManager.instance.closePanel("Setting");
        });
        musicBtn.on(Event.MOUSE_DOWN,this,changeBtnState,["setMusic"]);
        soundBtn.on(Event.MOUSE_DOWN,this,changeBtnState,["setSound"]);
        shakeBtn.on(Event.MOUSE_DOWN,this,changeBtnState,["setShake"]);
        changeBtnState("init");
    }

    private function changeBtnState(action:String):void
    {
        if(action=="init"){
            _settingObj=PlayerInfoM.instance.getGameSetting();
            musicBtn.selected=!_settingObj.music;
            soundBtn.selected=!_settingObj.sound;
            shakeBtn.selected=!_settingObj.shake;
        }
        else if(action=="save"){
            PlayerInfoM.instance.setGameSetting(_settingObj);
        }
        else if(action=="setMusic"){
            _settingObj.music=!_settingObj.music;
            musicBtn.selected=!_settingObj.music;
            if(_settingObj.music)SoundManager.musicMuted=false;
            else SoundManager.musicMuted=true;
        }
        else if(action=="setSound"){
            _settingObj.sound=!_settingObj.sound;
            soundBtn.selected=!_settingObj.sound;
            if(_settingObj.sound) SoundManager.soundMuted=false;
            else SoundManager.soundMuted=true;
        }
        else if(action=="setShake"){
            _settingObj.shake=!_settingObj.shake;
            shakeBtn.selected=!_settingObj.shake;
        }
    }


    public function closePanel():void
    {
        this.visible=false;
    }
    public function clearAllNum():void
    {

    }

    public function unRegister():void
    {

    }
    public function register():void
    {

    }
}
}
