package manager
{
    public class GameEvent
    {
        public static const GameMainPanelOpen:String="GameMainPanelOpen";




        public static const ReceiveHandshake:String = "ReceiveHandshake";//
        public static const ReceiveSGHandshake:String = "ReceiveSGHandshake";//小游戏握手
        public static const WsClose:String = "WsClose";
        public static const SGWsClose:String = "SGWsClose";//小游戏网络断开
        public static const WsError:String = "WsError";
        public static const SGWsError:String = "SGWsError";//小游戏网络出错
        public static const WsOpen:String = "WsOpen";
        public static const FightStart:String = "FightStart";//战斗开始
        public static const FightStop:String = "FightStop";//战斗结束
        public static const ParseFishData:String = "ParseFishData";//解析鱼数据
        public static const NewBullet:String = "NewBullet";//释放子弹
        public static const OnlineBullet:String = "OnlineBullet";
        public static const UpdateProfile:String = "UpdateProfile";
        public static const FightPlayerUpdate:String = "FightPlayerUpdate";//战斗玩家数据更新
        public static const FightCoinUpdate:String = "FightCoinUpdate";
        public static const ShowGetGoodsEffect:String = "ShowGetCoinEffect";//显示金币获取特效
        public static const QuitTip:String = "QuitTip" //退出游戏
        public static const MsgTip:String = "MsgTp"; //消息的toast的提示,根据msg id
        public static const MsgTipContent:String = "MsgTipContent"; //直接传提示


        public static const BatteryUpgrade:String = "BatteryUpgrade";//炮台升级
        public static const FishTypeC:String = "FishTypeC";//鱼的信息展示
        public static const RewardFish:String = "RewardFish";// 奖金鱼抽奖面板
        public static const RefreshTaskNew:String = "RefreshTaskNew";// 刷新新手任务数据
        public static const RefreshTaskDaily:String = "RefreshTaskDaily";// 刷新日常任务数据
        public static const RefreshTaskDailyTotal:String = "RefreshTaskDailyTotal";// 刷新日常任务数据
        public static const FinishTaskDaily:String = "FinishTaskDaily";// 完成日常任务
        public static const FinishTaskNew:String = "FinishTaskNew";// 完成新手任务
        public static const Shop:String = "Shop";// 商店
        public static const ShopBuy:String = "ShopBuy";// 商店购买
        public static const ShopRefresh:String = "ShopRefresh";// 刷新tab
        public static const ChangeSkin:String = "ChangeSkin";// 更换皮肤
        public static const ZhenFan:String = "ZhenFan";
        public static const TypeChange:String = "TypeChange"
        public static const LevelC:String = "LevelC"
        public static const RewardTip:String = "RewardTip"
        public static const HourseC:String = "HourseC"
        public static const BatteryBuyRet:String = "BatteryBuyRet"; //炮台更新
        public static const EnterFightPage:String = "EnterFightPage"; //进入战斗界面
        public static const BuffUpdate:String = "BuffUpdate"; //buff跟新
        public static const He:String = "He";
        public static const PlayCard:String = "PlayCard";
        public static const SkillUpdate:String = "SkillUpdate";
        public static const GoodsUpdate:String = "GoodsUpdate";
        public static const ViolentUpdate:String = "ViolentUpdate";//狂暴状态更新
        public static const BoomSelectUpdate:String = "BoomSelectUpdate";//炸弹状态切换
        public static const SignInUpdate:String = "SignInUpdate";//签到状态更新

        public static const UpdateFirstCharge:String = "UpdateFirstCharge";//更新首冲状态
		
		public static const VipBug:String = "VipBug";//Vip购买
        public static const VipPage:String = "VipPage";//显示VIP页面
        public static const VipExpUpdate:String = "VipExpUpdate";//显示VIP页面
        public static const VipBuyUpdate:String = "VipBuyUpdate";//VIP奖励领取
        public static const MonthCardUpdate:String = "MonthCardUpdate";//月卡刷新


        public static const OnlineAwardUpdate:String = "OnlineAwardUpdate"; //在线状态更新
        public static const HorseTipUpdate:String = "HorseTipUpdate"; //跑马灯提示更新
        public static const ConfirmUseSkill:String = "ConfirmUseSkill";
        public static const SmallGameOver:String = "SmallGameOver";//小游戏结束
        public static const SmallGameOp:String = "SmallGameOp"; //小游戏玩家操作
        public static const SmallGameUpdate:String = "SmallGameUpdate";//小游戏更新
        public static const SmallGameStart:String = "SmallGameStart"; //小游戏开始
        public static const UpdateRoomData:String = "UpdateRoomData";//更新房间的数据
        public static const EntryIn:String = "EntryIn";//进入房间
        public static const SmallUpdateTime:String = "SmallUpdateTime"; //刷新时间
        public static const SmallPageEnter:String = "SmallPageEnter";//进入小游戏
        public static const ShowGuide:String = "ShowGuide";//显示指引
        public static const ShowRedPoint:String = "ShowRedPoint";//显示小红点
        public static const ClearRedPoint:String = "ClearRedPoint";//消除小红点

        public static const FinishReward:String = "FinishReward";//完成抽奖的时候
        public static const UseGoodsConfirmAndJumpToShop:String = "UseGoodsConfirmAndJumpToShop";//使用道具确认并且提示进入商场

        public static const StartRefersh:String = "StartRefersh";//开始刷新游戏

        public static const ShowSubAllow:String = "ShowSubAllow";//弹出低保

        public static const SystemReset:String = "SystemReset";//系统重置

        public static const ShootError:String = "ShootError";
        public static const ClearCoin:String = "ClearCoin"
        public static const SettleIsShow:String = "SettleIshow"
        public static const SettleNoShow:String = "SettleNoShow"
        public static const StopTime:String = "StopTime"
        public static const HeCLick:String = "HeClick"
        public static const SmalGameConfirm:String = "SmalGameConfirm"
        public static const SmallGameBroke:String = "SmallGameBroke";
        public static const ReturnConfirm:String = "ReturnConfirm";
        public static const LoadUi:String = "LoadUi";
        public static const ShowFishCoin:String = "ShowFishCoin";//飘获得的鱼币
        public static const SetFishCoin:String = "SetFishCoin"
        public static const PlayComplete:String = "PlayComplete"
        public static const UpgradeC:String = "UpgradeC"
        public static const CloseRewadTip:String = "CloseRewardTip"

        public static const SmallGameInRoom:String = "SmallGameInRoom"; //是否在小游戏房间中
        public static const SmallGameExit:String = "SmallGameExit";//小游戏退出
        public static const SmallGameUiExist:String = "SmallGameUiExist"; //是否有小游戏相关界面打开
        public static const SmallGameForceExit:String = "SmallGameForceExit";//强制关闭小游戏

        public static const UpdateGoldPoolInfo:String = "UpdateGoldPoolInfo";//更新奖金池信息
        public static const GetGoldPoolAward:String = "GetGoldPoolAward"; //获得奖金池的奖金
        public static const UpdateTime:String = "UpdataTime"//更新时间

        public static const ExitLoginView:String = "ExitLoginView"; //退出登录界面
        public static const RequestSucee:String = "RequestSucee"  //创建房间成功

        public static const ScreenResize:String = "ScreenResize"; //屏幕重置
        public static const GetCatchShowEffectEndPos:String = "GetCatchShowEffectEndPos";//获取特效飞回去的位置
        public static const UpdateFish:String = "UpdateFish"//更新鱼
        public static const CloseUi:String = "CloseUi";
        public static const GoShop:String = "GoShop";
        public static const lockStart:String = "lockStart";
        public static const stopLock:String = "stopLock";
        public static const OpenMakeUp:String = "OpenMakeUp"
        public static const AutoShootTimeOut:String = "AutoShootTimeOut";
        public static const TestCom:String = "TestCom";//测试补偿奖励
        public static const PlayBossComing:String = "PlayBossComeIn";
        public static const WelcomeGetIn:String = "WelcomeGetIn";//入场动画
        public static const FishTide:String = "FishComing";//鱼潮来了
        public static const StartLoad:String = "StartLoad";//开始加载资源
        public static const RestInRoom:String = "RestInRoom"//进入房间
        public static const EntrySmallGame:String = "EntrySmallGame"//进入小游戏


        public static const GiftConfirmFinish:String = "GiftConfirmFinish"//接受赠送完成
        public static const GiftFinish:String = "GiftFinish"//赠送完成
        public static const ExchangeFinish:String = "ExchangeFinish"//兑换完成
        public static const ActivityExchangeFinish:String = "ActivityExchangeFinish"//兑换完成
        public static const UpdateExchange:String = "UpdateExchange"//更新兑换券
        public static const UpdateMiniBalance:String = "UpdateMiniBalance"//更新集结币
        public static const UpdateActivityTicket:String = "UpdateActivityTicket"//更新活动券
        public static const UpdateGoldExchange:String = "UpdateGoldExchange"//更新兑换券
    }
}
