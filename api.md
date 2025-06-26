
目录
wiki
登录

事件列表：Event
 彼得兔
更新时间: 2025-05-07 15:25:41
直接添加要监听的事件即可，无需自行创建事件管理对象。具体例子如下：

--游戏事件---
ScriptSupportEvent:registerEvent([=[Game.Start]=], Game_StartGame)
ScriptSupportEvent:registerEvent([=[Game.Run]=], Game_Update)
ScriptSupportEvent:registerEvent([=[Game.End]=], Game_GameOver)
--玩家事件---
ScriptSupportEvent:registerEvent([=[Player.Die]=], Player_Dead)
ScriptSupportEvent:registerEvent([=[Player.Revive]=], Player_Revive)
ScriptSupportEvent:registerEvent([=[Player.AddItem]=], BackPack_AddItem)
--方块事件---
ScriptSupportEvent:registerEvent([=[Block.Add]=], Block_Add)
ScriptSupportEvent:registerEvent([=[Block.DestroyBy]=], Block_Destroy)
ScriptSupportEvent:registerEvent([=[Block.Trigger]=], Block_Trigger)
Lua
 

目录

世界事件：地图内相关的事件
游戏逻辑：游戏逻辑相关的事件
玩家事件：玩家相关的事件
生物事件：生物(非玩家)相关的事件
方块事件：游戏内方块相关的事件
道具事件：道具相关的事件
特效事件：特效相关的事件
UI事件：自定义UI的事件
其他事件：其他事件
 

世界事件 (World)

名称	用法描述	接口参数	参数说明
Backpack.ItemChange	容器内道具变化	blockid,itemid,itemnum,x,y,z	方块类型,道具类型,道具数量,方块坐标
Backpack.ItemPutIn	容器内有道具放入	blockid,itemid,itemnum,x,y,z	方块类型,道具类型,道具数量,方块坐标
Backpack.ItemTakeOut	容器内有道具取出	blockid,itemid,itemnum,x,y,z	方块类型,道具类型,道具数量,方块坐标
 

游戏逻辑 (Game)
名称	用法描述	接口参数	参数说明
Game.Hour	世界小时时间变化	hour	游戏小时时间
Game.RunTime	世界Tick变化	second,ticks	游戏分钟,游戏秒
 

玩家事件 (Player)

名称	用法描述	接口参数	参数说明
Game.AnyPlayer.Defeat	任一玩家失败	eventobjid,shortix,x,y,z	事件玩家,快捷栏索引,坐标位置
Game.AnyPlayer.EnterGame	任一玩家进入	eventobjid,shortix,x,y,z	事件玩家,快捷栏索引,坐标位置
Game.AnyPlayer.LeaveGame	任一玩家离开	eventobjid,shortix,x,y,z	事件玩家,快捷栏索引,坐标位置
Game.AnyPlayer.Victory	任一玩家胜利	eventobjid,shortix,x,y,z	事件玩家,快捷栏索引,坐标位置
Player.AddBuff	玩家获得状态效果	eventobjid,buffid,bufflvl	事件玩家,状态ID,状态等级
Player.AddItem	玩家获得道具	eventobjid,itemid,itemnum	事件玩家,道具类型,道具数量
Player.AreaIn	玩家进入区域	eventobjid,areaid	事件玩家,区域ID
Player.AreaOut	玩家离开区域	eventobjid,areaid	事件玩家,区域ID
Player.AttackHit	玩家击中目标	eventobjid,targetactorid	事件玩家,被攻击的对象
Player.Attack	玩家攻击	eventobjid,shortix,x,y,z	玩家攻击
Player.BackPackChange	背包栏变化	
eventobjid,itemid,

itemnum,itemix

事件玩家,道具类型,道具数量,

道具所在格子索引

Player.BeHurt	玩家受到伤害	eventobjid,hurtlv	事件玩家,伤害值
Player.ChangeAttr	玩家属性变化	
eventobjid,shortix,playerattr,

playerattrval,x,y,z

事件玩家,快捷栏索引,改变的属性,

改变的值,坐标位置

Player.ClickActor	点击生物	eventobjid,targetactorid	事件玩家,被点击的对象
Player.ClickBlock	点击方块	eventobjid,blockid,x,y,z	事件玩家,点击的方块类型,方块位置
Player.Collide	玩家跟玩家/生物碰撞	eventobjid,toobjid	事件玩家,目标对象
Player.ConsumeItem	玩家消耗道具	eventobjid,itemid,itemnum	玩家消耗道具
Player.DamageActor	玩家造成伤害	
eventobjid,toobjid,

targetactorid,hurtlv

事件玩家,事件目标对象,

目标玩家,伤害值

Player.DefeatActor	玩家击败目标	
eventobjid,toobjid,

targetactorid

事件玩家,事件目标对象,

被攻击的对象

Player.Die	玩家死亡	eventobjid,shortix,x,y,z	事件玩家,快捷栏索引,坐标位置
Player.DiscardItem	丢弃道具	
eventobjid,itemid,

itemnum,toobjid

事件玩家,道具类型,

道具数量,掉落物objid

Player.DismountActor	玩家骑乘下	eventobjid,targetactorid	事件玩家,被攻击的对象
Player.EquipChange	装备栏变化	
eventobjid,itemid,

itemnum,itemix

事件玩家,道具类型,道具数量,

道具所在格子索引

Player.EquipOff	脱下装备	
eventobjid,itemid,

itemnum,itemix

事件玩家,道具类型,道具数量,

道具所在格子索引

Player.EquipOn	穿上装备	
eventobjid,itemid,

itemnum,itemix

事件玩家,道具类型,道具数量,

道具所在格子索引

Player.InputContent	输入字符串	eventobjid,content	事件玩家,事件中的字符串
Player.InputKeyDown	玩家按下按键	eventobjid,vkey	事件玩家,按下的键值
Player.InputKeyOnPress	玩家长按按键	eventobjid,vkey	事件玩家,按下的键值
Player.InputKeyUp	玩家松开按键	eventobjid,vkey	事件玩家,按下的键值
Player.InvateFriend	邀请好友 	eventobjid,toobjid	事件玩家,事件目标玩家
Player.LevelModelUpgrade	玩家等级发生改变	eventobjid	事件玩家
Player.MotionStateChange	玩家行为状态变更	eventobjid,playermotion	事件玩家,行为状态枚举
Player.MountActor	玩家骑乘上	eventobjid,targetactorid	事件玩家,被攻击的对象
Player.MoveOneBlockSize	玩家移动(移动一格)	eventobjid,shortix,x,y,z	事件玩家
Player.NewInputContent	从聊天框输入	eventobjid,content	事件玩家,事件中的字符串
Player.PickUpItem	玩家拾取	
eventobjid,toobjid,

itemid,itemnum

事件玩家,掉落物objid,

道具类型ID,道具数量

Player.PlayAction	玩家使用表情动作	eventobjid,act	事件玩家,动作ID
Player.RemoveBuff	玩家失去指定状态效果	eventobjid,buffid,bufflvl	事件玩家,状态ID,状态等级
Player.Revive	玩家复活	eventobjid,shortix,x,y,z	事件玩家,快捷栏索引,坐标位置
Player.SelectShortcut	快捷栏选择	eventobjid,itemid,itemnum	事件玩家,道具类型,道具数量
Player.ShortcutChange	快捷栏变化	
eventobjid,itemid,

itemnum,itemix

事件玩家,道具类型,道具数量,

道具所在格子索引

Player.UseGiftPack	局部此类包裹道具被使用[]	eventobjid,itemid,itemnum	事件对象,道具类型,道具数量
Player.UseItem	玩家使用道具	
eventobjid,itemid,

itemnum,itemix

事件玩家,道具类型,道具数量,

道具所在格子索引

 

生物事件 (Actor)

名称	用法描述	接口参数	参数说明
Actor.AddBuff	生物获得状态效果	eventobjid,actorid,buffid,bufflvl	事件生物,事件生物类型,状态ID,状态等级
Actor.AreaIn	生物进入区域	eventobjid,areaid	事件生物,区域ID
Actor.AreaOut	生物离开区域	eventobjid,areaid	事件生物,区域ID
Actor.AttackHit	攻击命中	
eventobjid,toobjid,

actorid,targetactorid

事件生物,攻击对象,事件生物类型,

攻击对象生物类型

Actor.Attack	攻击	
eventobjid,toobjid,

actorid,targetactorid

事件生物,攻击对象,事件生物类型,

攻击对象生物类型

Actor.BeHurt	受到伤害	
eventobjid,toobjid,

hurtlv,actorid

事件生物,攻击对象,伤害值,事件生物类型
Actor.Beat	生物击败玩家/生物	
eventobjid,toobjid,

actorid,targetactorid

事件生物,攻击对象,事件生物类型,

攻击对象生物类型

Actor.ChangeAttr	属性变化	
eventobjid,actorid,

actorattr,actorattrval

事件生物,事件生物类型,属性枚举值,改变的值
Actor.ChangeMotion	生物行为状态变更到[n]	eventobjid,actorid,actormotion	事件生物,事件生物类型,动作枚举值
Actor.Collide	碰撞到玩家/生物	
eventobjid,toobjid,

actorid,targetactorid

事件生物,攻击对象,事件生物类型,

攻击对象生物类型

Actor.Create	被创建	eventobjid,actorid	事件生物,事件生物类型
Actor.Damage	造成伤害	
eventobjid,toobjid,hurtlv,

actorid,targetactorid

事件生物,攻击对象,伤害值,事件生物类型,

攻击对象生物类型

Actor.Die	死亡	eventobjid,toobjid,actorid	事件生物,攻击对象,事件生物类型
Actor.Projectile.Hit	投掷物击中	
eventobjid,toobjid,itemid,

targetactorid,x,y,z,

helperobjid

事件投掷物对象,被击中的对象,道具类型,

被击中的生物类型,方块坐标,

投掷物所属对象

Actor.RemoveBuff	生物失去状态效果	eventobjid,actorid,buffid,bufflvl	事件生物,事件生物类型,状态ID,状态等级
 

方块事件 (Block)

名称	用法描述	接口参数	参数说明
Block.Add	被创建	blockid,x,y,z	方块类型,方块坐标
Block.DestroyBy	局部此类方块被破坏时	eventobjid,blockid,x,y,z	事件玩家,方块类型,方块坐标
Block.Dig.Begin	任意方块被挖掘时	eventobjid,blockid,x,y,z	事件玩家,方块类型,方块坐标
Block.Dig.Cancel	任意方块被挖掘取消	eventobjid,blockid,x,y,z	事件玩家,方块类型,方块坐标
Block.Dig.End	方块被挖	eventobjid,blockid,x,y,z	事件玩家,方块类型,方块坐标
Block.Remove	方块移除	blockid,x,y,z	方块类型,方块坐标
Block.Trigger	活跃/通电	eventobjid,blockid,x,y,z	事件玩家,方块类型,方块坐标
 

道具事件 (Item)

名称	用法描述	接口参数	参数说明
DropItem.AreaIn	掉落物进入区域	eventobjid,areaid,itemid	事件掉落物,区域ID,道具类型
DropItem.AreaOut	掉落物离开区域	eventobjid,areaid,itemid	事件掉落物,区域ID,道具类型
Item.Create	掉落物被创建	
eventobjid,itemid,

defaultvalue,x,y,z

事件掉落物,道具类型,掉落方式,方块坐标
Item.Destroy	局部此类装备被破坏时	eventobjid,itemid,itemnum	事件对象,道具类型,道具数量
Item.Disappear	掉落物消失	eventobjid,itemid,itemnum,x,y,z	事件掉落物,道具类型,道具数量,方块坐标
Item.Pickup	掉落物被拾取	
eventobjid,toobjid,itemid,

itemnum,x,y,z

事件玩家,被拾取的对象,道具类型,

道具数量,方块坐标

Item.expend	局部此类食物道具被消耗	eventobjid,itemid,itemnum	事件对象,道具类型,道具数量
Missile.AreaIn	投掷物进入区域	eventobjid,areaid,itemid,
helperobjid

事件投掷物,区域ID,道具类型,

投掷物所属对象

Missile.AreaOut	投掷物离开区域	eventobjid,areaid,itemid,
helperobjid

事件投掷物,区域ID,道具类型,
投掷物所属对象

Missile.Create	投掷物被创建	eventobjid,itemid,toobjid,x,y,z	事件玩家,道具类型,事件投掷物,方块坐标
Particle.Item.OnCreate	当特效在掉落物上创建	eventobjid,effectid,x,y,z	事件掉落物,特效类型,方块位置
 
特效事件 (Particle)

名称	用法描述	接口参数	参数说明
Particle.Mob.OnCreate	任意生物身上特效被创建	eventobjid,effectid,x,y,z	事件生物,特效类型,方块位置
Particle.Player.OnCreate	任意玩家身上特效被创建	eventobjid,effectid,x,y,z	事件玩家,特效类型,方块位置
Particle.Pos.OnCreate	任意位置上特效被创建	effectid,x,y,z	特效类型,方块位置
Particle.Projectile.OnCreate	任意投掷物特效被创建	eventobjid,effectid,x,y,z	事件投掷物,特效类型,方块位置
 

UI事件 (UI)

名称	用法描述	接口参数	参数说明
UI.Button.Click	按钮松开	eventobjid,CustomUI,uielement	事件玩家,事件UI,事件元件
UI.Button.TouchBegin	按钮按下	eventobjid,CustomUI,uielement	事件玩家,事件UI,事件元件
UI.GLoader3D.Click
当前界面的模型被松开
eventobjid,CustomUI,uielement
事件玩家,事件UI,事件元件
UI.GLoader3D.TouchBegin
当前界面的模型被按下
eventobjid,CustomUI,uielement
事件玩家,事件UI,事件元件
UI.Hide	界面被关闭	eventobjid,CustomUI	事件玩家,事件UI
UI.LostFocus	自定义ui输入框失去焦点	
eventobjid,CustomUI,

uielement,content

事件玩家,事件UI,事件元件,输入的内容
UI.Show	界面被打开	eventobjid,CustomUI	事件玩家,事件UI
 

其他事件 (*)

名称	用法描述	接口参数	参数说明
BluePrint.BuildBegin	蓝图开始创建	areaid	区域ID
Craft.end	任意配方合成完成	eventobjid,craftid,itemid,itemnum	事件对象,配方ID,道具类型,道具数量
Developer.BuyItem	
任意玩家购买或提取

商品道具

eventobjid,itemid	事件对象,道具类型
Furnace.begin	任意熔炼开始	furanceid,x,y,z	熔炼ID,方块位置
Furnace.end	任意熔炼结束	furanceid,x,y,z	熔炼ID,方块位置
MiNiVip_1	购买迷你大会员1个月	eventobjid	事件玩家
MiNiVip_3	购买迷你大会员3个月	eventobjid	事件玩家
Plot.begin	任意剧情开始	eventobjid,toobjid,plotid,targetactorid	事件对象,目标对象,剧情类型,目标生物类型
Plot.end	任意剧情结束	eventobjid,toobjid,plotid,targetactorid	事件对象,目标对象,剧情类型,目标生物类型
QQMusic.PlayBegin	QQ音乐开始播放	eventobjid,qqMusicId	事件玩家,音乐ID
minitimer.change	指定计时器变化	timerid,timername,timertime	计时器ID,计时器名称,计时器时间
 


目录
wiki
登录

游戏规则：GameRule
 彼得兔
更新时间: 2023-04-26 18:46:34
游戏规则可直接通过规则名称设置和获取，需注意的是：大部分规则需要在游戏开始之前设置，也就是在Game.Start事件之前设置，否则规则不会生效。 用法示例如下：

local GameRule = class.GameRule.new()
function InitGameRule()
	GameRule.EndTime = 6  		 --游戏时长
	GameRule.TeamNum = 2         --队伍数量
	GameRule.MaxPlayers = 6      --最大玩家量
	GameRule.StartMode = 0       --开启模式 0:主开
	GameRule.StartPlayers = 1    --最低玩家量 2人
	GameRule.PlayerDieDrops = 1  --死亡掉落 1:true
	GameRule.DisplayScore = 1    --显示比分 1:true
	GameRule.AllowMidwayJoin = 1 --中途加入 1:允许
	GameRule.ScoreKillPlayer = 1 --击杀玩家 得1分
	GameRule.BlockDestroy = 1    --方块可被摧毁 1:true
	GameRule.WinLoseEndTime = 1  --游戏超时结束则全胜

	if GameRule.CameraDir ~= 1 then
		GameRule.CameraDir = 1 --设置缺省正视角
	end
end
Lua
 

名称

描述

GameRule.CurTime

编辑模式设置的游戏时间

GameRule.TimeLocked

编辑模式设定的是否锁定时间(0:不锁定 1:锁定)

GameRule.Weather

编辑模式设定的天气(0:晴雨交错 1:晴天 2:雨天 3:雷暴)

GameRule.MaxPlayers

编辑模式设定的最大玩家数量

GameRule.BlockDestroy

编辑模式设定的是否可破坏方块(0:不可 1:可以)

GameRule.BlockPlace

编辑模式设定的是否可放置方块(0:不可 1:可以)

GameRule.BlockUse

编辑模式设定的是否可使用方块(0:不可 1:可以)

GameRule.GravityFactor

编辑模式设定的重力倍数(0.1到10之间)

GameRule.CameraDir

编辑模式设定的视角(0:主视角 1:背视角 2:正视角 3:锁定主视角 4:锁定背视角 5:锁定正视角 6:锁定俯视角 7:锁定自定义视角 8:背视角2 9:锁定背视角2)

GameRule.StartMode

编辑模式设定的游戏开启模式

(0:房主开启 1:达到人数自动开启 2:不限条件自动开启)

GameRule.StartPlayers

编辑模式设定的开启游戏需求人数

GameRule.TeamNum

编辑模式设定的队伍数量

GameRule.AttackPlayerMode

编辑模式设定的攻击模式(0:队伍间攻击 1:禁止攻击玩家 2:自由攻击)

GameRule.EndTime

编辑模式设定的游戏是否限时(0:不限时 1-60:限时1-60分钟)

GameRule.EndScore

编辑模式设定的是否达到分数获得胜利(0:否 1-999:达到1-999分获得胜利)

GameRule.ScoreKillPlayer

编辑模式设定的战胜玩家得分分数

GameRule.ScoreKillMob

编辑模式设定的战胜怪物得分分数

GameRule.ScoreCollectStar

编辑模式设定的获得星星得分分数

GameRule.ReviveMode

编辑模式设定的再次挑战时间(0:默认 1-320:死亡后1-320秒自动复活)

GameRule.ReviveInvulnerable

编辑模式设定的再次挑战保护时间(1到99秒之间，0为默认5秒)

GameRule.DisplayName

编辑模式设定的玩家名显示模式

(0:所有人可见 1:仅己方队伍可见 2:仅敌方队伍可见 3:全部不可见)

GameRule.WinLoseEndTime

编辑模式设定的时间结束胜利判定

(0:分数高的队伍获胜 1:时间结束全体胜利 2:时间结束全体失败)

GameRule.SaveMode

编辑模式设定的是否退出重置(0:否 1:是)

GameRule.KillNotify

编辑模式设定的是否开启战斗提示(0:否 1:是)

GameRule.BgMusicMode

编辑模式设定的游戏背景音乐(-1:无音乐 0:默认 1-8:bgm1-8)

GameRule.MobGen

编辑模式设定的是否生成怪物(-1:创建时没有勾选生成怪物 0:否 1:是)

GameRule.SpawnPtMode

编辑模式设定的集结点规则(0:随机到小队集结点 1:到最近小队集结点)

GameRule.MinimapTeams

编辑模式设定的地图显示选项(0:不同队伍可见 1:不同队伍不可见)

GameRule.PlayerDieDrops

编辑模式设定的玩家战败是否掉落物品

(0:正常掉落 1:清空背包 2:保留物品 3:掉落箱子)

GameRule.DisplayScore

编辑模式设定的是否显示比分和时间(0:否 1:是)

GameRule.LifeNum

编辑模式设定的是否限制游戏生命数(0:不限制 1-99:限制生命数为1-99)

GameRule.ShowSight

编辑模式设定的是否显示准心(0:不显示 1:显示)

GameRule.ScoreColorChange

编辑模式设定的染色得分分数

GameRule.GPoisonSwitch

编辑模式设定的是否开启污染区(0:否 1:是)

GameRule.GPoisonSafeD0

编辑模式设定的第一个安全区半径(1到100区块)

GameRule.GPoisonSafeT0

编辑模式设定的第一段安全时间(1到600秒)

GameRule.AllowMidwayJoin

编辑模式设定的是否允许中途加入游戏(0:否 1:是)

GameRule.LifeNumTeamShare

编辑模式设定的是否开启队伍共用生命数(0:否 1是)

GameRule.ViewMode

编辑模式设定的是否开启失败观战(0:否 1:是)

GameRule.ViewType

编辑模式设定的观战类型(0:自由观战 1:跟随屏幕 2:可切换)

GameRule.CountDown

编辑模式设定的游戏开启倒计时时长(1到100秒)

GameRule.ScoreResetRound

编辑模式设定的是否开启回合模式(0:否 1:是)

GameRule.ResetScore

编辑模式设定的达到分数重置的分数(1至100)

 

目录
wiki
登录

游戏接口：Game
 彼得兔
更新时间: 2024-05-07 15:52:59
具体函数名及描述如下:

序号	函数名	函数描述
1	doGameEnd(...)	游戏结束
2	dispatchEvent(...)	派发自定义事件
3	getDefString(...)	获取默认字符串
4	setScriptVar(...)	设置脚本参数，供自定义使用
5	getScriptVar(...)	获取脚本参数，自定义使用
6	sendScriptVars2Client(...)	上传设置好的脚本参数
7	addRenderGlobalEffect(...)	新增全局效果
8	removeRenderGlobalEffect(...)	移除全局效果
9	setRenderGlobalEffectPos(...)	设置全局效果位置
10	setRenderGlobalEffectScale(...)	设置全局效果缩放
11	msgBox(...)	消息弹框
12	splitStr(...)	分割字符串
 

doGameEnd

参数及类型： 无
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 游戏结束
具体使用案例如下：
--每当玩家做动画表情，就会游戏结束
--当玩家做动画表情时执行此函数
local function Player_PlayAction(event)
    --结束游戏
    Game:doGameEnd(nil)
end
--注册一个动画表情监听器，事件发生时执行上面的函数
ScriptSupportEvent:registerEvent([=[Player.PlayAction]=],Player_PlayAction)
Lua
 

dispatchEvent

参数及类型：
msgid:string事件ID
params:table事件参数
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 派发自定义事件
具体使用案例如下：
--派发自定义事件
local function func_event(param)
    -- 自定义事件的数据
    local data = {id = 123,ops = "aaa"}
    -- 将数据转化为json字符串形式
    local ok, json = pcall(JSON.encode, JSON, data)
    -- 派发自定义事件，将json字符串存储在customdata字段中
    Game:dispatchEvent("customevent",{customdata = json})
end
ScriptSupportEvent:registerEvent('Player.PlayAction', func_event)
--自定义事件监听
local function func_event(param)
    -- 从事件数据的customdata字段中取出json字符串，并解码成原先的数据格式
    local ret, data = pcall(JSON.decode,JSON,param.customdata)
    -- 按照原先的格式读取事件的数据
    if data then
        print("id:"..tostring(data.id))
        print("ops:"..data.ops)
    end
end
ScriptSupportEvent:registerEvent('customevent', func_event)
Lua
 

getDefString

参数及类型：
id:string字符串ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
str:string获取到的字符串
该方法的主要作用： 获取默认字符串
具体使用案例如下：
--获取id为1的默认字符串，参数1为默认字符串id(不建议使用此接口)
local result,str=Game:getDefString(1)
--在聊天框显示
Chat:sendSystemMsg("id为1的默认字符串内容为："..str)
Lua
 

setScriptVar

参数及类型：
index:number序列索引(0~100)
val:number索引对应的值
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 设置脚本参数，供自定义使用
具体使用案例如下：
local code = Game:setScriptVar(index, val)
if code == ErrorCode.OK then
    print('执行成功', code )
else
    print('执行失败')
end
Lua
 

getScriptVar

参数及类型：
index:number序列索引(0~100)
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
val:number索引对应的值
该方法的主要作用： 获取脚本参数，自定义使用
具体使用案例如下：
local code, val = Game:getScriptVar(index)
if code == ErrorCode.OK then
    print('执行成功', code, val )
else
    print('执行失败')
end
Lua
 

sendScriptVars2Client

参数及类型： 无
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 上传设置好的脚本参数
具体使用案例如下：
local code = Game:sendScriptVars2Client()
if code == ErrorCode.OK then
    print('执行成功', code )
else
    print('执行失败')
end
Lua
 

addRenderGlobalEffect

参数及类型：
path:string效果名称
effectid:number命名ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 新增全局效果
具体使用案例如下：
--在游戏添加一个迷雾特效，目前参数只支持一个"particles/Fog.ent"
local result,effectid = Game:addRenderGlobalEffect("particles/Fog.ent")
--在聊天框显示
Chat:sendSystemMsg("添加了一个迷雾效果！id为"..effectid)
Lua
 

removeRenderGlobalEffect

参数及类型：
effectid:number命名ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 移除全局效果
具体使用案例如下：
--移除id为1的地图特效，参数1为要移除的特效id
Game:removeRenderGlobalEffect(1)
--在聊天框显示
Chat:sendSystemMsg("移除了id为1的地图特效")
Lua
 

setRenderGlobalEffectPos

参数及类型：
effectid:number命名ID
x,y,z:number方块坐标
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 设置全局效果位置
具体使用案例如下：
--把id为1的地图特效移动至(10,10)高度7
--第一个参数为特效id
--后三个参数为移动至坐标
Game:setRenderGlobalEffectPos(1,10,7,10)
--在聊天框显示
Chat:sendSystemMsg("把id为1的特效移动到了坐标(0,0)高度7的位置")
Lua
 

setRenderGlobalEffectScale

参数及类型：
effectid:number命名ID
scalex:numberx缩放值
scaley:numbery缩放值
scalez:numberz缩放值
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 设置全局效果缩放
具体使用案例如下：
--把id为1的地图特效放大两倍
--第一个参数为需要缩放的特效id
--后三个参数分别为特效在x、y、z方向上的缩放倍数
Game:setRenderGlobalEffectScale(1,2,2,2)
--在聊天框显示
Chat:sendSystemMsg("把id为1的特效放大了2倍")
Lua
 

msgBox

参数及类型：
msg:string设置的消息
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 消息弹框
具体使用案例如下：
--每当玩家做动画表情，显示一个弹窗
--当玩家做动画表情时执行此函数
local function Player_PlayAction(event)
    --显示一个游戏弹窗，参数为弹窗显示内容
    Game:msgBox("这是一个弹窗！")
end
--注册一个动画表情监听器，事件发生时执行上面的函数
ScriptSupportEvent:registerEvent([=[Player.PlayAction]=],Player_PlayAction)
Lua
 

splitStr

参数及类型：
str:string分割的字符串
mark:'string'分割符号
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
strs:table字符串组
该方法的主要作用： 分割字符串
具体使用案例如下：
local code, strs = Game:splitStr(str, mark)
if code == ErrorCode.OK then
    print('执行成功', code, strs )
else
    print('执行失败')
end
Lua
 


目录
wiki
登录

方块接口：Block
 彼得兔
更新时间: 2024-08-27 11:04:56
具体函数名及描述如下：

序号	函数名	函数描述
1	isSolidBlock(...)	是否是固体方块
2	isLiquidBlock(...)	是否是液体方块
3	isAirBlock(...)	是否是气体方块
4	getBlockID(...)	获取block对应id
5	setBlockAll(...)	设置blockalldata 更新+通知
6	getBlockData(...)	获得blockdata
7	destroyBlock(...)	摧毁方块 dropitem:掉落道具(默认false,不掉落)
8	placeBlock(...)	放置方块
9	replaceBlock(...)	替换方块
10	setBlockAllForUpdate(...)	设置blockalldata 通知周围方块
11	setBlockAllForNotify(...)	设置blockalldata 更新当前位置方块
12	setBlockSettingAttState(...)	设置方块设置属性状态
13	getBlockSettingAttState(...)	获取方块设置属性状态
14	getBlockSwitchStatus(...)	获取功能方块的开关状态
15	setBlockSwitchStatus(...)	设置功能方块的开关状态
16	getBlockDataByDir(...)	通过方向获取方块data值
17	getBlockPowerStatus(...)	获取方块的通电状态
18	randomBlockID(...)
获取随机方块id
19	GetBlockDefName(...)
获取方块名称
20	GetBlockDefDesc(...)
获取方块描述
21	GetBlockFacade(...)
获取方块外观
22	PlayAct(...)
微缩方块播放动作
23	ReplaceBluePrint(...)
放置蓝图
 
isSolidBlock
参数及类型：

x,y,z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：是否为固体方块

具体使用案例如下：

--判断(0,0)高度6的位置是不是固体方块
local result=Block:isSolidBlock(0,6,0)
if result==0 then--是固体方块
	Chat:sendSystemMsg("坐标(0,0)高度6的位置是固体方块")
else--不是固体方块
	Chat:sendSystemMsg("坐标(0,0)高度6的位置不是固体方块")
end
Lua
isLiquidBlock
参数及类型：

x,y,z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：是否为液体方块

具体使用案例如下：

--判断(0,0)高度6的位置是不是液体方块
local result=Block:isLiquidBlock(0,6,0)
if result==0 then--是液体方块
	Chat:sendSystemMsg("坐标(0,0)高度6的位置是液体方块")
else--不是液体方块
	Chat:sendSystemMsg("坐标(0,0)高度6的位置不是液体方块")
end
Lua
isAirBlock
参数及类型：

x,y,z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：是否为气体方块

具体使用案例如下：

--判断(0,0)高度6的位置是不是气体方块
local result=Block:isAirBlock(0,6,0)
if result==0 then--是气体方块
	Chat:sendSystemMsg("坐标(0,0)高度6的位置是气体方块")
else--不是气体方块
	Chat:sendSystemMsg("坐标(0,0)高度6的位置不是气体方块")
end
Lua
getBlockID
参数及类型：

x,y,z:number
返回值及类型：

ErrorCode.OK
id:number
该方法的主要作用：获取指定位置的方块ID

具体使用案例如下：

--获取(0,0)高度6的位置的方块id
local result,id=Block:getBlockID(0,6,0)
--在聊天框显示
Chat:sendSystemMsg("(0,0)高度6的位置的方块id是"..id)
Lua
setBlockAll
参数及类型：

x,y,z:number
blockid:number
data:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置blockalldata 更新+通知

具体使用案例如下：

--把(0,0)高度6的位置设置为基岩
--倒数第二个参数1为方块id，最后一个参数0为方块data
--data是方块数据，比如硬砂块的颜色、音乐方块的音调等等，具体可以用getBlockData获取
Block:setBlockAll(0,6,0,1,0)
--在聊天框显示
Chat:sendSystemMsg("把(0,0)高度6的位置设置为基岩，data为0")
Lua
getBlockData
参数及类型：

x,y,z:number
返回值及类型：

ErrorCode.OK
data:number
该方法的主要作用：获得blockdata

具体使用案例如下：

--获取(0,0)高度6的位置的方块data
--data是方块数据，比如硬砂块的颜色、音乐方块的音调等等
local result,data=Block:getBlockData(0,6,0)
--在聊天框显示
Chat:sendSystemMsg("(0,0)高度6的位置的方块data是"..data)
Lua
destroyBlock
参数及类型：

x,y,z:number
dropitem:boolean
返回值及类型：

ErrorCode.OK
该方法的主要作用：摧毁方块 dropitem:掉落道具(默认false,不掉落)

具体使用案例如下：

--破坏(0,0)高度6的方块并掉落
--最后一个参数true为掉落，false为不掉落
Block:destroyBlock(0,6,0,true)
--在聊天框显示
Chat:sendSystemMsg("破坏了(0,0)高度6的方块并掉落")
Lua
placeBlock
参数及类型：

blockid:number
x,y,z:number
face:number
color:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：放置方块

具体使用案例如下：

--在(0,0)高度7放置一个基岩，朝向西。如果这个位置已经有了方块是无法放置的。
--第一个参数1为放置的方块id
--中间三个参数0,7,0为放置坐标
--最后一个参数0为朝向参数：0西 1东 2南 3北 4下 5上
Block:placeBlock(1,0,7,0,0)
--在聊天框显示
Chat:sendSystemMsg("在(0,0)高度7的位置放置了一个基岩，朝向西")
Lua
replaceBlock
参数及类型：

blockid:number
x,y,z:number
face:number
color:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：替换方块

具体使用案例如下：

--把(0,0)高度6的位置替换为基岩，朝向西。
--第一个参数1为放置的方块id
--中间三个参数0,6,0为替换坐标
--最后一个参数0为朝向参数：0西 1东 2南 3北 4下 5上
Block:replaceBlock(1,0,6,0,0)
--在聊天框显示
Chat:sendSystemMsg("(0,0)高度6的位置被替换成了基岩，朝向西")
Lua
setBlockAllForUpdate
参数及类型：

x,y,z:number
blockid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置blockalldata 通知周围方块

具体使用案例如下：

--把(0,0)高度6的位置设置为基岩(id:1)
--前三个参数0,6,0为坐标，最后一个参数1为方块id
Block:setBlockAllForUpdate(0,6,0,1)
--在聊天框显示
Chat:sendSystemMsg("(0,0)高度6的位置被设置为了基岩")
Lua
setBlockAllForNotify
参数及类型：

x,y,z:number
blockid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置blockalldata 更新当前位置方块

具体使用案例如下：

--把(0,0)高度6的位置设置为基岩(id:1)
--前三个参数0,6,0为坐标，最后一个参数1为方块id
Block:setBlockAllForNotify(0,6,0,1)
--在聊天框显示
Chat:sendSystemMsg("(0,0)高度6的位置被设置为了基岩")
Lua
setBlockSettingAttState
参数及类型：

blockid:number
attrtype:BLOCKATTR_ENABLE
switch:boolean
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置方块设置属性状态

具体使用案例如下：

--把所有土块设置为不可破坏
--第一个参数101为方块id
--第二个参数1为方块属性：1破坏 2操作 4推拉 8掉落 16推拉掉落
--第三个参数false为“不可”，改为true表示“可以”
Block:setBlockSettingAttState(101,1,false)
--在聊天框显示
Chat:sendSystemMsg("所有土块被设置为了不可破坏！")
Lua
getBlockSettingAttState
参数及类型：

blockid:number
attrtype:BLOCKATTR_ENABLE
返回值及类型：

ErrorCode.OK
switch:boolean
该方法的主要作用：获取方块设置属性状态

具体使用案例如下：

--获取土块是否可被破坏
--第一个参数101为方块id
--第二个参数1为方块属性：1破坏 2操作 4推拉 8掉落 16推拉掉落
local result,switch=Block:getBlockSettingAttState(101,1)
if switch then--可以破坏
	Chat:sendSystemMsg("土块可以被破坏！")
else--不可破坏
	Chat:sendSystemMsg("土块无法被破坏！")
end
Lua
getBlockSwitchStatus
参数及类型：

pos:table{x,y,z}
返回值及类型：

ErrorCode.OK
isactive:boolean
该方法的主要作用：获取功能方块的开关状态

具体使用案例如下：

--判断(0,0)高度7的位置的方块(比如开关)是否被打开
local result,isactive=Block:getBlockSwitchStatus({x=0,y=7,z=0})
if isactive then--被打开
	Chat:sendSystemMsg("(0,0)高度7的位置的方块已被打开！")
else--没有被打开
	Chat:sendSystemMsg("(0,0)高度7的位置的方块没有被打开！")
end
Lua
setBlockSwitchStatus
参数及类型：

pos:table{x,y,z}
isactive:boolean
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置功能方块的开关状态

具体使用案例如下：

--打开(0,0)高度7位置的方块(比如开关)
--最后一个参数true为打开，false为关闭
Block:setBlockSwitchStatus({x=0,y=7,z=0},true)
--在聊天框显示
Chat:sendSystemMsg("打开了(0,0)高度7的位置的方块！")
Lua
getBlockDataByDir
参数及类型：

blockid:number
dir:number
返回值及类型：

ErrorCode.OK
data:number
该方法的主要作用：通过方向获取方块data值

具体使用案例如下：

--获取朝向北的落叶松木的data
--第一个参数201为方块id
--第二个参数3为朝向参数：0西 1东 2南 3北 4下 5上
local result,data=Block:getBlockDataByDir(201,3)
--在聊天框显示
Chat:sendSystemMsg("落叶松木在朝向北的时候的data为:"..data)
Lua
getBlockPowerStatus
参数及类型：

pos:table{x,y,z}
返回值及类型：

ErrorCode.OK
isactive:boolean
该方法的主要作用：获取方块的通电状态

具体使用案例如下：

--判断(0,0)高度7的位置的方块有没有通电
local result,isactive=Block:getBlockPowerStatus({x=0,y=7,z=0})
if isactive then--通电
	Chat:sendSystemMsg("(0,0)高度7的位置的方块已被通电！")
else--没有通电
	Chat:sendSystemMsg("(0,0)高度7的位置的方块没有通电！")
end
Lua
 

randomBlockID

参数及类型：
无
返回值及类型：
ErrorCode.OK
blockid:number 获取随机方块id
该方法的主要作用：获取随机方块id
具体使用案例如下：
local result,blockid = Block:randomBlockID()
Lua
 

GetBlockDefName

参数及类型：
blockid:number方块类型ID
返回值及类型：
ErrorCode.OK
name:number 方块名称
该方法的主要作用：获取方块名称
具体使用案例如下：
local result,name = Block:GetBlockDefName(blockid)
Lua
 

GetBlockDefDesc

参数及类型：
blockid:number方块类型ID
返回值及类型：
ErrorCode.OK
desc:number 方块描述
该方法的主要作用：获取方块描述
具体使用案例如下：
local result,desc = Block:GetBlockDefDesc(blockid)
Lua
 

GetBlockFacade

参数及类型：
blockid:number方块类型ID
返回值及类型：
ErrorCode.OK
faced:number 方块外观名
该方法的主要作用：获取方块外观
具体使用案例如下：
local result,faced = Block:GetBlockFacade(blockid)
Lua
 

PlayAct

参数及类型：
x,y,z:number位置坐标
animid:number动作ID
playmode:number播放模式(ANIMMODE)
返回值及类型：
ErrorCode.OK
faced:number 方块外观名
该方法的主要作用：微缩方块播放动作
具体使用案例如下：
local result = Block:PlayAct(0,8,0,12,ANIMMODE.ANIM_MODE_LOOP) --在坐标（0,8,0）的微缩方块循环播放跑的动画
Lua
 

ReplaceBluePrint

参数及类型：
x,y,z:number位置坐标
blueprint:string蓝图资源ID
angle:number旋转角度
mirror:boolean是否镜像
placeMode:boolean是否放置
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 放置蓝图
具体使用案例如下：
local code  = Block:ReplaceBluePrint(x, y, z, blueprint, angle, mirror, placeMode)
if code == ErrorCode.OK then
	print('执行成功'  )
else
	print('执行失败')
end
Lua


目录
wiki
登录

状态接口：Buff
 迷你世界
更新时间: 2023-04-26 20:07:54
具体函数名及描述如下:

序号	函数名	函数描述
1	addBuff(...)	给对象附加效果
2	removeBuff(...)	给对象移除指定效果
3	clearAllBuff(...)	给对象清除所有效果
4	clearAllBadBuff(...)	为对象清除所有负面效果
5	hasBuff(...)	判断对象身上是否有指定效果
6	getBuffList(...)	获取对象身上效果列表
7	getBuffNumByBuffid(...)	获取对象身上指定效果数量
8	getBuffIndex(...)
获取对象身上指定效果的索引位置(索引从1开始)
9	getBuffLeftTime(...)
获取对象身上指定效果剩余时间
10	getBuffName(...)
获取对象身上状态效果名称
11	GetBuffDefName(...)
获取状态效果名称
12	GetBuffDefDesc(...)
获取状态效果描述
 

addBuff

参数及类型：
objid:number对象ID
buffid:number效果ID
bufflv:number效果等级
customticks:number效果持续时间(-1表示默认配置，0表示无限)
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 给对象附加效果
具体使用案例如下：
local code  = Buff:addBuff(objid, buffid, bufflv, customticks)
if code == ErrorCode.OK then
	print('执行成功'  )
else
	print('执行失败')
end
Lua
 

removeBuff

参数及类型：
objid:number对象ID
buffid:number效果ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 给对象移除指定效果
具体使用案例如下：
local code  = Buff:removeBuff(objid, buffid)
if code == ErrorCode.OK then
	print('执行成功'  )
else
	print('执行失败')
end
Lua
 

clearAllBuff

参数及类型：
objid:number对象ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 给对象清除所有效果
具体使用案例如下：
local code  = Buff:clearAllBuff(objid)
if code == ErrorCode.OK then
	print('执行成功'  )
else
	print('执行失败')
end
Lua
 

clearAllBadBuff

参数及类型：
objid:number对象ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 为对象清除所有负面效果
具体使用案例如下：
local code  = Buff:clearAllBadBuff(objid)
if code == ErrorCode.OK then
	print('执行成功'  )
else
	print('执行失败')
end
Lua
 

hasBuff

参数及类型：
objid:number对象ID
buffid:number效果ID
bufflv:number效果等级
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 判断对象身上是否有指定效果
具体使用案例如下：
local code  = Buff:hasBuff(objid, buffid, bufflv)
if code == ErrorCode.OK then
	print('执行成功'  )
else
	print('执行失败')
end
Lua
 

getBuffList

参数及类型：
objid:number对象ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
num:number效果数量
arr:number效果ID数组
该方法的主要作用： 获取对象身上效果列表
具体使用案例如下：
local code ,num,arr = Buff:getBuffList(objid)
if code == ErrorCode.OK then
	print('执行成功' ,num,arr )
else
	print('执行失败')
end
Lua
 

getBuffNumByBuffid

参数及类型：
objid:number对象ID
buffid:number效果ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
num:number数量
该方法的主要作用： 获取对象身上指定效果数量
具体使用案例如下：
local code ,num = Buff:getBuffNumByBuffid(objid, buffid)
if code == ErrorCode.OK then
	print('执行成功' ,num )
else
	print('执行失败')
end
Lua
 

getBuffIndex

参数及类型：
objid:number对象ID
buffid:number效果ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
ix:number效果索引 从1开始
该方法的主要作用： 获取对象身上指定效果的索引位置(索引从1开始)
具体使用案例如下：
local code ,ix = Buff:getBuffIndex(objid, buffid)
if code == ErrorCode.OK then
	print('执行成功' ,ix )
else
	print('执行失败')
end
Lua
 

getBuffLeftTime

参数及类型：
objid:number对象ID
buffid:number效果ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
num:number剩余时间(秒)，0表示永久
该方法的主要作用： 获取对象身上指定效果剩余时间
具体使用案例如下：
local code ,num = Buff:getBuffLeftTime(objid, buffid)
if code == ErrorCode.OK then
	print('执行成功' ,num )
else
	print('执行失败')
end
Lua
 

getBuffName

参数及类型：
objid:number对象ID
buffid:number效果ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
name:string效果名称
该方法的主要作用： 获取对象身上状态效果名称
具体使用案例如下：
local code ,name = Buff:getBuffName(objid, buffid)
if code == ErrorCode.OK then
	print('执行成功' ,name )
else
	print('执行失败')
end
Lua
 

GetBuffDefName

参数及类型：
buffid:number效果ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
name:string效果名称
该方法的主要作用： 获取状态效果名称
具体使用案例如下：
local code ,name = Buff:GetBuffDefName(buffid)
if code == ErrorCode.OK then
	print('执行成功' ,name )
else
	print('执行失败')
end
Lua
 

GetBuffDefDesc

参数及类型：
buffid:number效果ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
desc:string效果名称
该方法的主要作用： 获取状态效果描述
具体使用案例如下：
local code ,desc = Buff:GetBuffDefDesc(buffid)
if code == ErrorCode.OK then
	print('执行成功' ,desc )
else
	print('执行失败')
end
Lua
 


目录
wiki
登录

世界UI接口：UI
 彼得兔
更新时间: 2023-10-25 10:40:44
具体函数名及描述如下:

序号	函数名	函数描述
1	setGBattleUI(...)	设置战斗总结UI
2	world2RadarPos(...)	世界坐标转换到小地图
3	world2RadarDist(...)	世界长度转换到小地图
4	setMinimapRenderMode(...)	设置小地图模式。1：45度旋转视角；2：全图俯视角
5	setShapeLine(...)	地图标记形状设置，设置成线条(LineShape)
6	setShapeCircle(...)	地图标记形状设置，设置成圆(CircleShape)
7	ShowScreenEffect(...)	显示屏幕特效
setGBattleUI
参数及类型：

name:string设定名
value:string or boolean设定值
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置战斗总结UI

具体使用案例如下：

--设置游戏结束界面(有些貌似没效果)
--设置左标题，只需要修改第二个参数
UI:setGBattleUI("left_title","这里是左标题")
--设置右标题，只需要修改第二个参数
UI:setGBattleUI("rigjt_title","这里是右标题")
--设置左描述，只需要修改第二个参数
UI:setGBattleUI("left_desc","这里是左描述")
--设置左简述，只需要修改第二个参数
UI:setGBattleUI("left_title_desc","这里是左简述")
--设置右简述，只需要修改第二个参数
UI:setGBattleUI("right_title_desc","这里是右简述")
--设置比分导航栏面板按钮是否显示，true显示 false不显示
UI:setGBattleUI("battle_btn",true)
--设置比赛结果是否显示，true显示 false不显示
UI:setGBattleUI("result",true)
--设置比赛结果底板是否显示，true显示 false不显示
UI:setGBattleUI("result_bkg",true)
--设置再来一局按钮是否显示，true显示 false不显示
UI:setGBattleUI("reopen",true)
--在聊天框显示提示
Chat:sendSystemMsg("做动画表情结束游戏即可查看效果")
--每当玩家做动画表情，就会游戏结束
--当玩家做动画表情时执行此函数
local function Player_PlayAction(event)
	--结束游戏
    Game:doGameEnd(nil)
end
--注册一个动画表情监听器，事件发生时执行上面的函数
ScriptSupportEvent:registerEvent([=[Player.PlayAction]=],Player_PlayAction)
Lua
world2RadarPos
参数及类型：

x:number
y:number
返回值及类型：

ErrorCode.OK
x:number
z:number
该方法的主要作用：世界坐标转换到小地图

具体使用案例如下：

--获取存档里(100,100)的位置在地图上的坐标
local result,x,z=UI:world2RadarPos(100,100)
--在聊天框显示
Chat:sendSystemMsg("坐标(100,100)在当前地图上的坐标为("..x..","..z..")")
Lua
world2RadarDist
参数及类型：

length:number
返回值及类型：

ErrorCode.OK
length:number
该方法的主要作用：世界长度转换到小地图

具体使用案例如下：

--获取存档里100格距离在地图上的长度
local result,length=UI:world2RadarDist(100)
--在聊天框显示
Chat:sendSystemMsg("存档里100格距离在地图上的长度为"..length)
Lua
setMinimapRenderMode
参数及类型：

mode:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置小地图模式。1：45度旋转视角；2：全图俯视角

具体使用案例如下：

--设置地图查看模式为45度旋转视角
--参数 0:默认 1:45度旋转视角 2:全图固定俯视角
UI:setMinimapRenderMode(1)
--在聊天框显示
Chat:sendSystemMsg("设置地图查看模式为45度旋转视角")
Lua
setShapeLine
参数及类型：

uiname:string
p1x:number
p1y:number
p2x:number
p2y:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：地图标记形状设置，设置成线条(LineShape)

具体使用案例如下：

local result = UI:setShapeLine(uiname, p1x, p1y, p2x, p2y)
Lua
setShapeCircle
参数及类型：

uiname:string
x:number
y:number
radius:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：地图标记形状设置，设置成圆(CircleShape)

具体使用案例如下：

local result = UI:setShapeCircle(uiname, x, y, radius)
Lua
ShowScreenEffect
参数及类型：

type:number效果类型
isloop:boolean是否循环
incspeed:number增速
bshow:bool是否显示
返回值及类型：

ErrorCode.OK
该方法的主要作用：显示屏幕特效

具体使用案例如下：

--显示雾效(貌似没效果)
--第一个参数为屏幕效果id：1 speedline 2 powerline 3 fog
--第二个参数为是否循环：true是 false否
--第三个参数为增速
UI:ShowScreenEffect(3,false,1)
--在聊天框显示
Chat:sendSystemMsg("显示雾效")
Lua

目录
wiki
登录

区域接口：Area
 彼得兔
更新时间: 2023-12-18 11:35:14
具体函数名及描述如下:

序号	函数名	函数描述
1	createAreaRect(...)	创建矩形区域
2	createAreaRectByRange(...)	创建矩形区域(通过范围)
3	destroyArea(...)	销毁区域
4	getAreaByPos(...)	通过位置查找区域
5	offsetArea(...)	区域偏移
6	expandArea(...)	扩大区域
7	getAreaCenter(...)	获取区域中间点
8	getAreaRectLength(...)	获取区域各边长
9	getAreaRectRange(...)	获取区域范围
10	getRandomPos(...)	随机区域内位置
11	objInArea(...)	检测obj是否在区域内
12	blockInArea(...)	检测区域内是否有某个方块
13	posInArea(...)	位置是否在区域内
14	getAreaPlayers(...)	获取区域中的所有玩家
15	getAreaCreatures(...)	获取区域中的所有生物
16	fillBlock(...)	用方块填充区域
17	clearAllBlock(...)	清空区域内全部方块
18	cloneArea(...)	复制区域内方块到另一个区域
19	getPosOffset(...)	传入两个坐标列表，得到相加后的位置
20	replaceAreaBlock(...)	替换方块类型为新的方块类型
21	blockInAreaRange(...)	区域范围内有方块
22	getAllObjsInAreaRange(...)	获取区域范围内全部对象
23	getAllObjsInAreaRangeByObjTypes(...)	获取区域范围内全部对象
24	getAllPlayersInAreaRange(...)	获取区域范围内全部玩家
25	getAllCreaturesInAreaRange(...)	获取区域范围内全部生物
26	fillBlockAreaRange(...)	用方块填充区域范围
27	clearAllBlockAreaRange(...)	清空区域范围内方块
28	cloneAreaRange(...)	复制区域范围内方块到另一个区域
29	replaceAreaRangeBlock(...)	替换区域范围方块
30	DestroyBlockAreaRange(...)
破坏区域范围方块
区域复制代码示例：
创建1个区域，用方块填充后，再复制到另一个地点
act = function()
	local ret, hostid = Player:getHostUin()
	local ret,num = Player:getCurShotcut(hostid)
	if num == 0 then
			--房主按下快捷栏1的时候，创建一个矩形区域,中心点是10.7.10，边长是5
		local pos1 = {x = 3, y = 10 ,z = 8}
		local dim = {x = 2, y = 2,z = 2}--  注意这里的边长算法是x*x+1=实际边长
		ret111, areaid = Area:createAreaRect(pos1, dim)
		Area:fillBlock(areaid, 112)  --用112这个方块填充区域

	end
	if num == 1 then
	-- 房主按下快捷栏2的时候，把上面这个矩形复制到10.12.10位置（以右下角为原点，而不是中心点）
		local pos2 = {x = 3 , y = 15 ,z = 8}
		local ret = Area:cloneArea(areaid, pos2)
	end

end
ScriptSupportEvent:registerEvent([=[Player.SelectShortcut]=], act)
Lua
createAreaRect
参数及类型：

pos:table中心位置
dim:table尺寸
返回值及类型：

ErrorCode.OK
areaid:number
该方法的主要作用：创建矩形区域

具体使用案例如下：

--通过中心点和扩展长度创建一个区域
--第一个参数{x=0,y=10,z=0}为区域中心坐标组成的表
--第二个参数{x=1,y=2,z=3}为区域各方向扩展的距离组成的表
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=1,y=2,z=3})
--在聊天框显示
Chat:sendSystemMsg("以(0,0)高度10为中心，左右各扩展1格，上下各扩展2格，前后各扩展3格，创建了一个区域，id为"..areaid)
Lua
createAreaRectByRange
参数及类型：

posBeg:table
posEnd:table
返回值及类型：

ErrorCode.OK
areaid:number
该方法的主要作用：创建矩形区域(通过范围)

具体使用案例如下：

--通过起点终点坐标创建区域
--第一个参数为区域起点坐标组成的表，即面朝北时，区域的左、下、后方的顶点坐标
--第二个参数为区域终点坐标组成的表，即面朝北时，区域的右、上、前方的顶点坐标
local result,areaid=Area:createAreaRectByRange({x=0,y=7,z=0},{x=5,y=10,z=5})
--在聊天框显示
Chat:sendSystemMsg("以(0,0)高度7为起点，(5,5)高度10为终点创建一个区域，id为"..areaid)
Lua
destroyArea
参数及类型：

areaid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：销毁区域

具体使用案例如下：

--销毁指定区域，参数为区域id
Area:destroyArea(1)
--在聊天框显示
Chat:sendSystemMsg("销毁了id为1的区域")
Lua
getAreaByPos
参数及类型：

pos:table中心位置
返回值及类型：

ErrorCode.OK
areaid:number
该方法的主要作用：通过位置查找区域

具体使用案例如下：

--判断某坐标所属的区域，参数为坐标组成的表
local result,areaid=Area:getAreaByPos({x=0,y=7,z=0})
if result==0 then--如果获取成功
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7所在的区域id为"..areaid)
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("获取失败，或(0,0)高度7不属于任何区域")
end
Lua
offsetArea
参数及类型：

areaid:number区域ID
x,y,z:number偏移距离
返回值及类型：

code:number成功(ErrorCode.OK)ErrorCode
areaid:number新的区域ID
该方法的主要作用：区域偏移

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--平移区域范围
--第一个参数为要平移的区域id
--后三个参数分别为向右、上、前的平移距离，可为负
Area:offsetArea(areaid,5,5,5)
--在聊天框显示
Chat:sendSystemMsg("id为"..areaid.."的区域被向右、上、前各移动了5格")
Lua
expandArea
参数及类型：

 
areaid:number区域ID
x,y,z:number偏移距离
返回值及类型：

code:number成功(ErrorCode.OK)ErrorCode
areaid:number新的区域ID
该方法的主要作用：扩大区域(产生新的区域)

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--扩充区域范围
--第一个参数为区域id
--后三个参数分别为区域向左右、上下、前后扩充的距离
Area:expandArea(areaid,2,2,2)
--在聊天框显示
Chat:sendSystemMsg("id为"..areaid.."的区域向左右、上下、前后各扩充了2格范围")
Lua
getAreaCenter
参数及类型：

areaid:number
返回值及类型：

ErrorCode.OK
pos:table中心位置
该方法的主要作用：获取区域中间点

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--获取指定区域的中心坐标，参数为要获取中心的区域id
local result,pos=Area:getAreaCenter(areaid)
--在聊天框显示
Chat:sendSystemMsg("id为"..areaid.."的区域的中心点坐标为：("..pos.x..","..pos.y..","..pos.z..")")
Lua
getAreaRectLength
参数及类型：

areaid:number
返回值及类型：

ErrorCode.OK
x
y
z:number
该方法的主要作用：获取区域各边长

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--获取指定区域各方向的边长，参数为区域id
local result,x,y,z=Area:getAreaRectLength(areaid)
--在聊天框显示
Chat:sendSystemMsg("id为"..areaid.."的区域各方向的边长为：左右"..x..",上下"..y..",前后"..z)
Lua
getAreaRectRange
参数及类型：

areaid:number
返回值及类型：

ErrorCode.OK
posBeg:table
posEnd:table
该方法的主要作用：获取区域范围

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--获取指定区域的起点和终点坐标，参数为区域id
local result,posBeg,posEnd=Area:getAreaRectRange(areaid)
--在聊天框显示
Chat:sendSystemMsg("id为"..areaid.."的区域的起点坐标为("..posBeg.x..","..posBeg.y..","..posBeg.z..")，终点坐标为("..posEnd.x..","..posEnd.y..","..posEnd.z..")")
Lua
getRandomPos
参数及类型：

areaid:number
返回值及类型：

ErrorCode.OK
pos:table
该方法的主要作用：随机区域内位置

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--从指定区域中随机获取一个坐标，参数为区域id
local result,pos=Area:getRandomPos(areaid)
--在聊天框显示
Chat:sendSystemMsg("从id为"..areaid.."的区域中随机获取了一个坐标("..pos.x..","..pos.y..","..pos.z..")")
Lua
objInArea
参数及类型：

areaid:number
objid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：检测obj是否在区域内

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--判断某对象是否在指定区域中
--第一个参数为区域id
--第二个参数为对象id，可以是玩家迷你号、生物id或掉落物id等等
local result=Area:objInArea(areaid,1000)
if result==0 then--如果在区域内
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000在区域"..areaid.."内部")
else--如果不在内部或获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在区域"..areaid.."内部，或玩家1000不在当前存档")
end
Lua
blockInArea
参数及类型：

areaid:number
blockid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：检测区域内是否有某个方块

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--判断指定区域是否包含某种方块
--第一个参数为区域id
--第二个参数为方块id
local result=Area:blockInArea(areaid,101)
if result==0 then--如果包含
	--在聊天框显示
	Chat:sendSystemMsg("id为"..areaid.."的区域内有土块")
else--如果不包含
	--在聊天框显示
	Chat:sendSystemMsg("id为"..areaid.."的区域内没有土块")
end
Lua
posInArea
参数及类型：

pos:table
areaid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：位置是否再区域内

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--判断某坐标是否在指定区域内
--第一个参数为要判断的坐标组成的表
--第二个参数为区域id
local result=Area:posInArea({x=0,y=7,z=0},areaid)
if result==0 then--如果在内部
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置在id为"..areaid.."的区域内")
else--如果不在内部
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置不在id为"..areaid.."的区域内")
end
Lua
getAreaPlayers
参数及类型：

areaid:number
返回值及类型：

ErrorCode.OK
playerlist:table
该方法的主要作用：获取区域中的所有玩家

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--获取区域内的玩家列表，参数为区域id
local result,playerlist=Area:getAreaPlayers(areaid)
if #playerlist>0 then--如果区域内存在玩家
	for i,a in ipairs(playerlist) do
		--在聊天框显示列表
		Chat:sendSystemMsg("区域"..areaid.."内第"..i.."个玩家："..a)
	end
else--如果区域内不存在玩家
	--在聊天框显示
	Chat:sendSystemMsg("区域"..areaid.."内没有玩家")
end
Lua
getAreaCreatures
参数及类型：

areaid:number
返回值及类型：

ErrorCode.OK
creaturelist:table
该方法的主要作用：获取区域中的所有生物

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--获取区域内的生物列表，参数为区域id
local result,creaturelist=Area:getAreaCreatures(areaid)
if #creaturelist>0 then--如果区域内存在生物
	for i,a in ipairs(creaturelist) do
		--在聊天框显示列表
		Chat:sendSystemMsg("区域"..areaid.."内第"..i.."个生物："..a)
	end
else--如果区域内不存在生物
	--在聊天框显示
	Chat:sendSystemMsg("区域"..areaid.."内没有生物")
end
Lua
fillBlock
参数及类型：

areaid:number
blockid:number
face:number朝向
返回值及类型：

ErrorCode.OK
该方法的主要作用：用方块填充区域

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=3,y=3,z=3})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展3格的区域，区域id为"..areaid)
--用方块填充指定区域
--第一个参数为区域id
--第二个参数为要填充的方块id，1为基岩
--第三个参数为方块朝向：0西 1东 2南 3北 4下 5上
Area:fillBlock(areaid,1,0)
--在聊天框显示
Chat:sendSystemMsg("区域"..areaid.."被填充了基岩")
Lua
clearAllBlock
参数及类型：

areaid:number
blockid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：清空区域内全部方块

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--清空指定区域内的指定方块
--第一个参数为区域id
--第二个参数为要清除的方块id
Area:clearAllBlock(areaid,101)
--在聊天框显示
Chat:sendSystemMsg("清空了区域"..areaid.."内的所有土块")
Lua
cloneArea
参数及类型：

areaid:number
deststartpos:table
返回值及类型：

ErrorCode.OK
该方法的主要作用：复制区域内方块到另一个区域

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--复制区域内的方块到另一位置
--第一个参数为要复制的区域id
--第二个参数为要复制到的起点坐标组成的表
Area:cloneArea(areaid,{x=0,y=10,z=0})
--在聊天框显示
Chat:sendSystemMsg("把区域"..areaid.."内的所有方块复制到了(0,0)高度10的位置，此坐标与区域起点对应")
Lua
getPosOffset
参数及类型：

srcpos:table{x=0,y=0,z=0}
dim:table{x=2,y=2,z=2}
返回值及类型：

ErrorCode.OK
pos:table{x=2,y=2,z=2}
该方法的主要作用：传入两个坐标列表，得到相加后的位置

具体使用案例如下：

local function ClickBlock(event)
	local srcpos={x=event.x,y=event.y,z=event.z}--起点坐标，这里是被点击的坐标
	local dim={x=10,y=10,z=10}--偏移距离
	--计算偏移后的坐标
	local result,pos=Area:getPosOffset(srcpos, dim)
	print(pos)--在日志输出
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
replaceAreaBlock
参数及类型：

areaid:number
srcblockid:number
destblockid:number
face:number朝向
返回值及类型：

ErrorCode.OK
该方法的主要作用：替换方块类型为新的方块类型

具体使用案例如下：

--创建一个区域
local result,areaid=Area:createAreaRect({x=0,y=10,z=0},{x=30,y=30,z=30})
--在聊天框显示
Chat:sendSystemMsg("创建了以(0,0)高度10为中心，向左右上下前后各扩展30格的区域，区域id为"..areaid)
--把指定区域内的一种方块替换成新的方块
--第一个参数为区域id
--第二个参数为要替换掉的方块id，101是土块
--第三个参数为要替换为的方块id，1是地心基石
--最后一个参数为方块朝向：0西 1东 2南 3北 4下 5上
Area:replaceAreaBlock(areaid,101,1,0)
--在聊天框显示
Chat:sendSystemMsg("区域"..areaid.."内所有土块被替换为了基岩")
Lua
blockInAreaRange
参数及类型：

blockid:number
posbeg:table起点{x=number, y=number, z=number}
posend:table终点{x=number, y=number, z=number}
返回值及类型：

ErrorCode.OK
该方法的主要作用：区域范围内有方块

具体使用案例如下：

--判断两点之前的范围内有没有某种方块
--第一个参数为方块id，101是土块
--后两个参数分别是范围起点和终点坐标组成的表
local result=Area:blockInAreaRange(101,{x=0,y=5,z=0},{x=1,y=8,z=1})
if result==0 then--如果包含
	--在聊天框显示
	Chat:sendSystemMsg("在(0,0)高度5到(1,1)高度8的范围内有土块")
else--如果不包含
	--在聊天框显示
	Chat:sendSystemMsg("在(0,0)高度5到(1,1)高度8的范围内没有土块")
end
Lua
getAllObjsInAreaRange
参数及类型：

posbegin:table起点{x=number, y=number, z=number}
posend:table终点{x=number, y=number, z=number}
objtype:numberOBJ_TYPE
返回值及类型：

ErrorCode.OK
objids:table
该方法的主要作用：获取区域范围内全部对象

具体使用案例如下：

local function ClickBlock(event)
	local x,y,z=event.x,event.y,event.z--点击坐标
	local posbegin={x=x-10,y=y-10,z=z-10}--起点
	local posend={x=x+10,y=y+10,z=z+10}--终点
	local objtype=1--对象类型，1是玩家
	--获取范围内所有玩家
	local result,objids=Area:getAllObjsInAreaRange(posbegin, posend, objtype)
	Chat:sendSystemMsg("区域内共有".. #objids .."个玩家")--在聊天框显示玩家数量
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
getAllObjsInAreaRangeByObjTypes
参数及类型：

posbegin:table起点{x=number, y=number, z=number}
posend:table终点{x=number, y=number, z=number}
objtypes:tableOBJ_TYPE
返回值及类型：

ErrorCode.OK
objids:table
该方法的主要作用：获取区域范围内全部对象

具体使用案例如下：

local function ClickBlock(event)
	local x,y,z=event.x,event.y,event.z--点击坐标
	local posbegin={x=x-10,y=y-10,z=z-10}--起点
	local posend={x=x+10,y=y+10,z=z+10}--终点
	local objtypes={1,2}--对象类型，1是玩家，2是生物
	--获取范围内所有玩家和生物
	local result,objids=Area:getAllObjsInAreaRangeByObjTypes(posbegin, posend, objtypes)
	Chat:sendSystemMsg("区域内共有".. #objids .."个玩家和生物")--在聊天框显示
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
getAllPlayersInAreaRange
参数及类型：

posbegin:table起点{x=number, y=number, z=number}
posend:table终点{x=number, y=number, z=number}
返回值及类型：

ErrorCode.OK
objids:table
该方法的主要作用：获取区域范围内全部玩家

具体使用案例如下：

local function ClickBlock(event)
	local x,y,z=event.x,event.y,event.z--点击坐标
	local posbegin={x=x-10,y=y-10,z=z-10}--起点
	local posend={x=x+10,y=y+10,z=z+10}--终点
	--获取范围内所有玩家
	local result,objids=Area:getAllPlayersInAreaRange(posbegin, posend)
	Chat:sendSystemMsg("区域内共有".. #objids .."个玩家")--在聊天框显示
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
getAllCreaturesInAreaRange
参数及类型：

posbegin:table起点{x=number, y=number, z=number}
posend:table终点{x=number, y=number, z=number}
返回值及类型：

ErrorCode.OK
objids:table
该方法的主要作用：获取区域范围内全部生物

具体使用案例如下：

local function ClickBlock(event)
	local x,y,z=event.x,event.y,event.z--点击坐标
	local posbegin={x=x-10,y=y-10,z=z-10}--起点
	local posend={x=x+10,y=y+10,z=z+10}--终点
	--获取范围内所有生物
	local result,objids=Area:getAllCreaturesInAreaRange(posbegin, posend)
	Chat:sendSystemMsg("区域内共有".. #objids .."个生物")--在聊天框显示
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
fillBlockAreaRange
参数及类型：

posbeg:table起点{x=number, y=number, z=number}
posend:table终点{x=number, y=number, z=number}
blockid:number方块ID
face:number朝向
返回值及类型：

ErrorCode.OK
该方法的主要作用：用方块填充区域范围

具体使用案例如下：

--在两点之间的范围内填充某方块
--前两个参数为填充范围的起点和终点坐标组成的表
--第三个参数1为要填充的方块id，1是地心基石
--第四个参数0为方块朝向：0西 1东 2南 3北 4下 5上
Area:fillBlockAreaRange({x=0,y=7,z=0},{x=5,y=9,z=5},1,0)
--在聊天框显示
Chat:sendSystemMsg("从(0,0)高度7到(5,5)高度9的范围被填充了基岩")
Lua
clearAllBlockAreaRange
参数及类型：

posbeg:table起点{x=number, y=number, z=number}
posend:table终点{x=number, y=number, z=number}
blockid:number方块ID
返回值及类型：

ErrorCode.OK
该方法的主要作用：清空区域范围内方块

具体使用案例如下：

--清空两点之间范围内的某方块
--前两个参数为范围的起点和终点坐标组成的表
--第三个参数为要清除的方块id，101是土块
Area:clearAllBlockAreaRange({x=0,y=7,z=0},{x=5,y=9,z=5},101)
--在聊天框显示
Chat:sendSystemMsg("清空了(0,0)高度7到(5,5)高度9范围内的土块")
Lua
cloneAreaRange
参数及类型：

posbeg:table起点{x=number, y=number, z=number}
posend:table终点{x=number, y=number, z=number}
deststartpos:table目标起始位置 {x=number, y=number, z=number}
返回值及类型：

ErrorCode.OK
该方法的主要作用：复制区域范围内方块到另一个区域

具体使用案例如下：

--复制两点之间范围内的方块到另一位置
--前两个参数为范围的起点和终点坐标组成的表
--后一个参数为要复制到的范围起点坐标
Area:cloneAreaRange({x=0,y=3,z=0},{x=5,y=7,z=5},{x=0,y=10,z=0})
--在聊天框显示
Chat:sendSystemMsg("把(0,0)高度3到(5,5)高度7范围内的方块复制到了(0,0)高度10（以此为起点）")
Lua
replaceAreaRangeBlock
参数及类型：

posbeg:table起点{x=number, y=number, z=number}
posend:table终点{x=number, y=number, z=number}
srcblockid:number替换原始方块
destblockid:number替换目标方块
face:number朝向
返回值及类型：

ErrorCode.OK
该方法的主要作用：替换区域范围方块

具体使用案例如下：

--替换两点之间范围内的某种方块为另一种方块
--前两个参数为范围的起点和终点坐标组成的表
--第三个参数101为要替换掉的方块id，101是土块
--第四个参数为要替换为的方块id，1是地心基石
--最后一个参数为方块朝向：0西 1东 2南 3北 4下 5上
Area:replaceAreaRangeBlock({x=0,y=3,z=0},{x=5,y=7,z=5},101,1,0)
--在聊天框显示
Chat:sendSystemMsg("从(0,0)高度3到(5,5)高度7的范围内，所有的土块被替换为了基岩")
Lua
 

DestroyBlockAreaRange

参数及类型：
posbeg:table起点{x=number, y=number, z=number}
posend:table终点{x=number, y=number, z=number}
blockid:number破坏的方块ID
返回值及类型：
ErrorCode.OK
该方法的主要作用：破坏区域范围方块
具体使用案例如下：
Area:DestroyBlockAreaRange({x=0,y=6,z=0},{x=5,y=7,z=5},100)
Lua
 


目录
wiki
登录

聊天接口：Chat
 彼得兔
更新时间: 2023-04-26 10:18:43
具体函数名及描述如下:

序号	函数名	函数描述
1	sendChat(...)	发送聊天消息(默认全部玩家)
2	sendSystemMsg(...)	发送系统消息(默认全部玩家)
sendChat
参数及类型：

content:string
targetuin:number发给uin为targetuin的玩家，0表示发给所有玩家
返回值及类型：

ErrorCode.OK
该方法的主要作用：发送聊天消息(默认全部玩家)

具体使用案例如下：

--发送一条聊天消息
--第一个参数是消息内容，第二个参数是接收消息的玩家的uin，0表示全部玩家(貌似没有效果)
Chat:sendChat("这是一条聊天消息！",0)
Chat:sendChat("也可以只输入消息内容，默认发给全部玩家")
Lua
sendSystemMsg
参数及类型：

content:string
targetuin:number发给uin为targetuin的玩家，0表示发给所有玩家
返回值及类型：

ErrorCode.OK
该方法的主要作用：发送系统消息(默认全部玩家)

具体使用案例如下：

--发送一条系统消息
--第一个参数是消息内容，第二个参数是接收消息的玩家的uin，0表示全部玩家(貌似没有效果)
Chat:sendSystemMsg("这是一条系统消息！",0)
Chat:sendSystemMsg("也可以只输入消息内容，默认发给全部玩家")
Lua

目录
wiki
登录

组队接口：Team
 彼得兔
更新时间: 2023-04-26 10:19:04
具体函数名及描述如下:

序号	函数名	函数描述
1	getNumTeam(...)	当前队伍数量
2	getTeamPlayerNum(...)	获取指定队伍玩家数量
3	getTeamPlayers(...)	获取指定队伍玩家
4	randomTeamPlayer(...)	随机一名玩家
5	getTeamCreatures(...)	获取指定队伍生物 (类似 getTeamPlayers)
6	setTeamScore(...)	队伍分数
7	getTeamScore(...)	获取组队分数
8	addTeamScore(...)	增加队伍分数
9	setTeamResults(...)	队伍胜负结果
10	getTeamResults(...)	获取当前队伍胜负
11	setTeamDieTimes(...)	队伍阵亡次数
12	getTeamDieTimes(...)	获取队伍总死亡数
13	addTeamDieTimes(...)	增加队伍总死亡数
14	changePlayerTeam(...)	改变玩家队伍
getNumTeam
参数及类型：nil

返回值及类型：

ErrorCode.OK
num:number
该方法的主要作用：当前队伍数量

具体使用案例如下：

--获取队伍数量
local result,num=Team:getNumTeam()
--在聊天框显示
Chat:sendSystemMsg("当前队伍数量为："..num)
Lua
getTeamPlayerNum
参数及类型：

teamid:number队伍ID，默认全部
alive:number是否存活，默认全部
返回值及类型：

ErrorCode.OK
num:number队伍玩家数量
该方法的主要作用：获取指定队伍玩家数量

具体使用案例如下：

--获取第一个队伍的玩家数量
--第一个参数为队伍id
--第二个参数：0为当前队伍的死亡玩家数量 1为存活 2为全部
local result,num=Team:getTeamPlayerNum(1,2)
--在聊天框显示
Chat:sendSystemMsg("第一个队伍的玩家总数为："..num)
Lua
getTeamPlayers
参数及类型：

teamid:number队伍ID，默认全部
alive:number是否存活，默认全部
返回值及类型：

ErrorCode.OK
num:number队伍玩家数量
array:table成员uin数组
该方法的主要作用：获取指定队伍玩家

具体使用案例如下：

--获取第一个队伍的玩家数量和列表
--第一个参数为队伍id
--第二个参数：0为当前队伍的死亡玩家数量 1为存活 2为全部
local result,num,array=Team:getTeamPlayers(1,2)
--在聊天框显示数量
Chat:sendSystemMsg("第一个队伍的玩家总数为："..num)
for i,a in ipairs(array) do
	--在聊天框显示列表
	Chat:sendSystemMsg("第"..i.."个："..a)
end
Lua
randomTeamPlayer
参数及类型：

teamid:number队伍ID，默认全部
alive:number是否存活，默认全部
返回值及类型：

ErrorCode.OK
uin:number随机出玩家的uin
该方法的主要作用：随机一名玩家

具体使用案例如下：

--从队伍中随机选取一名玩家
--第一个参数为队伍id
--第二个参数：0为当前队伍的死亡玩家数量 1为存活 2为全部
local result,uin=Team:randomTeamPlayer(1,2)
--在聊天框显示
Chat:sendSystemMsg("从第一个队伍中随机选取了一名玩家："..uin)
Lua
getTeamCreatures
参数及类型：

teamid:number队伍ID
返回值及类型：

ErrorCode.OK
array:tableobjid数组
该方法的主要作用：获取指定队伍生物 (类似 getTeamPlayers)

具体使用案例如下：

--获取属于第一个队伍的生物列表，参数为队伍id
local result,array=Team:getTeamCreatures(1)
if #array==0 then--如果没有生物
	--在聊天框显示
	Chat:sendSystemMsg("没有动物或怪物属于第一个队伍")
else--如果有生物
	for i,a in ipairs(array) do
		--在聊天框显示生物列表
		Chat:sendSystemMsg("属于第一个队伍的生物id，"..i.."："..a)
	end
end
Lua
setTeamScore
参数及类型：

teamid:number
score:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：队伍分数

具体使用案例如下：

--设置指定队伍的分数
--第一个参数为队伍id
--第二个参数为要设置的分数
Team:setTeamScore(1,10)
--在聊天框显示
Chat:sendSystemMsg("第一个队伍的分数被设置为了10")
Lua
getTeamScore
参数及类型：

teamid:number
返回值及类型：

ErrorCode.OK
score:number
该方法的主要作用：获取组队分数

具体使用案例如下：

--获取队伍的分数，参数为队伍id
local result,score=Team:getTeamScore(1)
--在聊天框显示
Chat:sendSystemMsg("第一个队伍的游戏分数为"..score)
Lua
addTeamScore
参数及类型：

teamid:number
score:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：增加队伍分数

具体使用案例如下：

--给指定队伍增加分数
--第一个参数为队伍id
--第二个参数为要增加的游戏分数
Team:addTeamScore(1,10)
--在聊天框显示
Chat:sendSystemMsg("第一个队伍的分数被增加了10")
Lua
setTeamResults
参数及类型：

teamid:number
result:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：队伍胜负结果

具体使用案例如下：

--每当玩家做动画表情，让指定队伍获胜或失败
--当玩家做动画表情时执行此函数
local function Player_PlayAction(event)
	--让队伍1获胜
	--第一个参数为队伍id
	--第二个参数为：1获胜 2失败
	Team:setTeamResults(1,1)
	--在聊天框显示
	Chat:sendSystemMsg("队伍1获胜")
end
--注册一个动画表情监听器，事件发生时执行上面的函数
ScriptSupportEvent:registerEvent([=[Player.PlayAction]=],Player_PlayAction)
Lua
getTeamResults
参数及类型：

teamid:number
返回值及类型：

ErrorCode.OK
teamresult:number
该方法的主要作用：获取当前队伍胜负

具体使用案例如下：

--获取队伍是否获胜，参数为队伍id
local result,teamresult=Team:getTeamResults(1)
--在聊天框显示
Chat:sendSystemMsg("队伍1当前获胜状态为(1:获胜 2:失败)："..teamresult)
Lua
setTeamDieTimes
参数及类型：

teamid:number
times:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：队伍阵亡次数

具体使用案例如下：

--设置队伍玩家的阵亡次数，第一个参数为队伍id，第二个参数为阵亡次数
Team:setTeamDieTimes(1,10)
--在聊天框显示
Chat:sendSystemMsg("队伍1的玩家阵亡次数被设置为了10")
Lua
getTeamDieTimes
参数及类型：

teamid:number
返回值及类型：

ErrorCode.OK
times:number
该方法的主要作用：获取队伍总死亡数

具体使用案例如下：

--获取队伍1的总阵亡次数，参数为队伍id
local result,times=Team:getTeamDieTimes(1)
--在聊天框显示
Chat:sendSystemMsg("队伍1的总阵亡次数为："..times)
Lua
addTeamDieTimes
参数及类型：

teamid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：增加队伍总死亡数

具体使用案例如下：

--增加队伍的阵亡次数，参数为队伍id
Team:addTeamDieTimes(1)
--在聊天框显示
Chat:sendSystemMsg("队伍1的死亡次数被增加了1（即队伍1的总生命数减少了1）")
Lua
changePlayerTeam
参数及类型：

playerid:number
teamid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：改变玩家队伍

具体使用案例如下：

--把指定玩家设置到指定队伍
--第一个参数为玩家id或玩家迷你号，0是房主
--第二个参数为要移动到的队伍id
Team:changePlayerTeam(0,2)
--在聊天框显示
Chat:sendSystemMsg("房主被设置到了队伍2")
Lua

目录
wiki
登录

道具接口：Item
 彼得兔
更新时间: 2023-04-26 10:26:18
继承自 Actor

具体函数名及描述如下:

序号	函数名	函数描述
1	getItemName(...)	获取道具名称
2	getItemId(...)	获取actor对应的道具ID，如球类等
3	getDropItemNum(...)	获取掉落物数量
4	randomItemID(...)
获取随机道具id
5	randomProjectileID(...)
获取随机投掷物id
6	getItemDesc(...)
获取道具类型描述
7	GetAttr(...)
获取道具属性
8	playAct(...)
微缩模型的掉落物播放动画
 
getItemName
参数及类型：

itemid:number
返回值及类型：

ErrorCode.OK
name:string
该方法的主要作用：获取道具名称

具体使用案例如下：

--获取id为1的物品的名称，参数1就是需要获取名称的物品id
local result,name=Item:getItemName(1)
--在聊天框显示
Chat:sendSystemMsg("id为1的物品的名字是："..name)
Lua
getItemId
参数及类型：

objid:number
返回值及类型：

ErrorCode.OK
itemid:number
该方法的主要作用：获取actor对应的道具ID，如球类等

具体使用案例如下：

--每当有玩家做动画表情，聊天框显示房主周围10格内其中一个掉落物的id
--当玩家做动画表情时执行此函数
local function Player_PlayAction(event)
	--获取房主的坐标
	local result,x,y,z=Player:getPosition(0)
	--获取房主周围10格内的掉落物数量和列表
	local result2,num,objids=World:getActorsByBox(3,x-10,y-10,z-10,x+10,y+10,z+10)
	if num>0 then--如果存在掉落物
		--获取掉落物列表中的第一个物品的id
		local result3,itemid=Item:getItemId(objids[1])
		--在聊天框显示
		Chat:sendSystemMsg("附近10格发现掉落物品！其中一个物品id为"..itemid)
	else--如果不存在掉落物
		--在聊天框显示
		Chat:sendSystemMsg("附近10格没有发现掉落物品！")
	end
end
--注册动画表情监听器，当玩家做动画表情时执行上面的函数
ScriptSupportEvent:registerEvent([=[Player.PlayAction]=],Player_PlayAction)
Lua
getDropItemNum
参数及类型：

objid:number
返回值及类型：

ErrorCode.OK
itemnum:number
该方法的主要作用：获取掉落物数量

具体使用案例如下：

--每当有玩家做动画表情，聊天框显示房主周围10格内其中一个掉落物的堆叠数量
--当玩家做动画表情时执行此函数
local function Player_PlayAction(event)
	--获取房主的坐标
	local result,x,y,z=Player:getPosition(0)
	--获取房主周围10格内的掉落物数量和列表
	local result2,num,objids=World:getActorsByBox(3,x-10,y-10,z-10,x+10,y+10,z+10)
	if num>0 then--如果存在掉落物
		--获取掉落物列表中的第一个物品的堆叠数量
		local result3,itemnum=Item:getDropItemNum(objids[1])
		--在聊天框显示
		Chat:sendSystemMsg("附近10格发现掉落物品！其中一种物品有"..itemnum.."个堆叠在了一起")
	else--如果不存在掉落物
		--在聊天框显示
		Chat:sendSystemMsg("附近10格没有发现掉落物品！")
	end
end
--注册动画表情监听器，当玩家做动画表情时执行上面的函数
ScriptSupportEvent:registerEvent([=[Player.PlayAction]=],Player_PlayAction)
Lua
 

randomItemID

参数及类型：
无
返回值及类型：
ErrorCode.OK
itemid:number 随机道具id
该方法的主要作用：获取随机道具id
具体使用案例如下：
local result,blockid = Item:randomItemID()
Lua
 

randomProjectileID

参数及类型：
无
返回值及类型：
ErrorCode.OK
itemid:number 随机投掷物id
该方法的主要作用：获取随机投掷物id
具体使用案例如下：
local result,itemid = Item:randomProjectileID()
Lua
 

getItemDesc

参数及类型：
itemid:number道具类型ID
返回值及类型：
ErrorCode.OK
desc:number 道具类型描述
该方法的主要作用：获取道具类型描述
具体使用案例如下：
local result,desc = Item:getItemDesc(itemid)
Lua
 

GetAttr

参数及类型：
itemid:number道具类型ID
attr:number道具属性枚举(ITEMATTR)
返回值及类型：
ErrorCode.OK
value:number 属性值
该方法的主要作用：获取道具属性
具体使用案例如下：
local result,value = GetAttr(itemid,ITEMATTR.ATTACK)
Lua
 

playAct

参数及类型：
objid:number掉落物objid
animid:number动作ID
playmode:number播放模式(ANIMMODE)
返回值及类型：
ErrorCode.OK
该方法的主要作用：掉落物播放动画
具体使用案例如下：
local result = Item:playAct(objid,12,ITEMATTR.ATTACK) --指定掉落物循环播放跑动画
Lua
 


目录
wiki
登录

背包接口：Backpack
 彼得兔
更新时间: 2023-10-25 10:29:21
具体函数名及描述如下:

序号	函数名	函数描述
1	getBackpackBarIDRange(...)	获取道具背包栏ID范围(起始ID~结束ID)
2	getBackpackBarSize(...)	获取道具背包栏大小
3	setGridItem(...)	设置背包格道具
4	removeGridItem(...)	移除背包格内一定数量道具，通过道具格移除，默认全部移除
5	removeGridItemByItemID(...)	移除背包内一定数量道具，通过道具ID移除，默认全部移除
6	clearPack(...)	清空指定背包栏
7	clearAllPack(...)	清空全部背包(包含背包栏、快捷栏、装备栏)
8	moveGridItem(...)	移动背包道具，默认全部转移
9	swapGridItem(...)	交换背包道具
10	enoughSpaceForItem(...)	背包(包含背包栏、快捷栏)是否有足够的空间存放一定数量的道具
11	calcSpaceNumForItem(...)	计算背包(包含背包栏、快捷栏)能存放的道具剩余总数量
12	getBackpackBarValidList(...)	获取道具背包栏有效格ID列表(道具已存在)，背包格ID数组
13	getBackpackBarItemList(...)	获取道具背包栏已拥有道具，道具ID数组
14	hasItemByBackpackBar(...)	检测背包是否持有某个道具
15	getItemNumByBackpackBar(...)	获取背包持有某个道具总数量，同时返回装有道具的背包格数组
16	getGridItemID(...)	获取背包格道具ID(返回itemid, num)
17	getGridItemName(...)	获取背包格道具名称
18	getGridStack(...)	获取背包格道具堆叠数(返回curstack, maxstack)
19	getGridDurability(...)	获取背包格道具耐久度(返回durcur, durmax)
20	getGridEnchantList(...)	获取背包格道具附魔，返回附魔id数组
21	getGridToolType(...)	获取背包道具工具类型(<0表示非工具)
22	addItem(...)	添加道具到背包
23	discardItem(...)	丢弃背包某个格子里的道具
24	getGridNum(...)	获取背包某个格子的道具数量
25	actEquipUpByResID(...)	玩家穿上装备
26	actEquipOffByEquipID(...)	玩家脱下装备栏装备
27	actCreateEquip(...)	创建装备
28	actDestructEquip(...)	销毁装备
29	PlayShortCutIxEffect(...)
设置手持栏道具上播放特效
30	StopShortCutIxEffect(...)
停止手持栏道具上播放特效
31	PlayShortCutItemEffect(...)
设置快捷栏指定道具上播放特效
32	StopShortCutItemEffect(...)
停止快捷栏指定道具上播放特效
 
getBackpackBarIDRange
参数及类型：

bartype:number背包类型，快捷栏、存储栏、装备栏
返回值及类型：

ErrorCode.OK
begid:number道具格起始ID
endid:number道具格末尾ID
该方法的主要作用：获取道具背包栏ID范围(起始ID~结束ID)

具体使用案例如下：

--获取快捷栏的物品格id，参数为背包栏类型：1快捷栏 2储存栏 3装备栏
local result,begid,endid=Backpack:getBackpackBarIDRange(1)
--在聊天框显示
Chat:sendSystemMsg("快捷栏的物品格id为："..begid.."至"..endid)
--获取储存栏的物品格id
result,begid,endid=Backpack:getBackpackBarIDRange(2)
--在聊天框显示
Chat:sendSystemMsg("储存栏的物品格id为："..begid.."至"..endid)
--装备栏的物品格id
result,begid,endid=Backpack:getBackpackBarIDRange(3)
--在聊天框显示
Chat:sendSystemMsg("装备栏的物品格id为："..begid.."至"..endid)
Lua
getBackpackBarSize
参数及类型：

bartype:numberBPACK_SINDEX
返回值及类型：

ErrorCode.OK
size:number
该方法的主要作用：获取道具背包栏大小

具体使用案例如下：

--获取背包栏总格数，参数为背包类型：1快捷栏 2储存栏 3装备栏
local result,size=Backpack:getBackpackBarSize(1)
--在聊天框显示
Chat:sendSystemMsg("快捷栏一共有"..size.."格")
Lua
setGridItem
参数及类型：

playerid:number
gridid:number道具格ID
itemid:number
num:number默认1
durability:number耐久度，默认满耐久
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置背包格道具

具体使用案例如下：

--给指定玩家的指定背包栏添加物品
--第一个参数1000为玩家迷你号
--第二个参数0为背包栏id，0为储存栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
--第三个参数为要添加的物品id，12005是钻石剑
--第四个参数为要添加的物品数量
--最后一个参数为要添加的物品耐久，nil为默认满
Backpack:setGridItem(1000,0,12005,10,nil)
--在聊天框显示
Chat:sendSystemMsg("给迷你号为1000的玩家储存栏的第一格添加了10把钻石剑，耐久为满")
Lua
removeGridItem
参数及类型：

playerid:number
gridid:number
num:number默认全部道具
返回值及类型：

ErrorCode.OK
该方法的主要作用：移除背包格内一定数量道具，通过道具格移除，默认全部移除

具体使用案例如下：

--移除指定玩家的指定背包栏的物品
--第一个参数为玩家迷你号
--第二个参数0为背包栏id，0为储存栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
--第三个参数为移除数量
Backpack:removeGridItem(1000,0,10)
--在聊天框显示
Chat:sendSystemMsg("移除了玩家1000的背包栏第一格10个物品")
Lua
removeGridItemByItemID
参数及类型：

playerid:number
itemid:number
num:number默认全部道具
返回值及类型：

ErrorCode.OK
num:number成功移除数量
该方法的主要作用：移除背包内一定数量道具，通过道具ID移除，默认全部移除

具体使用案例如下：

--移除指定玩家背包里的指定物品
--第一个参数为玩家迷你号
--第二个参数为要移除的物品id，101为土块
--第三个参数为要移除的物品数量
local result,num=Backpack:removeGridItemByItemID(1000,101,50)
--在聊天框显示
Chat:sendSystemMsg("尝试移除玩家1000背包里的50个土块，实际移除了"..num.."个")
Lua
clearPack
参数及类型：

playerid:number
bartype:number背包类型
返回值及类型：

ErrorCode.OK
该方法的主要作用：清空指定背包栏

具体使用案例如下：

--清空指定玩家的背包物品
--第一个参数为玩家迷你号
--第二个参数为背包类型：1快捷栏 2储存栏 3装备栏
Backpack:clearPack(1000,1)
--在聊天框显示
Chat:sendSystemMsg("清空了玩家1000的快捷栏物品")
Lua
clearAllPack
参数及类型：

playerid:number
返回值及类型：

该方法的主要作用：清空全部背包(包含背包栏、快捷栏、装备栏)

具体使用案例如下：

--清空指定玩家的所有物品，包括快捷栏、储存栏和装备栏，参数为玩家迷你号
Backpack:clearAllPack(1000)
--在聊天框显示
Chat:sendSystemMsg("清空了玩家1000的所有物品，包括快捷栏、储存栏和装备栏")
Lua
moveGridItem
参数及类型：

playerid:number
gridsrc:number
griddst:number
num:number默认全部转移
返回值及类型：

ErrorCode.OK
该方法的主要作用：移动背包道具，默认全部转移

具体使用案例如下：

--移动玩家背包物品到指定物品栏
--第一个参数为玩家迷你号
--第二个参数0为要移动的背包栏id，0为储存栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
--第三个参数1000为移动至的背包栏id，0为储存栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
--第四个参数为移动数量
local result=Backpack:moveGridItem(1000,0,1000,10)
if result==0 then--如果移动成功
	--在聊天框显示
	Chat:sendSystemMsg("把玩家1000的储存栏的第一格物品移动了10个到快捷栏第一格")
else--如果移动失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档，或无法移动")
end
Lua
swapGridItem
参数及类型：

playerid:number
gridsrc:number
griddst:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：交换背包道具

具体使用案例如下：

--交换玩家两个物品栏的物品
--第一个参数为玩家迷你号
--后两个参数为要交换的背包栏id：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
local result=Backpack:moveGridItem(1000,0,1000)
if result==0 then--如果交换成功
	--在聊天框显示
	Chat:sendSystemMsg("交换了玩家1000的储存栏第一格和快捷栏第一格的物品")
else--如果交换失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档，或无法交换")
end
Lua
enoughSpaceForItem
参数及类型：

playerid:number
itemid:number
num:number默认1
返回值及类型：

ErrorCode.OK
该方法的主要作用：背包(包含背包栏、快捷栏)是否有足够的空间存放一定数量的道具

具体使用案例如下：

--判断玩家背包(包括快捷栏和储存栏)是否能继续容纳指定数量的物品
--第一个参数为玩家迷你号
--第二个参数为要判断的物品id，101为土块
--第三个参数为物品数量
local result=Backpack:enoughSpaceForItem(1000,101,999)
if result==0 then--如果可以
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000的背包可以继续容纳999个土块")
else--如果不可以或判断失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000的背包无法继续容纳999个土块，或玩家1000不在当前存档")
end
Lua
calcSpaceNumForItem
参数及类型：

playerid:number
itemid:number
返回值及类型：

ErrorCode.OK
num:number
该方法的主要作用：计算背包(包含背包栏、快捷栏)能存放的道具剩余总数量

具体使用案例如下：

--获取指定玩家的背包(包括快捷栏和储存栏)还能添加多少指定物品
--第一个参数为玩家迷你号
--第二个参数为要获取剩余容纳数量的物品，101为土块
local result,num=Backpack:calcSpaceNumForItem(1000,101)
if result==0 then--如果获取成功
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000的背包还能添加"..num.."个土块")
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档")
end
Lua
getBackpackBarValidList
参数及类型：

playerid:number
bartype:number背包类型
返回值及类型：

ErrorCode.OK
num:number数量
array:table背包格ID数组
该方法的主要作用：获取道具背包栏有效格ID列表(道具已存在)，背包格ID数组

具体使用案例如下：

--获取指定玩家的背包中已有物品的格子id
--第一个参数为玩家迷你号
--第二个参数为背包栏类型：1快捷栏 2储存栏 3装备栏
local result,num,array=Backpack:getBackpackBarValidList(1000,2)
if result==0 then--如果获取成功
	--在聊天框显示已有物品的格子数量
	Chat:sendSystemMsg("玩家1000的储存栏一共有"..num.."格已经放置了物品")
	for i,a in ipairs(array) do
		--在聊天框显示格子id列表
		Chat:sendSystemMsg("第"..i.."个有物品的物品格id："..a)
	end
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档")
end
Lua
getBackpackBarItemList
参数及类型：

playerid:number
bartype:number背包类型
返回值及类型：

ErrorCode.OK
num:number数量
arr:table道具ID数组
该方法的主要作用：获取道具背包栏已拥有道具，道具ID数组

具体使用案例如下：

--获取指定玩家背包的物品列表
--第一个参数为玩家迷你号
--第二个参数为背包栏类型：1快捷栏 2储存栏 3装备栏
local result,num,arr=Backpack:getBackpackBarItemList(1000,1)
if result==0 then--如果获取成功
	--在聊天框显示种类数
	Chat:sendSystemMsg("玩家1000的快捷栏一共有"..num.."种物品")
	for i,a in ipairs(arr) do
		--在聊天框显示物品id列表
		Chat:sendSystemMsg("第"..i.."种物品id："..a)
	end
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档")
end
Lua
hasItemByBackpackBar
参数及类型：

playerid:number
bartype:number
itemid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：检测背包是否持有某个道具

具体使用案例如下：

--判断玩家背包是否包含某物品
--第一个参数为玩家迷你号
--第二个参数为背包栏类型：1快捷栏 2储存栏 3装备栏
--第三个参数为要判断的物品id，1是地心基石
local result=Backpack:hasItemByBackpackBar(1000,1,1)
if result==0 then--如果有
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000的快捷栏里有地心基石")
else--如果没有或获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000的快捷栏里没有地心基石或玩家1000不在当前存档")
end
Lua
getItemNumByBackpackBar
参数及类型：

playerid:number
bartype:number
itemid:number
返回值及类型：

ErrorCode.OK
num:number道具总数量
arr:table道具格ID数组
该方法的主要作用：获取背包持有某个道具总数量，同时返回装有道具的背包格数组

具体使用案例如下：

--获取指定玩家的背包有多少个指定物品
--第一个参数为玩家迷你号
--第二个参数为背包栏类型：1快捷栏 2储存栏 3装备栏
--第三个参数为要获取的物品id，101为土块
local result,num,arr=Backpack:getItemNumByBackpackBar(1000,2,101)
if result==0 then--如果获取成功
	--在聊天框显示物品数量
	Chat:sendSystemMsg("玩家1000的储存栏里有"..num.."个土块")
	for i,a in ipairs(arr) do
		--在聊天框显示物品格列表
		Chat:sendSystemMsg("有土块的第"..i.."个物品格id为："..a)
	end
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档")
end
Lua
getGridItemID
参数及类型：

playerid:number
gridid:number
返回值及类型：

ErrorCode.OK
itemid:number
num:number
该方法的主要作用：获取背包格道具ID(返回itemid, num)

具体使用案例如下：

--获取指定玩家指定物品格的物品id和数量
--第一个参数为玩家迷你号
--第二个参数0为背包栏物品格id，0为储存栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
local result,itemid,num=Backpack:getGridItemID(1000,0)
if result==0 then--如果获取成功
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000的背包储存栏的第一格物品id为："..itemid.."，数量为："..num)
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档")
end
Lua
getGridItemName
参数及类型：

playerid:number
gridid:number
返回值及类型：

ErrorCode.OK
name:string
该方法的主要作用：获取背包格道具名称

具体使用案例如下：

--获取指定玩家指定物品格的物品名称
--第一个参数为玩家迷你号
--第二个参数0为背包栏物品格id，0为储存栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
local result,name=Backpack:getGridItemName(1000,0)
if result==0 then--如果获取成功
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000的背包储存栏的第一格物品名称为："..name)
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("获取失败，可能是玩家1000不在当前存档")
end
Lua
getGridStack
参数及类型：

playerid:number
gridid:number
返回值及类型：

ErrorCode.OK
num:number
maxstack:number
该方法的主要作用：获取背包格道具堆叠数(返回curstack, maxstack)

具体使用案例如下：

--获取指定玩家指定背包物品格的物品堆叠数量和最大堆叠数
--第一个参数为玩家迷你号
--第二个参数0为背包栏id，0为储存栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
local result,num,maxstack=Backpack:getGridStack(1000,0)
if result==0 then--如果获取成功
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000的背包储存栏第一格的物品当前堆叠了"..num.."个，该物品最大可以堆叠"..maxstack.."个")
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档")
end
Lua
getGridDurability
参数及类型：

playerid:number
gridid:number
返回值及类型：

ErrorCode.OK
durcur:number
durmax:number
该方法的主要作用：获取背包格道具耐久度(返回durcur, durmax)

具体使用案例如下：

--获取指定玩家指定背包物品格的物品当前耐久值和最大耐久值
--第一个参数为玩家迷你号
--第二个参数0为背包栏id，0为储存栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
local result,durcur,durmax=Backpack:getGridDurability(1000,0)
if result==0 then--如果获取成功
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000的背包储存栏第一格的物品的耐久值为"..durcur.."，该物品最大耐久值为"..durmax)
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档")
end
Lua
getGridEnchantList
参数及类型：

playerid:number
gridid:number
返回值及类型：

ErrorCode.OK
num:number数量
arr:table附魔ID数组
该方法的主要作用：获取背包格道具附魔，返回附魔id数组

具体使用案例如下：

--获取指定玩家背包中某格物品的附魔数量与id
--第一个参数为玩家迷你号
--第二个参数为背包栏id，1000为快捷栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
local result,num,arr=Backpack:getGridEnchantList(1000,1000)
if result==0 then--如果获取成功
	--在聊天框显示附魔数量
	Chat:sendSystemMsg("玩家1000的快捷栏第一格物品附魔数量为"..num)
	for i,a in ipairs(arr) do
		--在聊天框显示附魔列表
		Chat:sendSystemMsg("第"..i.."个附魔id为："..a)
	end
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档")
end
Lua
getGridToolType
参数及类型：

playerid:number
gridid:number
返回值及类型：

ErrorCode.OK
type:number工具类型
该方法的主要作用：获取背包道具工具类型(<0表示非工具)

具体使用案例如下：

--获取指定玩家指定物品格的物品道具类型
--第一个参数为玩家迷你号
--第二个参数为背包栏id，1000为快捷栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
--返回值可能是：-1非道具 1斧 2镐 3铲 4锄 6剑 7弓 14投掷 等
local result,type=Backpack:getGridToolType(1000,1000)
--在聊天框显示
Chat:sendSystemMsg("玩家1000快捷栏第一格物品类型为：(-1非道具 1斧 2镐 3铲 4锄 6剑 7弓 14投掷)"..type)
Lua
addItem
参数及类型：

playerid:number
itemid:number
num:number
返回值及类型：

ErrorCode.OK
successNum:number成功添加的数量
该方法的主要作用：添加道具到背包

具体使用案例如下：

--给指定玩家的背包添加物品
--第一个参数为玩家迷你号
--第二个参数为要添加的物品id，101为土块
--第三个参数为要添加的物品数量
local result,successNum=Backpack:addItem(1000,101,999)
if result==0 then--如果添加成功
	--在聊天框显示
	Chat:sendSystemMsg("尝试给玩家1000的背包添加999个土块，实际添加了"..successNum)
else--如果添加失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档")
end
Lua
discardItem
参数及类型：

playerid:number
gridid:number
num:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：丢弃背包某个格子里的道具

具体使用案例如下：

--移除指定玩家的指定背包栏的物品
--第一个参数为玩家迷你号
--第二个参数0为背包栏id，0为储存栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
--第三个参数为移除数量
Backpack:discardItem(1000,0,10)
--在聊天框显示
Chat:sendSystemMsg("移除了玩家1000的背包栏第一格10个物品")
Lua
getGridNum
参数及类型：

playerid:number
gridid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：获取背包某个格子的道具数量

具体使用案例如下：

--获取指定玩家指定物品格的物品数量
--第一个参数为玩家迷你号
--第二个参数0为背包栏物品格id，0为储存栏的第一格：0-29储存栏 1000-1007快捷栏 8000-8004装备栏
local result,num=Backpack:getGridNum(1000,0)
if result==0 then--如果获取成功
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000的背包储存栏的第一格物品数量为："..num)
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家1000不在当前存档")
end
Lua
actEquipUpByResID
参数及类型：

objid:number
resid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：玩家穿上装备

具体使用案例如下：

local function ClickBlock(event)
	local objid=event.eventobjid--玩家
	local resid=12241--装备id
	--给玩家穿上装备(前提是玩家背包里有这件装备)
	Backpack:actEquipUpByResID(objid, resid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
actEquipOffByEquipID
参数及类型：

objid:number
equipid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：玩家脱下装备栏装备

具体使用案例如下：

local function ClickBlock(event)
	local objid=event.eventobjid--玩家
	local equipid=0--装备栏id，0代表头盔
	--给玩家脱下装备(前提是玩家装备栏里有装备)
	Backpack:actEquipOffByEquipID(objid, equipid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
actCreateEquip
参数及类型：

objid:number
resid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：创建装备

具体使用案例如下：

local function ClickBlock(event)
	local objid=event.eventobjid--玩家
	local resid=12241--装备id，这里是蓝钻头盔
	--给玩家创建装备(不消耗玩家物品)
	Backpack:actCreateEquip(objid, resid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
actDestructEquip
参数及类型：

playerid:number玩家ID
equipid:number装备栏ID（0~4）
返回值及类型：

code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用：销毁装备

具体使用案例如下：

local function ClickBlock(event)
	local objid=event.eventobjid--玩家
	local equipid=0--装备栏id，0代表头盔
	--销毁玩家装备(不放入背包)
	Backpack:actDestructEquip(objid, equipid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
 

PlayShortCutIxEffect

参数及类型：
objid:number玩家ID
effectid:number特效ID
scale:number缩放大小
返回值及类型：
ErrorCode.OK
该方法的主要作用：设置手持栏道具上播放特效
具体使用案例如下：
local result = Backpack:PlayShortCutIxEffect(objid, effectid,scale)
Lua
 

StopShortCutIxEffect

参数及类型：
objid:number玩家ID
effectid:number特效ID
返回值及类型：
ErrorCode.OK
该方法的主要作用：停止手持栏道具上播放特效
具体使用案例如下：
local result = Backpack:StopShortCutIxEffect(objid, equipid)
Lua
 

PlayShortCutItemEffect 

参数及类型：
objid:number玩家ID
itemid:number道具ID
effectid:number特效ID
scale:number缩放大小
返回值及类型：
ErrorCode.OK
该方法的主要作用：设置快捷栏指定道具上播放特效
具体使用案例如下：
local result = Backpack:PlayShortCutItemEffect(objid,itemid, effectid,scale)
Lua
 

StopShortCutItemEffect

参数及类型：
objid:number玩家ID
itemid:number道具ID
effectid:number特效ID
返回值及类型：
ErrorCode.OK
该方法的主要作用：停止快捷栏指定道具上播放特效
具体使用案例如下：
local result = Backpack:StopShortCutItemEffect(objid, itemid,effectid)
Lua
 


目录
wiki
登录

对象库接口：ObjectLib
 迷你世界
更新时间: 2023-04-26 20:21:09
具体函数名及描述如下:

序号	函数名	函数描述
1	getAreaData(...)	获取区域数据
2	getPositionData(...)	获取位置数据
3	getLivingData(...)	获取生物数据
4	getItemData(...)	获取道具点数据
 

getAreaData

参数及类型：
uuid:number区域ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
id:number区域运行ID
该方法的主要作用： 获取区域数据
具体使用案例如下：
local result,areaid= ObjectLib:getAreaData(10000001) --场景中拉取的区域
if result == 0 then--是液体方块
	Chat:sendSystemMsg("获取的区域ID是 "..areaid)
end
Lua
 

getPositionData

参数及类型：
uuid:number位置ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
id:number位置运行ID
该方法的主要作用： 获取位置数据
具体使用案例如下：
local result,areaid= ObjectLib:getPositionData(20000001) --场景中放置的位置
if result == 0 then--是液体方块
	Chat:sendSystemMsg("获取的区域ID是 "..areaid)
end
Lua
 

getLivingData

参数及类型：
uuid:number生物ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
id:number生物运行ID
该方法的主要作用： 获取生物数据
具体使用案例如下：
local result,areaid= ObjectLib:getLivingData(30000001) --场景中放置的生物
if result == 0 then--是液体方块
	Chat:sendSystemMsg("获取的区域ID是 "..areaid)
end
Lua
 

getItemData

参数及类型：
uuid:number道具ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
id:number道具运行ID
该方法的主要作用： 获取道具点数据
具体使用案例如下：
local result,areaid= ObjectLib:getItemData(50000001) --场景中放置的道具点
if result == 0 then--是液体方块
	Chat:sendSystemMsg("获取的区域ID是 "..areaid)
end
Lua

目录
wiki
登录

小地图接口：Mapmark
 彼得兔
更新时间: 2023-10-25 10:33:48
具体函数名及描述如下:

序号	函数名	函数描述
1	newShape(...)	新增一个形状(线，矩形，圆形)
2	deleteShape(...)	删除一个形状
3	setShapeColor(...)	设置形状颜色
4	showShape(...)	设置形状显示 or 隐藏
5	updateLine(...)	更新形状(线形)，传入起始坐标和末尾坐标
6	updateRectangle(...)	更新形状(矩形)，传入起始坐标和尺寸
7	updateCircle(...)	更新形状(圆形)，传入圆心坐标和半径
newShape
参数及类型：

 
type:number类型标记
isshow:boolean是否显示
r,g,b:number颜色值(范围0~255)
返回值及类型：

ErrorCode.OK
shapeid:number
该方法的主要作用：新增一个形状(线，矩形，圆形)

具体使用案例如下：

--在地图创建一条黑色的线并显示(貌似没有效果)
--第一个参数0是形状类型：0线 1矩形 2圆形
--第二个参数是是否显示：true是 false否
--后三个参数是形状颜色，分别是R、G、B(红绿蓝)
local result,shapeid=MapMark:newShape(0,true,0,0,0)
--在聊天框显示
Chat:sendSystemMsg("创建了一条黑色的线！")
Lua
deleteShape
参数及类型：

shapeid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：删除一个形状

具体使用案例如下：

--把id为1的形状删除，参数1就是要删除的形状id
MapMark:deleteShape(1)
--在聊天框显示
Chat:sendSystemMsg("删除了id为1的形状！")
Lua
setShapeColor
参数及类型：

shapeid:number
r:number
g:number
b:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置形状颜色

具体使用案例如下：

--把id为1的形状设置为黑色
--第一个参数是形状id
--后三个参数是要改成的颜色，分别是R、G、B(红绿蓝)
MapMark:setShapeColor(1,0,0,0)
--在聊天框显示
Chat:sendSystemMsg("id为1的形状被设置成了黑色！")
Lua
showShape
参数及类型：

shapeid:number
showflag:boolean
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置形状显示 or 隐藏

具体使用案例如下：

--把id为1的形状隐藏
--第一个参数是形状id
--第二个参数是是否隐藏，true显示 false隐藏
MapMark:showShape(1,false)
--在聊天框显示
Chat:sendSystemMsg("隐藏了id为1的形状！")
Lua
updateLine
参数及类型：

shapeid:number
sx:number
sz:number
ex:number
ez:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：更新形状(线形)，传入起始坐标和末尾坐标

具体使用案例如下：

--把id为1的形状(只能是直线)设置为从(0,0)到(1,1)
--第一个参数1是直线形状id
--第二、三个参数0,0是直线起点坐标
--后两个参数1,1是直线终点坐标
MapMark:updateLine(1,0,0,1,1)
--在聊天框显示
Chat:sendSystemMsg("id为1的直线被设置为了从(0,0)到(1,1)")
Lua
updateRectangle
参数及类型：

shapeid:number形状ID
sx:numberx坐标值
sz:numberz坐标值
w:numberx方向坐标差
h:numberz方向坐标差
返回值及类型：

ErrorCode.OK
该方法的主要作用：更新形状(矩形)，传入起始坐标和尺寸

具体使用案例如下：

--把id为1的形状(只能是矩形)设置为从(0,0)开始宽和高分别为1和1的矩形
--第一个参数1是矩形形状id
--第二、三个参数0,0是矩形起点坐标
--后两个参数1,1是矩形宽高尺寸
MapMark:updateRectangle(1,0,0,1,1)
--在聊天框显示
Chat:sendSystemMsg("id为1的矩形被设置为了起点在(0,0)，宽高分别是1和1")
Lua
updateCircle
参数及类型：

shapeid:number
cx:number
cz:number
r:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：更新形状(圆形)，传入圆心坐标和半径

具体使用案例如下：

--把id为1的形状(只能是圆)设置为圆心为(0,0)，半径为1的圆
--第一个参数1是圆形形状id
--第二、三个参数0,0是圆的圆心坐标
--最后一个参数1是圆的半径
MapMark:updateCircle(1,0,0,1)
--在聊天框显示
Chat:sendSystemMsg("id为1的圆被设置为了圆心在(0,0)，半径为1")
Lua

目录
wiki
登录

出生点接口：Spawnport
 彼得兔
更新时间: 2023-04-26 10:19:56
具体函数名及描述如下:

序号	函数名	函数描述
1	getSpawnPoint(...)	获取默认出生点
2	setSpawnPoint(...)	设置出生点位置
3	getChunkValidSpawnPos(...)	获取区块有效刷新点，可作为出生点
getSpawnPoint
参数及类型：nil

返回值及类型：

ErrorCode.OK
x:number
y:number
z:number
该方法的主要作用：获取默认出生点

具体使用案例如下：

--获取存档的默认出生点坐标
local result,x,y,z=Spawnport:getSpawnPoint()
--在聊天框显示
Chat:sendSystemMsg("默认出生点坐标为：("..x..","..y..","..z..")")
Lua
setSpawnPoint
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置出生点位置

具体使用案例如下：

local function ClickBlock(event)
	local x,y,z=event.x,event.y,event.z--被点击的坐标
	--设置出生点坐标(貌似无效)
	Spawnport:setSpawnPoint(x, y, z)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
getChunkValidSpawnPos
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
x:number
y:number
z:number
该方法的主要作用：获取区块有效刷新点，可作为出生点

具体使用案例如下：

--随机获取区块(0,0,0)的有效刷新点坐标(意义不明)
local result,x,y,z=Spawnport:getChunkValidSpawnPos(0,0,0)
--在聊天框显示
Chat:sendSystemMsg("区块(0,0,0)的随机有效刷新点坐标为：("..x..","..y..","..z..")")
Lua

目录
wiki
登录

计时器接口：MiniTimer
 彼得兔
更新时间: 2023-04-26 20:24:50
具体函数名及描述如下:

序号	函数名	函数描述
1	isExist(...)	判断计时器是否存在
2	createTimer(...)	添加计时器
3	deleteTimer(...)	删除计时器
4	startBackwardTimer(...)	启动倒计时
5	startForwardTimer(...)	启动正向计时
6	pauseTimer(...)	暂停计时器
7	resumeTimer(...)	恢复计时器
8	stopTimer(...)	停止计时器
9	changeTimerTime(...)	改变计时器计时
10	getTimerTime(...)	获取计时器时间
11	showTimerWnd(...)	
显示计时器窗口

(若其他计时器已经显示，则替换显示)

12	hideTimerWnd(...)
隐藏计时器窗口
isExist
参数及类型：

id:int
返回值及类型：

result:bool
该方法的主要作用：判断计时器是否存在

具体使用案例如下：

--判断id为1的计时器是否存在，参数1就是计时器id
local result=MiniTimer:isExist(1)
if result==0 then--如果存在
	--在聊天框显示
	Chat:sendSystemMsg("id为1的计时器存在！")
	--让id为1的计时器开始20秒倒计时
	MiniTimer:startBackwardTimer(1,20,false)
	--在房主游戏界面显示计时时间
	MiniTimer:showTimerTips({0},1,"id为1的计时器的计时为：",true)
	--在聊天框显示
	Chat:sendSystemMsg("开始20秒倒计时！")
else--如果不存在
	--在聊天框显示
	Chat:sendSystemMsg("id为1的计时器不存在！")
	--创建一个计时器，命名为“timer”
	local result2,id=MiniTimer:createTimer("timer",nil,true)
	--在聊天框显示
	Chat:sendSystemMsg("创建了一个名为“timer”的新计时器并开始20秒倒计时！计时器id为"..id)
	--让新创建的这个计时器开始20秒倒计时
	MiniTimer:startBackwardTimer(id,20,false)
	--在房主游戏界面显示计时时间
	MiniTimer:showTimerTips({0},id,"id为1的计时器的计时为：",true)
end
Lua
createTimer
参数及类型：

name:string
返回值及类型：

ErrorCode.OK
id:int计时器索引
该方法的主要作用：添加计时器

具体使用案例如下：

--创建一个新计时器，命名为“timer”
--第一个参数就是创建的计时器的名字，第二个参数是地图id(作用不明，默认不传)，第三个参数是是否为存档私有计时器(改为false则所有存档可共用此计时器。默认不传)
local result,id=MiniTimer:createTimer("timer",nil,true)
--在聊天框显示
Chat:sendSystemMsg("新建了名为“timer”的计时器，id为"..id)
Lua
deleteTimer
参数及类型：

id:int
返回值及类型：

ErrorCode.OK
该方法的主要作用：删除计时器

具体使用案例如下：

--删除id为1的计时器。参数为要删除的计时器的id
MiniTimer:deleteTimer(1)
--在聊天框显示
Chat:sendSystemMsg("删除了id为1的计时器！")
Lua
startBackwardTimer
参数及类型：

id:int计时器索引
interval:int倒计时间隔时间
repeated:bool是否重复执行
返回值及类型：

ErrorCode.OK
该方法的主要作用：启动倒计时

具体使用案例如下：

--让id为1的计时器开始20秒倒计时
--第一个参数为计时器id，第二个参数为倒计时时间，第三个参数为是否重复执行(貌似无效)
MiniTimer:startBackwardTimer(1,20,false)
--在聊天框显示
Chat:sendSystemMsg("启动了id为1的计时器，倒计时20秒！")
--在房主游戏界面显示id为1的计时器的计时
MiniTimer:showTimerTips({0},1,"id为1的计时器的计时为：",true)
Lua
startForwardTimer
参数及类型：

id:int计时器索引
返回值及类型：

ErrorCode.OK
该方法的主要作用：启动正向计时

具体使用案例如下：

--让id为1的计时器递增计时，参数1就是计时器id
MiniTimer:startForwardTimer(1)
--在聊天框显示
Chat:sendSystemMsg("id为1的计时器开始正向计时！")
--在房主游戏界面显示id为1的计时器的计时
MiniTimer:showTimerTips({0},1,"id为1的计时器的计时为：",true)
Lua
pauseTimer
参数及类型：

id:int计时器索引
返回值及类型：

ErrorCode.OK
该方法的主要作用：暂停计时器

具体使用案例如下：

--暂停id为1的计时器的计时，参数1就是计时器的id
MiniTimer:pauseTimer(1)
--在聊天框显示
Chat:sendSystemMsg("暂停了id为1的计时器！")
Lua
resumeTimer
参数及类型：

id:int计时器索引
返回值及类型：

ErrorCode.OK
该方法的主要作用：恢复计时器

具体使用案例如下：

--恢复id为1的计时器的计时，参数1就是计时器的id
MiniTimer:resumeTimer(1)
--在聊天框显示
Chat:sendSystemMsg("恢复了id为1的计时器！")
--在房主游戏界面显示id为1的计时器的计时
MiniTimer:showTimerTips({0},1,"id为1的计时器的计时为：",true)
Lua
stopTimer
参数及类型：

id:int计时器索引
返回值及类型：

ErrorCode.OK
该方法的主要作用：停止计时器

具体使用案例如下：

--停止id为1的计时器的计时，参数1就是计时器的id
MiniTimer:stopTimer(1)
--在聊天框显示
Chat:sendSystemMsg("停止了id为1的计时器！")
Lua
changeTimerTime
参数及类型：

id:int计时器索引
time:int计时器计时
返回值及类型：

ErrorCode.OK
该方法的主要作用：改变计时器计时

具体使用案例如下：

local result = MiniTimer:changeTimerTime(id, curtime)
Lua
getTimerTime
参数及类型：

id:int计时器索引
返回值及类型：

ErrorCode.OK
second:int计时器运行时间
该方法的主要作用：获取计时器时间

具体使用案例如下：

--在聊天框显示提示
Chat:sendSystemMsg("每次做动画表情都会显示id为1的计时器的计时时间！")
--当监听到动画表情时，执行此函数
local function showtime()
	--获取id为1的计时器的计时时间，参数1就是计时器的id
	local result,second=MiniTimer:getTimerTime(1)
	--在聊天框显示
	Chat:sendSystemMsg("id为1的计时器的计时时间为"..second)
end
--注册动画表情监听器，执行showtime函数
ScriptSupportEvent:registerEvent([=[Player.PlayAction]=],showtime)
Lua
 

showTimerWnd

参数及类型：
playerids:table玩家ID数组(nil表示全部玩家)
timerid:number计时器ID
title:string计时器窗口显示的标题
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 显示计时器窗口(若其他计时器已经显示，则替换显示)
具体使用案例如下：
local code  = MiniTimer:showTimerWnd(playerids, timerid, title)
if code == ErrorCode.OK then
	print('执行成功'  )
else
	print('执行失败')
end
Lua
 

hideTimerWnd

参数及类型：
playerids:table玩家ID数组(nil表示全部玩家)
timerid:number计时器ID
title:string计时器窗口显示的标题
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 隐藏计时器窗口
具体使用案例如下：
local code  = MiniTimer:hideTimerWnd(playerids, timerid)
if code == ErrorCode.OK then
	print('执行成功'  )
else
	print('执行失败')
end
Lua

目录
wiki
登录

函数监听接口：ListenParam
 彼得兔
更新时间: 2023-04-26 10:20:18
具体函数名及描述如下:

序号	函数名	函数描述
1	AddGraphicsListenParam(...)	添加图文信息 监听触发器参数 刷新的对象id 参数信息 回调方法
AddGraphicsListenParam
参数及类型：

graphid:number已创建的图文信息ID
funcs:table监听函数列表
param:table监听函数需要的参数
返回值及类型：

ErrorCode.OK
该方法的主要作用：添加图文信息 监听触发器参数 刷新的对象id 参数信息 回调方法

具体使用案例如下：

-- 创建进度条基本信息
local function func_3()
    local v1 = math.random(1,100) -- 进度条的当前值
    local v2 = 100  -- 进度条的最大值
    local v3 = 0xFFC107  --颜色代码
    local v4 = 1  -- 编号
    return Graphics:makeGraphicsProgress(v1, v2, v3, v4)
end
local function getdir(playerid)
    return {x =0 ,y =1,z = 0}
end
-- 触发器时间回调函数
local function func_event(param)
    local playerid = CurEventParam.TriggerByPlayer
    if playerid then
        local offest = 100 -- 方向上的偏移距离
        local dir = getdir(playerid) -- 获取方向
        local graphinfo = func_3() -- 获取图文信息
        -- 创建一个进度条信息
        local result, grapid = Graphics:createGraphicsProgressByActor(playerid,graphinfo,dir,offest)
        if result == ErrorCode.OK then
            -- 获取进度条的当前值
			local function getCurValue(params)
				local cur = Player:getAttr(params.TriggerByPlayer,PLAYERATTR.CUR_HP) -- 获取当前血量
				return cur + math.random(1,20)
			end
			-- 获取进度条的最大值
			local function getMaxValue(params)
				local max = Player:getAttr(params.TriggerByPlayer,PLAYERATTR.MAX_HP) -- 获取最大血量
				return max + math.random(50,100)
			end
			--监听的函数列表
			local funcs = {getCurValue,getMaxValue}
			-- 将创建成功的进度条添加进自动监听
            ListenParam:AddGraphicsListenParam(grapid,funcs,param)
        end
    end
end
ScriptSupportEvent:registerEvent('Player.PlayAction', func_event)
Lua

目录
wiki
登录

变量组接口：ValueGroup
 彼得兔
更新时间: 2023-04-26 10:20:36
（此类接口针对变量库中已创建的变量进行改动、调用）

具体函数名及描述如下:

序号	函数名	函数描述
1	getAllGroupItem(...)	获取组中所有值
2	insertInGroupByName(...)	添加任意值到任意组
3	removeValueIndexByName(...)	从任意组移除指定编号的值
4	removeValueByName(...)	从任意组移除任意值
5	clearGroupByName(...)	清空任意组
6	getGrouplengthByName(...)	获取数组长度
7	getValueNoByName(...)	获取组中索引值
8	setValueNoByName(...)	设置组中索引值
9	getRandomValueByName(...)	获得数组里面的随机值
10	insertValueByName(...)	在任意组插入任意值
11	deleteNoByName(...)	从任意组删除指定编号的值
12	deleteValueByName(...)	从任意组删除指定编号的值
13	clearNoValueByName(...)	从任意组删除指定编号的值
14	addGroupByName(...)	在任意组中添加一组值
15	removeGroupByName(...)	在任意组中将一组值设为空值
16	deleteGroupByName(...)	在任意组中删除一组值
17	insertGroupByName(...)	在任意组插入一组值
18	replaceValueByName(...)	替换任意组中的任意值
19	sortGroupByName(...)	对任意组的值排序
20	hasValueByName(...)	任意组是否有任意值
21	hasNoByName(...)	任意组位置上是否有值
22	getValueCountByName(...)	获取任意组种任意值的数量
23	getGroupNoByValue(...)	获取任意组种任意值的编号
24	getSpcialValueByName(...)	获取最大最小值
getAllGroupItem
参数及类型：

vartype: VARTYPE枚举组类型
libname:string组名
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
ret:table所有元素
该方法的主要作用：获取变量组中所有值

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--获取类型为vartype的变量组中所有变量的值
	local result,ret=Valuegroup:getAllGroupItem(vartype, libname, playerid)
	print(ret)--在日志输出
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
insertInGroupByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
value需:要添加的值
playerid:私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：添加任意值到任意组，加在组的最后一位

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local value=10--值
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--添加value到vartype类型的变量组的最后一位
	Valuegroup:insertInGroupByName(vartype, libname, value, playerid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
removeValueIndexByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
indx:number组中的编号索引
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：从任意组移除指定编号的值，变为nil，编号不会移除

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local index=1--序号
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--删除类型为vartype的变量组中序号为index的值，删除后值为nil
	Valuegroup:removeValueIndexByName(vartype, libname, index, playerid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
removeValueByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
value需要删除的值
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：从任意组移除任意值为nil

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local value=10--值
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--删除类型为vartype的变量组中值为value的值，删除后值为nil
	Valuegroup:removeValueByName(vartype, libname, value, playerid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
clearGroupByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：清空任意组，编号和内容全部清空

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--清空类型为vartype名为libname的变量组
	Valuegroup:clearGroupByName(vartype, libname, playerid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
getGrouplengthByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
number:number数组长度
该方法的主要作用：获取数组长度

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--获取变量组长度
	local result,length=Valuegroup:getGrouplengthByName(vartype, libname, playerid)
	print(length)--在日志输出
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
getValueNoByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
indx:number组中的编号索引
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
libvarid:number编号的值
该方法的主要作用：获取组中指定编号的值

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local index=1--序号
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--获取变量组指定序号的值
	local result,value=Valuegroup:getValueNoByName(vartype, libname, index, playerid)
	print(value)--在日志输出
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
setValueNoByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
indx:number组中的编号索引
value设置的值
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置组中编号索引的值

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local index=1--序号
	local value=10--要设置的值
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--设置变量组指定序号的值为value
	Valuegroup:setValueNoByName(vartype, libname, index, value, playerid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
getRandomValueByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
返回值及类型：

ErrorCode.OK
value获取到的值
该方法的主要作用：随机获得数组里面的值

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--随机获取变量组中的一个值
	local result,value=Valuegroup:getRandomValueByName(vartype, libname, playerid)
	print(value)--在日志输出
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
insertValueByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
no插入的编号位置
value设置的值
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：在任意组任意编号位置插入任意值

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local no=1--要插入的位置
	local val=10--要插入的值
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--在变量组中no的位置插入值val
	Valuegroup:insertValueByName(vartype, libname, no, val, playerid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
deleteNoByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
no清空的编号位置
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：从任意组清空指定编号的值

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local no=1--要清空的编号位置
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--清空变量组中编号为no的值
	Valuegroup:deleteNoByName(vartype, libname, no, playerid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
deleteValueByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
val清空的值
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：从任意组清空指定值

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local val=10--要清空的值
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--清空变量组中值为val的值
	Valuegroup:deleteValueByName(vartype, libname, val, playerid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
addGroupByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
libvarid2:string组名
playerid1:私有组的玩家ID，全局组为0
playerid2:私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：在组1的末尾添加组2的值

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local libname="数值组02"--组名
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	local playerid2=0--私有变量组所属玩家id，0代表全局变量组
	--在libname组的末尾添加libname2组的值
	Valuegroup:addGroupByName(vartype, libname, libname2, playerid, playerid2)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
removeGroupByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
libvarid2:string组名
playerid1:私有组的玩家ID，全局组为0
playerid2:私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：比较组1和组2，若组1中有与组2种相同的值则设为nil

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local libname2="数值组02"--组名
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	local playerid2=0--私有变量组所属玩家id，0代表全局变量组
	--将libname组中和libname2组中重复的值设为nil
	Valuegroup:removeGroupByName(vartype, libname, libname2, playerid, playerid2)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
deleteGroupByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
libvarid2:string组名
playerid1:私有组的玩家ID，全局组为0
playerid2:私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：比较组1和组2，若组1中有与组2种相同的值则清除

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local libname2="数值组02"--组名
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	local playerid2=0--私有变量组所属玩家id，0代表全局变量组
	--将libname组中和libname2组中重复的值清除
	Valuegroup:deleteGroupByName(vartype, libname, libname2, playerid, playerid2)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
insertGroupByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
no:number插入的位置
libvarid2:string组名
playerid1:私有组的玩家ID，全局组为0
playerid2:私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：在组1指定编号位置插入组2的值

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local no=1--要插入的位置
	local libname2="数值组02"--组名
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	local playerid2=0--私有变量组所属玩家id，0代表全局变量组
	--把libname2组的值插入到libname组编号为no的位置
	Valuegroup:insertGroupByName(vartype, libname, no, libname2, playerid, playerid2)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
replaceValueByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
oldval旧值
newval新值
playerid私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：替换任意组中的任意值为新的值

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local oldval=10--要替换掉的值
	local newval=20--替换为的值
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--把组中值为oldval的值替换为newval
	Valuegroup:replaceValueByName(vartype, libname, oldval, newval, playerid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
sortGroupByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
sortType排序类型排序类型升序：0，降序：1
playerid1私有组的玩家ID，全局组为0
返回值及类型：

ErrorCode.OK
该方法的主要作用：对任意组的值排序

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local sortType=1--排序方式：0升序 1降序
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--对组中的值排序
	Valuegroup:sortGroupByName(vartype, libname, sortType, playerid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
hasValueByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
val查询的值
playerid私有组的玩家ID
返回值及类型：

ErrorCode.OK
该方法的主要作用：任意组是否有任意值，如果有result返回0

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local val=10--要检测的值
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--检测组中是否包含val
	local result=Valuegroup:hasValueByName(vartype, libname, val, playerid)
	if result==0 then
		Chat:sendSystemMsg("包含")
	else
		Chat:sendSystemMsg("不包含")
	end
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
hasNoByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
no:number索引值
playerid私有组的玩家ID
返回值及类型：

ErrorCode.OK
该方法的主要作用：任意组位置上是否有值，有则result返回0

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local no=1--要检测的编号
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--检测组中no的位置是否有值
	local result=Valuegroup:hasNoByName(vartype, libname, no, playerid)
	if result==0 then
		Chat:sendSystemMsg("有值")
	else
		Chat:sendSystemMsg("没有值")
	end
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
getValueCountByName
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
val查询的值
playerid私有组的玩家ID
返回值及类型：

ErrorCode.OK
libvarid:number值数量
该方法的主要作用：获取任意组种任意值的数量

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local val=10--要计数的值
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--获取组中值为val的数量
	local result,num=Valuegroup:getValueCountByName(vartype, libname, val, playerid)
	print(num)--在日志输出
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
getGroupNoByValue
参数及类型：

vartype: VARTYPE枚举组类型
libvarid:string组名
val查询的值
playerid私有组的玩家ID
返回值及类型：

ErrorCode.OK
该方法的主要作用：获取任意组种任意值的编号，如果多个相同值，只返回第一个

具体使用案例如下：

local function ClickBlock(event)
	local vartype=17--变量组类型，17是数值组
	local libname="数值组01"--组名
	local val=10--要获取编号的值
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--获取组中值为val的编号
	local result,no=Valuegroup:getGroupNoByValue(vartype, libname, val, playerid)
	print(result,no)--在日志输出
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua
getSpcialValueByName
参数及类型：

libvarid:string组名
type取最小值参数为0，最大值参数为1
返回值及类型：

ErrorCode.OK
该方法的主要作用：获取组内最大最小值

具体使用案例如下：

local function ClickBlock(event)
	local libname="数值组01"--组名
	local itype=1--获取类型：0最小值 1最大值
	local playerid=0--私有变量组所属玩家id，0代表全局变量组
	--获取组中最值
	local result,m=Valuegroup:getSpcialValueByName(libname, itype, playerid)
	print(result,m)--在日志输出
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], ClickBlock)--点击方块
Lua

目录
wiki
登录

自定义UI接口：Customui
 彼得兔
更新时间: 2024-11-07 15:12:42
具体函数名及描述如下:（除前两个，其余的目前只能在UI编辑器内部的脚本使用）
序号	函数名	函数描述
1	openUIView(...)	打开一个UI界面（注意：继承自player对象）
2	hideUIView(...)	隐藏一个UI界面（注意：继承自player对象）
1	setText(...)	设置文本元件内容（只在UI局部脚本有效）
2	setTexture(...)	设置文本元件图案纹理（只在UI局部脚本有效）
3	setSize(...)	设置元件大小（只在UI局部脚本有效）
4	setFontSize(...)	设置文本元件字体大小（只在UI局部脚本有效）
5	setColor(...)	设置文本元件颜色（只在UI局部脚本有效）
6	showElement(...)	显示元件（只在UI局部脚本有效）
7	hideElement(...)	隐藏元件（只在UI局部脚本有效）
8	rotateElement(...)	旋转元件（只在UI局部脚本有效）
9	setState(...)	切换页面状态（只在UI局部脚本有效）
10	setAlpha(...)	设置元件透明度（只在UI局部脚本有效）
11	setPosition(...)	设置元件位置（只在UI局部脚本有效）
12	getItemIcon(...)
获取道具类型图标iconID（只在UI局部脚本有效）
13	getMonsterObjIcon(...)
获取生物图标iconID（只在UI局部脚本有效）
14	getMonsterIcon(...)
获取生物类型图标iconID（只在UI局部脚本有效）
15	getStatusIcon(...)
获取状态类型图标iconID（只在UI局部脚本有效）
16	getBlockIcon(...)
获取方块类型图标iconID（只在UI局部脚本有效）
17	getRoleIcon(...)
获取角色类型图标iconID
18	getShuctIcon(...)
获取玩家快捷栏道具图标iconID
19	SmoothMoveTo(...)
元件平滑移动到指定位置
20	SmoothMoveBy(...)
元件平滑移动相对距离
21	SmoothScaleTo(...)
元件平滑改变到指定宽度和高度
22	SmoothScaleBy(...)
元件平滑改变相对宽度和高度
23	SmoothRotateTo(...)
元件平滑旋转到指定角度
24	SmoothRotateBy(...)
元件平滑旋转到相对角度
25	PlayElementAnim(...)
元件播放动画
26	StopAnim(...)
元件停止动画
27	SetLoaderModel(...)
设置装载器的模型
28	SetLoaderModelScale(...)
设置装载器的模型缩放
29	SetLoaderModelDir(...)
设置装载器的模型方向
30	SetLoaderModelAct(...)
设置装载器的模型动画
31	TurnSliderToPos(...)
滑动列表跳转到某位置
32	SetSliderDir(...)
设置滑动列表的滑动方式
33	SetSliderBarImg(...)
设置滑动条的图案
34	SetProgressBarValue(...)
设置玩家界面进度条的值
35	SetProgressBarResId(...)
设置玩家界面进度条的纹理
36	SmoothIncreaseProgress(...)
进度条文本平滑计时
 

如何查看界面、元件和图片id？
方法一：



方法二：

1.利用触发器触发需要获得id的对象：



2.在运行日志里可以看到相关id：



特别注意：界面id、元件id均为字符串，使用时需要添加引号；图片id使用字符串或数字均可。

 

openUIView
参数及类型：

objid:number玩家ID
uiname:string自定义界面的UIID
返回值及类型：

ErrorCode.OK
该方法的主要作用：打开一个UI界面

具体使用案例如下：

--有玩家进入游戏时，执行此函数
local function player_enter(event)
    local uin=event.eventobjid--进入游戏的玩家迷你号
    local uiid="6986982063319417057"--要打开的界面id
    Player:openUIView(uin,uiid)--给玩家打开界面
end
ScriptSupportEvent:registerEvent([=[Game.AnyPlayer.EnterGame]=],player_enter)
Lua
hideUIView
参数及类型：

objid:number玩家ID
uiname:string自定义界面的UIID
返回值及类型：

ErrorCode.OK
该方法的主要作用：隐藏一个UI界面

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local uin=event.eventobjid--点击方块的玩家迷你号
    local uiid="6986982063319417057"--要隐藏的界面id
    Player:hideUIView(uin,uiid)--给玩家隐藏界面
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=],clickblock)
Lua
setText
参数及类型：

playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
text:string文本内容
animid:number动画ID(缺省参数)
time:number动画时长(缺省参数)
mode:number播放模式(缺省参数)
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置文本元件内容

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6986982063319417057"--界面id
    local elementid="6986982063319417057_1"--文本元件id
    local text="你好呀"--要设置的文本内容
    --设置玩家的文本元件的显示内容
    Customui:setText(playerid, uiid, elementid, text)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], clickblock)
Lua
setTexture
参数及类型：

playerid:number玩家ID
uiid:string自定义界面的UIID
elementid:string元件的UIID
url:string图片ID
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置图片元件图案纹理

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6986982063319417057"--界面id
    local elementid="6986982063319417057_3"--图片元件id
    local url="10010"--要设置的图案id
    --设置玩家的图片元件的图案
    Customui:setTexture(playerid, uiid, elementid, url)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], clickblock)
Lua
setSize
参数及类型：

playerid:number玩家ID
uiid:string自定义界面的UIID
elementid:string元件的UIID
width:number元件宽度
height:number元件高度
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置元件大小

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6986982063319417057"--界面id
    local elementid="6986982063319417057_3"--元件id
    local width,height=500,200--设置元件的宽高
    --设置玩家的元件的大小
    Customui:setSize(playerid, uiid, elementid, width, height)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], clickblock)
Lua
setFontSize
参数及类型：

playerid:number玩家ID
uiid:string自定义界面的UIID
elementid:string元件的UIID
size:number字体大小
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置文本元件字体大小

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6986982063319417057"--界面id
    local elementid="6986982063319417057_1"--文本元件id
    local size=50--要设置的文本元件的字体大小
    --设置玩家的文本元件的字体大小
    Customui:setFontSize(playerid, uiid, elementid, size)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], clickblock)
Lua
setColor
参数及类型：

playerid:number玩家ID
uiid:string自定义界面的UIID
elementid:string元件的UIID
color:string16进制颜色值
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置文本元件颜色

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6986982063319417057"--界面id
    local elementid="6986982063319417057_1"--元件id
    local color="0xFF0000"--要设置的元件颜色
    --设置玩家的元件颜色
    Customui:setColor(playerid, uiid, elementid, color)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], clickblock)
Lua
showElement
参数及类型：

playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
effectid:number动画ID(缺省参数)
time:number动画时长(缺省参数)
返回值及类型：

ErrorCode.OK
该方法的主要作用：显示元件

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6986982063319417057"--要显示的元件所在的界面id
    local elementid="6986982063319417057_1"--要显示的元件id
    --对玩家显示元件
    Customui:showElement(playerid, uiid, elementid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=],clickblock)
Lua
hideElement
参数及类型：

playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
effectid:number动画ID(缺省参数)
time:number动画时长(缺省参数)
返回值及类型：

ErrorCode.OK
该方法的主要作用：隐藏元件

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6986982063319417057"--要隐藏的元件所在的界面id
    local elementid="6986982063319417057_1"--要隐藏的元件id
    --对玩家隐藏元件
    Customui:hideElement(playerid, uiid, elementid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=],clickblock)
Lua
rotateElement
参数及类型：

playerid:number玩家ID
uiid:string自定义界面的UIID
elementid:string元件的UIID
rotate:number旋转角度
返回值及类型：

ErrorCode.OK
该方法的主要作用：旋转元件

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6986982063319417057"--要旋转的元件所在的界面id
    local elementid="6986982063319417057_1"--要旋转的元件id
    local rotate=90--要旋转的度数（顺时针）
    --对玩家旋转元件
    Customui:rotateElement(playerid, uiid, elementid, rotate)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=],clickblock)
Lua
setState
参数及类型：

playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
pageIndex:string状态值
effectid:number动作枚举LinearTransformation.None或LinearLinearTransformation
time:number动画事件(缺省参数)
返回值及类型：

ErrorCode.OK
该方法的主要作用：切换页面状态

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6997615793455979871"--界面id
    local statename="6997615793455979871-基础页面1"--页面状态
    --切换玩家的页面状态
    Customui:setState(playerid, uiid, statename)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], clickblock)
Lua
setAlpha
参数及类型：

playerid:number玩家ID
uiid:string自定义界面的UIID
elementid:string元件的UIID
alpha:number透明度
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置元件透明度

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6997615793455979871"--界面id
	local elementid="6997615793455979871_1"--元件id
	local alpha=99--透明度
    --设置元件透明度
    Customui:setAlpha(playerid, uiid, elementid, alpha)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], clickblock)
Lua
setPosition
参数及类型：

playerid:number玩家ID
uiid:string自定义界面的UIID
elementid:string元件的UIID
x, y:number坐标
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置元件位置

具体使用案例如下：

--玩家点击方块时，执行此函数
local function clickblock(event)
    local playerid=event.eventobjid--点击方块的玩家迷你号
    local uiid="6997615793455979871"--界面id
	local elementid="6997615793455979871_1"--元件id
	local x,y=100,100--要设置到的坐标
    --设置元件位置
    Customui:setPosition(playerid, uiid, elementid, x, y)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], clickblock)
Lua
 

getItemIcon

参数及类型：
itemid:number道具类型ID
返回值及类型：
ErrorCode.OK
iconid:number道具iconID
该方法的主要作用：获取道具类型图标iconID
具体使用案例如下：
local result,iconid = Customui:getItemIcon(itemid)
Lua
 

getMonsterObjIcon

参数及类型：
objid:number生物ID
返回值及类型：
ErrorCode.OK
iconid:number生物iconID
该方法的主要作用：获取生物图标iconID
具体使用案例如下：
local result,iconid = Customui:getMonsterObjIcon(objid)
Lua
 

getMonsterIcon

参数及类型：
actorid:number生物类型ID
返回值及类型：
ErrorCode.OK
iconid:number生物iconID
该方法的主要作用：获取生物类型图标iconID
具体使用案例如下：
local result,iconid = Customui:getMonsterIcon(actorid)
Lua
 

getStatusIcon

参数及类型：
buffid:number状态类型ID
返回值及类型：
ErrorCode.OK
iconid:number状态iconID
该方法的主要作用：获取状态类型图标iconID
具体使用案例如下：
local result,iconid = Customui:getStatusIcon(buffid)
Lua
 

getBlockIcon

参数及类型：
blockid:number方块类型ID
返回值及类型：
ErrorCode.OK
iconid:number方块iconID
该方法的主要作用：获取方块类型图标iconID
具体使用案例如下：
local result,iconid = Customui:getBlockIcon(blockid)
Lua
 

getRoleIcon

参数及类型：
playerid:number玩家ID
返回值及类型：
ErrorCode.OK
iconid:number角色iconID
该方法的主要作用：获取角色类型图标iconID
具体使用案例如下：
local result,iconid = Customui:getRoleIcon(playerid)
Lua
 

getShuctIcon

参数及类型：
playerid:number玩家ID
ix:number快捷栏索引（1~8）
返回值及类型：
ErrorCode.OK
iconid:number道具iconID
该方法的主要作用：获取玩家快捷栏道具图标iconID
具体使用案例如下：
local result,iconid = Customui:getShuctIcon(playerid，ix)
Lua
 

SmoothMoveTo

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
time:number执行时间(需大于0)
x:number横坐标值
y:number竖坐标值
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 元件平滑移动到指定位置
具体使用案例如下：
local code  = Customui:SmoothMoveTo(playerid, uiid, elementid, time, x, y)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SmoothMoveBy

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
time:number执行时间(需大于0)
x:number横向距离
y:number竖向距离
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 元件平滑移动相对距离
具体使用案例如下：
local code  = Customui:SmoothMoveBy(playerid, uiid, elementid, time, x, y)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SmoothScaleTo

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
time:number执行时间(需大于0)
w:number宽度
h:number高度
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 元件平滑改变到指定宽度和高度
具体使用案例如下：
local code  = Customui:SmoothScaleTo(playerid, uiid, elementid, time, w, h)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SmoothScaleBy

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
time:number执行时间(需大于0)
w:number宽度
h:number高度
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 元件平滑改变相对宽度和高度
具体使用案例如下：
local code  = Customui:SmoothScaleBy(playerid, uiid, elementid, time, w, h)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SmoothRotateTo

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
time:number执行时间(需大于0)
angle:number角度值
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 元件平滑旋转到指定角度
具体使用案例如下：
local code  = Customui:SmoothRotateTo(playerid, uiid, elementid, time, angle)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SmoothRotateBy

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
time:number执行时间(需大于0)
angle:number角度值
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 元件平滑旋转到相对角度
具体使用案例如下：
local code  = Customui:SmoothRotateBy(playerid, uiid, elementid, time, angle)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

PlayElementAnim

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
animid:number动画ID
time:number单次时长(需大于0)
mode:number播放模式循环1单次2(VIEDOPLAYMODE)VIEDOPLAYMODE
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 元件播放动画
具体使用案例如下：
local code  = Customui:PlayElementAnim(playerid, uiid, elementid, animid, time, mode)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

StopAnim

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 元件停止动画
具体使用案例如下：
local code  = Customui:StopAnim(playerid, uiid, elementid)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SetLoaderModel

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
modleid:string模型ID
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用：设置装载器的模型
具体使用案例如下：
local code  = Customui:SetLoaderModel(playerid, uiid, elementid, modleid)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SetLoaderModelScale

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
modlescale:number缩放大小
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用：设置装载器的模型缩放
具体使用案例如下：
local code  = Customui:SetLoaderModelScale(playerid, uiid, elementid, modlescale)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SetLoaderModelDir

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
yaw:number水平角度(角度制)
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用：设置装载器的模型方向
具体使用案例如下：
local code  = Customui:SetLoaderModelDir(playerid, uiid, elementid, yaw)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SetLoaderModelAct

参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
animid:number动画ID
playmode:number播放模式(ANIMMODE)
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用：设置装载器的模型动画
具体使用案例如下：
local code  = Customui:SetLoaderModelAct(playerid, uiid, elementid, animid, playmode)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

TurnSliderToPos

参数及类型：
playerid : number 玩家ID
uiid : string 界面ID
elementid : string 元件ID
x : number X坐标值
y : number Y坐标值
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用：滑动列表跳转到某位置
具体使用案例如下：
local code  = Customui:TurnSliderToPos(playerid, uiid, elementid, x, y)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SetSliderDir

参数及类型：
playerid : number 玩家ID
uiid : string 界面ID
elementid : string 元件ID
dir : number 滑动方式（0仅左右，1仅上下，2自由滑动）
返回值及类型：
code : number成功(ErrorCode.OK) ErrorCode
该方法的主要作用：设置滑动列表的滑动方式
具体使用案例如下：
local code  = Customui:SetSliderDir(playerid, uiid, elementid, dir)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SetSliderBarImg

参数及类型：
playerid : number 玩家ID
uiid : string 界面ID
elementid : string 元件ID
url : string 图片库链接
返回值及类型：
code : number成功(ErrorCode.OK) ErrorCode
该方法的主要作用：设置滑动条的图案
具体使用案例如下：
local code  = Customui:SetSliderBarImg(playerid, uiid, elementid, url)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SetProgressBarValue
参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
itype:number类型枚举（1最小值，2最大值，3当前值）
value:number值类型
返回值及类型：
ret:bool是否成功
该方法的主要作用： 设置玩家界面进度条的值
具体使用案例如下：
local ret  = Customui:SetProgressBarValue(playerid, uiid, elementid, itype, value)
if ret == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
SetProgressBarResId
参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
itype:number类型枚举（1背景，2进度条）
url:string图片ID
返回值及类型：
ret:bool是否成功
该方法的主要作用： 设置玩家界面进度条的纹理
具体使用案例如下：
local ret  = Customui:SetProgressBarResId(playerid, uiid, elementid, itype, url)
if ret == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
SmoothIncreaseProgress
参数及类型：
playerid:number玩家ID
uiid:string界面ID
elementid:string元件ID
time:number时长
ptype:number类型枚举（1增加，2减小，3变化至）
value:number变化的值
返回值及类型：
ret:bool是否成功
该方法的主要作用： 进度条文本平滑计时
具体使用案例如下：
local ret  = Customui:SmoothIncreaseProgress(playerid, uiid, elementid, time, ptype, value)
if ret == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua

目录
wiki
登录

容器接口：WorldContainer
 彼得兔
更新时间: 2023-04-26 10:21:02
具体函数名及描述如下:

序号	函数名	函数描述
1	addFurnace(...)	新增熔炉
2	removeFurnace(...)	移除熔炉
3	checkFurnace(...)	检测是否为熔炉
4	getFurnaceHeatPercent(...)	获取熔炉热度百分比
5	getFurnaceMeltPercent(...)	获取熔炉融化百分比
6	addStorageBox(...)	新增储物箱
7	removeStorageBox(...)	移除储物箱
8	checkStorage(...)	检测是否为储物箱
9	clearStorageBox(...)	清空储物箱
10	checkStorageEmptyGrid(...)	检测储物箱空余格子，传入道具ID则同时检测已存该道具的格子
11	setStorageItem(...)	设置储物箱道具
12	getStorageItem(...)	获取储物箱道具ID
13	addStorageItem(...)	给储物箱添加道具
14	removeStorageItemByID(...)	移除储物箱内指定类型的道具
15	removeStorageItemByIndex(...)	移除储物箱内指定格子的道具
16	addItemToContainer(...)	将一定数量道具添加到储物箱中
17	removeContainerItemByID(...)	移除储物箱内一定数量道具
18	clearContainer(...)	清空指定位置的储物箱
addFurnace
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：新增熔炉

具体使用案例如下：

--在(0,0)高度7生成熔炉
--参数为要生成熔炉的位置的坐标
WorldContainer:addFurnace(0,7,0)
--在聊天框显示
Chat:sendSystemMsg("在(0,0)高度7的位置生成了一个熔炉！")
Lua
removeFurnace
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：移除熔炉

具体使用案例如下：

--移除(0,0)高度7的熔炉(或其他方块)
--参数为要移除的熔炉(或其他方块)的坐标
WorldContainer:removeFurnace(0,7,0)
--在聊天框显示
Chat:sendSystemMsg("(0,0)高度7的位置的熔炉(或其他方块)被移除！")
Lua
checkFurnace
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：检测是否为熔炉

具体使用案例如下：

--判断(0,0)高度7的位置是不是熔炉，参数为要判断的位置的坐标
local result=WorldContainer:checkFurnace(0,7,0)
if result==0 then--如果是熔炉
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置是熔炉")
else--如果不是熔炉
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置不是熔炉")
end
Lua
getFurnaceHeatPercent
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
val:number百分比
该方法的主要作用：获取熔炉热度百分比

具体使用案例如下：

--获取(0,0)高度7的位置的熔炉燃料热量剩余百分比，参数为熔炉坐标
local result,val=WorldContainer:getFurnaceHeatPercent(0,7,0)
if result==0 then--如果获取成功
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置的熔炉燃料热量剩余百分比为："..val)
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("获取失败，可能(0,0)高度7的位置不是熔炉")
end
Lua
getFurnaceMeltPercent
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
val:number百分比
该方法的主要作用：获取熔炉融化百分比

具体使用案例如下：

--获取(0,0)高度7的位置的熔炉当前已烧制的百分比，参数为熔炉坐标
local result,val=WorldContainer:getFurnaceMeltPercent(0,7,0)
if result==0 then--如果获取成功
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置的熔炉当前已烧制的百分比为："..val)
else--如果获取失败
	--在聊天框显示
	Chat:sendSystemMsg("获取失败，可能(0,0)高度7的位置不是熔炉")
end
Lua
addStorageBox
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：新增储物箱

具体使用案例如下：

--在(0,0)高度7的位置生成一个储物箱，参数为要生成储物箱的坐标
WorldContainer:addStorageBox(0,7,0)
--在聊天框显示
Chat:sendSystemMsg("在(0,0)高度7的位置生成了一个储物箱！")
Lua
removeStorageBox
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：移除储物箱

具体使用案例如下：

--移除(0,0)高度7的箱子(或其他方块)
--参数为要移除的箱子(或其他方块)的坐标
WorldContainer:removeStorageBox(0,7,0)
--在聊天框显示
Chat:sendSystemMsg("(0,0)高度7的位置的箱子(或其他方块)被移除！")
Lua
checkStorage
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：检测是否为

储物箱

具体使用案例如下：

--判断(0,0)高度7的位置是不是箱子，参数为要判断的位置的坐标
local result=WorldContainer:checkStorage(0,7,0)
if result==0 then--如果是箱子
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置是箱子")
else--如果不是箱子
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置不是箱子")
end
Lua
clearStorageBox
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：清空储物箱

具体使用案例如下：

--清空指定坐标下箱子的物品，参数为要清空的箱子的坐标
WorldContainer:clearStorageBox(0,7,0)
--在聊天框显示
Chat:sendSystemMsg("清空了(0,0)高度7的箱子的物品")
Lua
checkStorageEmptyGrid
参数及类型：

x:number
y:number
z:number
itemid:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：检测储物箱空余格子，传入道具ID则同时检测已存该道具的格子

具体使用案例如下：

--判断(0,0)高度7的位置的储物箱有没有空余格子或指定物品
--前三个参数为要判断的箱子的坐标
--最后一个参数为要判断的物品id，0代表空余格子
local result=checkStorageEmptyGrid(0,7,0,0)
if result==0 then--如果有
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置的储物箱还有空余格子")
else--如果没有
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置的储物箱没有空余格子")
end
--判断有没有基岩，id为1
result=checkStorageEmptyGrid(0,7,0,1)
if result==0 then--如果有
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置的储物箱里有地心基石")
else--如果没有
	--在聊天框显示
	Chat:sendSystemMsg("(0,0)高度7的位置的储物箱没有地心基石")
end
Lua
setStorageItem
参数及类型：

x:number
y:number
z:number
offset:number仓库格子索引
itemid:number
num:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：设置储物箱道具

具体使用案例如下：

--设置指定位置的箱子的指定格子的物品
--前三个参数为要设置的箱子的坐标
--第四个参数0为指定格子的序号，0为第一个格子
--第五个参数为要放置的物品id，101为土块
--最后一个参数为要放置的物品数量
WorldContainer:setStorageItem(0,7,0,0,101,30)
--在聊天框显示
Chat:sendSystemMsg("(0,0)高度7的位置的箱子第一格，被放置了30个土块")
Lua
getStorageItem
参数及类型：

x,y,z:number储物箱位置
offset:number仓库格子索引
返回值及类型：

ErrorCode.OK
itemid:number道具ID
itemNum:number道具数量
该方法的主要作用：获取储物箱道具ID

具体使用案例如下：

--获取指定坐标下的箱子指定格子的物品id和数量
--前三个参数为箱子坐标
--最后一个参数为格子序号，0为第一格
local result,itemid,itemNum=WorldContainer:getStorageItem(0,7,0,0)
--在聊天框显示
Chat:sendSystemMsg("(0,0)高度7的位置的箱子的第一个格子，有"..itemNum.."个id为"..itemid.."的物品")
Lua
addStorageItem
参数及类型：

x,y,z:number储物箱位置
itemid:number
num:number道具数量
返回值及类型：

ErrorCode.OK
relNum:number成功添加数量
该方法的主要作用：给储物箱添加道具

具体使用案例如下：

--在指定坐标的箱子里添加指定物品
--前三个参数为箱子坐标
--第四个参数为要添加的物品的id，101为土块
--最后一个参数为要添加的数量
local result,relNum=WorldContainer:addStorageItem(0,7,0,101,99)
--在聊天框显示
Chat:sendSystemMsg("尝试在(0,0)高度7位置的箱子里添加99个土块，实际添加了"..relNum.."个")
Lua
removeStorageItemByID
参数及类型：

x,y,z:number储物箱位置
itemid:number道具类型ID
num:number道具数量
返回值及类型：

ErrorCode.OK
该方法的主要作用：移除储物箱内指定类型的道具

具体使用案例如下：

--移除指定坐标下箱子的指定物品
--前三个参数为箱子坐标
--第四个参数为要移除的物品id，101是土块
--最后一个参数为要移除的数量
WorldContainer:removeStorageItemByID(0,7,0,101,10)
--在聊天框显示
Chat:sendSystemMsg("移除了(0,0)高度7位置的箱子里的10个土块")
Lua
removeStorageItemByIndex
参数及类型：

x,y,z:number储物箱位置
offset:number储物箱格子索引，从0开始
num:number道具数量
返回值及类型：

ErrorCode.OK
该方法的主要作用：移除储物箱内指定格子的道具

具体使用案例如下：

--移除指定坐标下箱子的指定格子的物品
--前三个参数为箱子坐标
--第四个参数为要移除的格子序号，0是第一格
--最后一个参数为要移除的数量
WorldContainer:removeStorageItemByIndex(0,7,0,0,5)
--在聊天框显示
Chat:sendSystemMsg("把(0,0)高度7的位置的箱子里第一格的物品移除了5个")
Lua
addItemToContainer
参数及类型：

x,y,z:number储物箱位置
itemid:number
num:number道具数量
返回值及类型：

ErrorCode.OK
relNum:number成功添加数量
该方法的主要作用：将一定数量道具添加到储物箱中

具体使用案例如下：

--在指定坐标的箱子里添加指定物品
--前三个参数为箱子坐标
--第四个参数为要添加的物品的id，101为土块
--最后一个参数为要添加的数量
local result,relNum=WorldContainer:addItemToContainer(0,7,0,101,99)
--在聊天框显示
Chat:sendSystemMsg("尝试在(0,0)高度7位置的箱子里添加99个土块，实际添加了"..relNum.."个")
Lua
removeContainerItemByID
参数及类型：

x,y,z:number储物箱位置
itemid:number道具类型ID
num:number道具数量
返回值及类型：

ErrorCode.OK
该方法的主要作用：移除储物箱内一定数量道具

具体使用案例如下：

--移除指定坐标下箱子的指定物品
--前三个参数为箱子坐标
--第四个参数为要移除的物品id，101是土块
--最后一个参数为要移除的数量
WorldContainer:removeContainerItemByID(0,7,0,101,10)
--在聊天框显示
Chat:sendSystemMsg("移除了(0,0)高度7位置的箱子里的10个土块")
Lua
clearContainer
参数及类型：

x:number
y:number
z:number
返回值及类型：

ErrorCode.OK
该方法的主要作用：清空指定位置的储物箱

具体使用案例如下：

--清空指定坐标下箱子的物品，参数为要清空的箱子的坐标
WorldContainer:clearContainer(0,7,0)
--在聊天框显示
Chat:sendSystemMsg("清空了(0,0)高度7的箱子的物品")
Lua
 


目录
wiki
登录

显示板管理接口：DisPlayBoard
 迷你世界
更新时间: 2023-04-26 10:21:14
具体函数名及描述如下:

序号 	函数名	函数描述
1	showBoard(...) 	对玩家显示显示板
2	hideBoard(...)	对玩家隐藏显示板
3	setBoardPicture	对玩家设置显示板的图片
 

showBoard

参数及类型：
playerid:number玩家ID
boardid:number显示板ID
返回值及类型：
ErrorCode.OK
该方法的主要作用：对玩家显示显示板
具体使用案例如下：
local result = DisPlayBoard:showBoard(playerid, boardid)
Lua
 

hideBoard

参数及类型：
playerid:number玩家ID
boardid:number显示板ID
返回值及类型：
ErrorCode.OK
该方法的主要作用：对玩家隐藏显示板
具体使用案例如下：
local result = DisPlayBoard:hideBoard(playerid, boardid)
Lua
 

setBoardPicture

参数及类型：
playerid:number玩家ID
boardid:number显示板ID
pictureid:string图片ID
返回值及类型：
ErrorCode.OK
该方法的主要作用：对玩家设置显示板的图片
具体使用案例如下：
local result = DisPlayBoard:setBoardPicture(playerid, boardid, pictureid)
Lua

目录
wiki
登录

云服数据存储接口：CloudSever
 迷你世界
更新时间: 2024-04-28 19:09:10
具体函数名及描述如下：

序号 	函数名 	函数描述
1	setOrderDataBykey(...)	设置排行榜中指定键的数值
2	removeOrderDataByKey(...)	删除排行榜中指定键的数值
3	getOrderDataByKeyEx(...)	获取排行榜中指定键的数值
4	getOrderDataIndexValueEx(...)	获取排行榜中指定排名的数值
5	ClearOrderData(...)	清理排行榜
6	automaticByKey(...)	变量自运算
7	getOrderDataIndexAreaEx(...)	
获取排行榜中多条数据

(一次最多100条数据)

8	getOrderDataValueAreaEx(...)	
获取排行榜中指定值区域的前多少名数据

(一次最多100条数据)

9	setDataListBykey(...)	设置表中指定键的值
10	removeDataListByKey(...)	删除表中指定键的值
11	getDataListByKeyEx(...)	获取表中指定键的值
12	ClearDataList(...)	清空表数据
13	getlistCache(...)	获取表或排行榜当前缓存数据
14	UpdateDataListByKey(...)
安全更新数据
15	SendSeverMsg(...)
发送服务通知消息
16	TransmitToMap(...)
传送玩家到指定地图
17	TransmitToRoom(...)
传送玩家到指定房间
18	TransmitOtherRoom(...)
传送玩家其他房间
19	GetRoomID(...)
获取当前云服房间ID
20	TransmitToCategoryRoom(...)
传送玩家到指定分类房间
21	SetForbidJoin(...)
当前房间停止进入玩家（仅云服生效）
22	CloseCurRoom(...)
关闭当前房间（仅云服生效）
23	GetRoomCategory(...)	获取当前房间的分类信息（仅云服生效）
 

setOrderDataBykey

参数及类型：
libvarname:string排行榜变量设计名
key:string获取的键值
value:number设置的数值
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 设置排行榜中指定键的数值
具体使用案例如下：
local libvarname = 'rank_1'
local ret = CloudSever:setOrderDataBykey(libvarname,"key1",1)
if ret == ErrorCode.OK then
    print('设置排行榜值成功 k = key1 ,v = 1')
else
    print('设置排行榜值失败')
end
Lua
 

removeOrderDataByKey

参数及类型：
libvarname:string排行榜变量设计名
key:string获取的键值
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 删除排行榜中指定键的数值
具体使用案例如下：
local libvarname = 'rank_1'
local ret = CloudSever:removeOrderDataByKey(libvarname,"key1")
if ret == ErrorCode.OK then
    print('删除排行榜数据成功')
else
    print("删除排行榜数据失败")
end
Lua
 

getOrderDataByKeyEx

参数及类型：
libvarname:string排行榜变量设计名
key:string获取的键值
callback:function更新回调(function(code/错误码 ...)0成功1失败2数据不存在)
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 获取排行榜中指定键的数值
具体使用案例如下：
local callback = function (ret,k,v,ix) -- 返回结果不一定有排名
    if ret == ErrorCode.OK then
        if ix then
            print('返回数据成功 键= '..k..' 值='..v..' 排名='..ix )
        else
            print('返回数据成功 键= '..k..' 值='..v)
        end
    else
        if ret == 2 then --=不存在数据
            print('数据不存在')
        else
            print('获取失败')
        end
    end
end
local libvarname = 'rank_1'
local ret = CloudSever:getOrderDataByKeyEx(libvarname,"key1",callback)
if ret == ErrorCode.OK then
    print('请求排行榜数据成功')
else
    print("请求排行榜数据失败")
end
Lua
 

getOrderDataIndexValueEx

参数及类型：
libvarname:string排行榜变量设计名
index:number获取数据的名次
callback:function更新回调(function(code/错误码 ...)0成功1失败2数据不存在)
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 获取排行榜中指定排名的数值
具体使用案例如下：
local callback = function (ret,k,v,ix)
    if ret == ErrorCode.OK then
        print('返回数据成功 键= '..k..' 值='..v..' 排名='..ix )
    else
        if ret == 2 then --=不存在数据
            print('数据不存在')
        else
            print('获取失败')
        end
    end
end
local libvarname = 'rank_1'---4
local ret = CloudSever:getOrderDataIndexValueEx(libvarname,1,callback) -- 请求第1名的数据
if ret == ErrorCode.OK then
    print('请求排行榜数据成功')
else
    print("请求排行榜数据失败")
end
Lua
 

ClearOrderData

参数及类型：
libvarname:string排行榜变量设计名
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 清理排行榜
具体使用案例如下：
local libvarname = 'rank_1'
local ret = CloudSever:ClearOrderData(libvarname) -- 清空排行榜
if ret == ErrorCode.OK then
    print('清空排行榜值成功')
else
    print('清空排行榜值失败')
end
Lua
 

automaticByKey

参数及类型：
libvarname:string排行榜变量设计名
key:string获取的键值
value:number每次加的值
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 变量自运算
具体使用案例如下：
local libvarname = 'rank_1'
local value = 10
local ret = CloudSever:automaticByKey(libvarname,"key1",value) -- 设置自运算值加10
if ret == ErrorCode.OK then
    print('设置排行榜值成功 k = key1 ,v = 1')
else
    print('设置排行榜值失败')
end
Lua
 

getOrderDataIndexAreaEx

参数及类型：
libvarname:string排行榜变量设计名
icount:number获取数据的条数
callback:function更新回调(function(code/错误码 ...)0成功1失败2数据不存在)
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
callback返回数据格式示例：
本地：
{
    {
        -- 玩家1迷你号，string类型
        k = [[1000]],
        -- 玩家1排行榜数值，number类型
        v = 1
    },
    {
        -- 玩家2迷你号，string类型
        k = [[1001]],
        -- 玩家2排行榜数值，number类型
        v = 3
    }
    -- 更多玩家数据依次类推
}
-- 本地返回的数据格式示例
Lua
云服：
{
    {
        -- 玩家1迷你号，string类型
        k = [[1000]],
        -- 玩家1排行榜数值，number类型
        v = 1,
        -- 玩家1昵称，string类型
        nick = [[迷你队长]]
    },
    {
        -- 玩家2迷你号，string类型
        k = [[1001]],
        -- 玩家2排行榜数值，数值类型
        v = 3,
        -- 玩家2昵称，string类型
        nick = [[迷你策划 Max]]
    }
    -- 更多玩家数据依次类推
}
-- 云服返回的数据格式示例
Lua
该方法的主要作用： 获取排行榜中多条数据(一次最多100条数据)
具体使用案例如下：
--百人排行榜展示例子
local libvarname = 'rank_1'--排行榜名称
local reqcount = 100 --榜单上线
local refreshdt = 10 --首次请求间隔
local updatetime = 0 --当前更新时间
local RankInfos = {}
local function func_runtime(param)
    local curtime = os.time()
    if curtime - updatetime > refreshdt then
        updatetime = curtime
        local tmfos = {}
        local callback = function (ret,value) -- 返回结果不一定有排名
            if ret == ErrorCode.OK and value then
                refreshdt = 1200 --刷新时间修改
                for ix,  v in pairs(value) do
                    table.insert(tmfos,v)
                end
                if #tmfos == reqcount or #tmfos > #RankInfos then
                    RankInfos = tmfos
                end
            end
        end
        local ret = CloudSever:getOrderDataIndexAreaEx(libvarname,reqcount,callback)
        if ret == ErrorCode.OK then
            print('请求排行榜数据成功')
        else
            print("请求排行榜数据失败")
        end
    end
end
ScriptSupportEvent:registerEvent('Game.RunTime', func_runtime)
local RankUI  = "7275576434651487802" -- 填入UIID
local RefishTxt =
{
    -- {"名次",'昵称','分数'}的元件ID,
    {"7275576434651487802_1",'7275576434651487802_2','7275576434651487802_3'},
}
local PageItemCount = #RefishTxt
local AllUserinfo = {}
local function RankRefish(uin)
    if not AllUserinfo[uin] then AllUserinfo[uin] = 0 end
    print(AllUserinfo[uin])
    local istr = AllUserinfo[uin]*PageItemCount + 1
    if istr > #RankInfos  then return end
    for i = 1, PageItemCount, 1 do
        if RefishTxt[i] then
            if istr <= #RankInfos  then
                Customui:setText(uin,RankUI,RefishTxt[i][1],tostring(istr))
                Customui:setText(uin,RankUI,RefishTxt[i][2],tostring(RankInfos[istr].nick or RankInfos[istr].k))
                Customui:setText(uin,RankUI,RefishTxt[i][3],tostring(RankInfos[istr].v))
                istr = istr + 1
            else
                Customui:setText(uin,RankUI,RefishTxt[i][1],"")
                Customui:setText(uin,RankUI,RefishTxt[i][2],"")
                Customui:setText(uin,RankUI,RefishTxt[i][3],"")
            end
        end
    end
end
local function func_openui(e)
    if #RankInfos > 0 and e.CustomUI == RankUI then
        local uin = e.eventobjid
        AllUserinfo[uin] = 0
        RankRefish(uin)
    end
end
ScriptSupportEvent:registerEvent('UI.Show', func_openui)
--[[
--翻页功能
local pageupele = "7275576434651487802_7" -- 填入向上翻页按钮节点
local pagedownele = "7275576434651487802_8"-- 填入向下翻页按钮节点
local function func_page(e)
    local uin = e.eventobjid
    if  uin and  e.btnelenemt then
        if e.btnelenemt ==  pageupele then
            if not AllUserinfo[uin] then AllUserinfo[uin] = 0 end
            AllUserinfo[uin] =  AllUserinfo[uin] + 1
            if AllUserinfo[uin] > math.ceil(#RankInfos / PageItemCount )  then AllUserinfo[uin] = math.ceil(#RankInfos / PageItemCount) return end
            RankRefish(uin)
        elseif e.btnelenemt ==  pagedownele then
            if not AllUserinfo[uin] then AllUserinfo[uin] = 0 end
            AllUserinfo[uin] =  AllUserinfo[uin] -  1
            if AllUserinfo[uin] < 0  then AllUserinfo[uin] = 0 return end
            RankRefish(uin)
        end
    end
end
ScriptSupportEvent:registerEvent('UI.Button.Click', func_page)
]]--
Lua
 

getOrderDataValueAreaEx

参数及类型：
libvarname:string排行榜变量设计名
icount:number获取数据的条数
minvalue:number最小值
maxvalue:number最大值
callback:function更新回调(function(code/错误码...)0成功1失败)
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 获取排行榜中指定值区域的前多少名数据(一次最多100条数据)
具体使用案例如下：
local callback = function (ret,value)
    if ret == ErrorCode.OK and value then
        for ix,  v in pairs(value) do
            local txt = '第'.. ix..'名'..'键 = ' ..v.k..'值 = '..v.v
            print(txt)
        end
    end
end
local libvarname = 'rank_1'
local ret  = CloudSever:getOrderDataValueAreaEx(libvarname,-2,50,200,callback) -- 请求值是50 - 200的从大到小排序的前2名的数据
if ret == ErrorCode.OK then
    print('请求排行榜数据成功')
else
    print("请求排行榜数据失败")
end
Lua
 

setDataListBykey

参数及类型：
libvarname:string表变量设计名
key:string获取的键值
value:Any任意值(number,string,table)
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 设置表中指定键的值
具体使用案例如下：
local libvarname = 'list_1'
local ret = CloudSever:setDataListBykey(libvarname,"key1.score",1)
if ret == ErrorCode.OK then
    print('设置排行榜值成功 k = key1 ,v = 1')
else
    print('设置排行榜值失败')
end
Lua
 

removeDataListByKey

参数及类型：
libvarname:string表变量设计名
key:string获取的键值
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 删除表中指定键的值
具体使用案例如下：
local libvarname = 'list_1'
local ret = CloudSever:removeDataListByKey(libvarname,"key1.score") --获取key1的分数
if ret == ErrorCode.OK then
    print('请求删除排行榜数据成功')
else
    print("请求删除排行榜数据失败")
end
Lua
 

getDataListByKeyEx

参数及类型：
libvarname:string表变量设计名
key:string获取的键值
callback:function更新回调(function(code/错误码...)0成功1失败2数据不存在)
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 获取表中指定键的值
具体使用案例如下：
local callback = function (ret,k,v)
    if ret == ErrorCode.OK then
        print('获取数据成功 键= '..k..' 值='..v)
    else
        if ret == 2 then --=不存在数据
            print('数据不存在')
        else
            print('获取失败')
        end
    end
end
local libvarname = 'list_1'
local ret = CloudSever:getDataListByKeyEx(libvarname,"key1.score",callback) --获取key1的分数
if ret == ErrorCode.OK then
    print('请求排行榜数据成功')
else
    print("请求排行榜数据失败")
end
Lua
 

ClearDataList

参数及类型：
libvarname:string表变量设计名
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 清空表数据
具体使用案例如下：
local libvarname = 'list_1'
local ret = CloudSever:ClearDataList(libvarname)
if ret == ErrorCode.OK then
    print('清空表成功')
else
    print('清空表失败')
end
Lua
 

getlistCache

参数及类型：
libvarname:string表变量设计名
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 获取表或排行榜当前缓存数据
具体使用案例如下：
local libvarname = 'list_1'
local ret,values = CloudSever:getlistCache(libvarname)
if ret == ErrorCode.OK then
    print('获取数据成功')
else
    print('获取数据失败')
end
Lua
 

UpdateDataListByKey

参数及类型：
libvarname:string表变量设计名
key:string更新的键值
callback:function更新回调(function(code/错误码...))
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 安全更新数据
具体使用案例如下：
local callback = function (ret,key,value)
    -- ret 0 很遗憾，数据冲突了，
    -- 需要根据带回来的最新value进行逻辑处理后返回给底层重试
    if ret == 0 then
        print("有冲突，这是数据库里最新的值" , value)
        --逻辑处理
        value = value + 1
        --返回给底层重试
        return value
    -- ret 2 修改成功啦
    elseif ret == 2 then
        print("成功，更新后的值 " , value)
    end
  end
  local ret = CloudSever:UpdateDataListByKey('list','score',callback)
  if ret == ErrorCode.OK then
  end
Lua
 

SendSeverMsg

参数及类型：
msg:string消息名称
customdata:any消息附带参数
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 发送服务通知消息
具体使用案例如下：
--派发自定义事件
local function func_event(param)
    local data = {id = 123,ops = "aaa"} --自定义事件带入的参数
    local ok, json = pcall(JSON.encode, JSON, data) --转换成json格式
    CloudSever:SendSeverMsg("customevent",{customdata = json}) -- 发送云服消息广播
end
ScriptSupportEvent:registerEvent('Player.PlayAction', func_event)
--云服消息广播监听
local function func_event(param)
    print(param) --打印自定义事件参数
end
ScriptSupportEvent:registerEvent('customevent', func_event)
Lua
 

TransmitToMap

参数及类型：
playerid:uin玩家UIN或玩家uin的数组
mapid:number地图ID
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 传送玩家到指定地图
具体使用案例如下：
local ret  = CloudSever:TransmitToMap(playerid, mapid)
if ret == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

TransmitToRoom

参数及类型：
playerid:uin玩家UIN或玩家uin的数组
roomid:string房间ID
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 传送玩家到指定房间
具体使用案例如下：
local ret  = CloudSever:TransmitToRoom(playerid, roomid)
if ret == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

TransmitOtherRoom

参数及类型：
playerid:玩家UIN或玩家uin的数组
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 传送玩家到其他房间
具体使用案例如下：
local ret  = CloudSever:TransmitOtherRoom(playerid)
if ret == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

GetRoomID

参数及类型： 无
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
roomid:string房间ID
该方法的主要作用： 获取当前云服房间ID
具体使用案例如下：
local ret ,roomid = CloudSever:GetRoomID()
if ret == ErrorCode.OK then
    print('执行成功' ,roomid )
else
    print('执行失败')
end
Lua
 

TransmitToCategoryRoom

参数及类型：
playerid:uin玩家UIN或玩家uin的数组
roomtype:string分类ID(数值和字符串组合)
mapid:string地图ID
返回值及类型：
ret:number成功(ErrorCode.OK)ErrorCode
该方法的主要作用： 传送玩家到指定分类房间
具体使用案例如下：
local ret  = CloudSever:TransmitToCategoryRoom(playerid, roomtype, mapid)
if ret == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

SetForbidJoin

参数及类型：
seconds:number倒计时事件（小于等于零立即生效，默认0）
返回值及类型：
code:number成功(ErrorCode.OKErrorCode
该方法的主要作用： 当前房间停止进入玩家（仅云服生效）
具体使用案例如下：
local code  = CloudSever:SetForbidJoin(seconds)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

CloseCurRoom

参数及类型：
countdown:number倒计时事件（小于等于零立即生效，默认0）
msg:string提示语
返回值及类型：
code:number成功(ErrorCode.OKErrorCode
该方法的主要作用： 关闭当前房间（仅云服生效）
具体使用案例如下：
local code  = CloudSever:CloseCurRoom(countdown, msg)
if code == ErrorCode.OK then
    print('执行成功'  )
else
    print('执行失败')
end
Lua
 

GetRoomCategory

参数及类型：无
返回值及类型：
code:number成功(ErrorCode.OK)ErrorCode
msg:string分类信息
该方法的主要作用： 获取当前房间的分类信息（仅云服生效，和传送到指定分类房间接口配合使用）
具体使用案例如下：
local code ,msg = CloudSever:GetRoomCategory()
if code == ErrorCode.OK then
    print('执行成功' ,msg )
else
    print('执行失败')
end
Lua

目录
wiki
登录

学习案例
 彼得兔
更新时间: 2024-04-26 16:50:31
示例1：

游戏开始，角色附近每隔10秒随机刷新一批怪物，怪物生存时间是10秒，玩家需要击杀10只野人，则游戏胜利，弹出胜利界面

local ActorId = 3102
local obj_ids = {} --怪物id表
local def_count = 0 --击败次数
local mob_count = 5 --怪物数量
local function SpawnMonsters()
	local ret, x, y, z = Player:getPosition()
	for idx = 1, mob_count do --生成怪物ID
		local newX = math.random(-5, 5) + x
		local newZ = math.random(-5, 5) + z
		local ret, objids = World:spawnCreature(newX, y, newZ, ActorId)
		if ret == ErrorCode.OK then
			obj_ids[#obj_ids+1] = objids[1]
			obj_ids[#obj_ids+1] = objids[2]
		end
	end
end
local function ClearMonsters()
	if #obj_ids == 0 then return end
	for idx = 1, #obj_ids do
		World:despawnCreature(obj_ids[idx])
	end
	obj_ids = {}--将ID表清空
end

Game_Start = function()
	local ret, timerId = MiniTimer:createTimer("计时X")
	if ret == ErrorCode.OK then --启动计时器
		MiniTimer:startForwardTimer(timerId)
		SpawnMonsters()
	end
end

Timer_Change = function(event_args)
	local timerid = event_args['timerid']
	local ret, secs = MiniTimer:getTimerTime(timerid)
	if ret == ErrorCode.OK then
		if math.fmod(secs, 10) == 0 then
			ClearMonsters() --每隔10秒刷新下怪物
			SpawnMonsters()
		end
	end
end

Defeat_Actor = function(event_args)
	local toobjid = event_args['toobjid'] --被击败的目标ID
	local playerId = event_args['eventobjid']--玩家ID
	local ret, actorId = Creature:getActorID(toobjid)
	if ret==ErrorCode.OK and actorId==ActorId then
		def_count = def_count + 1
		Chat:sendSystemMsg("杀怪数量:"..def_count)
		if def_count == 10 then
			local win = TEAM_RESULTS.TEAM_RESULTS_WIN
			local result = Player:setGameResults(playerId, win)
			if result == ErrorCode.OK then
				Game:doGameEnd() --游戏结束
			end
		end
	end
end

ScriptSupportEvent:registerEvent([=[Game.Start]=], Game_Start)
ScriptSupportEvent:registerEvent([=[minitimer.change]=], Timer_Change)
ScriptSupportEvent:registerEvent([=[Player.DefeatActor]=], Defeat_Actor)
Lua
示例2：

游戏开始后，玩家每走一步，就在自己的右前方放置一个石块（右侧或者旁边，很直观的能看到）

Player_MoveStep = function(event_args)
	local playerId = event_args['eventobjid']
	local ret, x, y, z = Player:getPosition()

	local ret, curdir = Player:getCurPlaceDir(playerId)
	if curdir == FACE_DIRECTION.DIR_NEG_X then x = x+2; z = z+2 end
	if curdir == FACE_DIRECTION.DIR_POS_X then x = x-2; z = z-2 end
	if curdir == FACE_DIRECTION.DIR_NEG_Z then z = z+2; x = x+2 end
	if curdir == FACE_DIRECTION.DIR_POS_Z then z = z-2; x = x-2 end
	Block:replaceBlock(104, x, y, z)
end
ScriptSupportEvent:registerEvent([=[Player.MoveOneBlockSize]=], Player_MoveStep)
Lua
示例3：

在场景中放置开关和灯，当玩家挖掉10个土块，电灯亮起

local x, y, z = 5, 7, 5 --信号灯的位置
Game_Start = function()
	-- 放置开关和信号灯
	local palyer_1 = Player:getHostUin()
	Player:setPosition(palyer_1, 0, 7, 0)
	local switchId, lightId = 724, 707
	Block:replaceBlock(lightId, x, y, z)
	Block:replaceBlock(switchId, x, y+1, z, 4)
	for idx= 1, 10 do -- 放置草块
		Block:replaceBlock(100, x+idx, y, z)
	end
end

local remove_count = 0
Block_Removed = function(event_args)
	local blockid = event_args['blockid']
	if blockid == 100 then --草块被破坏
		remove_count = remove_count + 1
		if remove_count == 10 then --将开关打开
			Block:setBlockSwitchStatus({x=x,y=y+1,z=z}, true)
		end
	end
end
ScriptSupportEvent:registerEvent([=[Game.Start]=], Game_Start)
ScriptSupportEvent:registerEvent([=[Block.Remove]=], Block_Removed)
Lua
 


目录
wiki
登录

脚本常见问题
 彼得兔
更新时间: 2024-05-22 17:54:44
在查阅开发者学院中的脚本API时，若有任何问题或建议，欢迎通过问卷进行反馈！【点我填写问卷】
1.Block中的data在什么地方使用
data使用有具体需求,此处不建议开发者使用。开发者尽可能使用已封装过的没有data的新接口

 

 
2.自定义的Block和Item应该如何获取ID (或 data?)(用于 setBlock、spawnItem 等)
有两种办法可以获取到自定义类型的ID，<1>使用手持触发器去点击获取 <2>依赖相关的触发事件去打印ID 比如，如果是自定义的方块或者生物，可以将其放置在地图里然后用手持触发器去点击获取信息，也可以通过触发相关事件去打印出ID。 代码示例如下：

Callback_ClickBlock = function(event_args)
   local blockid = event_args['blockid']
   Chat:sendSystemMsg('点击的方块ID为'..blockid)
end
ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], Callback_ClickBlock)
Lua
 

 

3.Block 接口中的 setBlockAllForNotify/setBlockAllForUpdate 方法的参数 flag 需要更多信息
setBlockAllForNotify/setBlockAllForUpdate方法中的flag和data参数对开发者来说都是不可用的，新版wiki描述上已修正

 

 

4.ObjectLib 方法里的 uuid 该如何获取
目前开发者暂时没法直接获取到，我们会在下一版里迭代更新，详情请关注更新通知

 

 

5.World:playSoundEffectOnPos 方法的 soundId 参数需要更多信息
最新一期Wiki会放出soundId[2]表，与触发器内的音效库同步

 

 

6.World 类中可否提供一个获取有所有 Actor 的方法，或者历遍其的方法 (非 World:getActorsByBox)
由于游戏机制及效率考虑的原因，此功能不给予提供。但我们会提供触发器生物库的ActorId[3]表

 

 

7.Event 需要更详细的用法及参数解释
Event即为开发者事件，是指玩家在游戏内进行了某些操作后触发的对应事件。比如玩家点击了某个方块， 这时就会触发玩家的点击方块事件，即名为"Player.ClickBlock"的事件，开发者只要注册监听该事件就能进行点击方块后的对应操作。 注册监听事件的方法如下：ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], function(event_args) ... end)。 而开发者事件在进行回调时会传回来一些对应的参数，每个开发者事件对应的参数可参考wiki中的事件系统[4]部分。

 

 

8.UI 接口中的 setGBattleUI/setShapeLine/setShapeCircle 方法的参数 name 及 uiname 需要更多信息
1)setGBattleUI方法的参数name是string类型的枚举值，可选值有如下几种情况:

name	value type	value describe
'left_title'	string	左标题（第1）
'right_title'	string	右标题（/40）
'left_desc'	string	左描述（大吉大利，我是第一）
'left_little_desc'	string	左简述（排名1）
'right_little_desc'	string	右简述（战胜4）
'battle_btn'	boolean	比分导航栏面板按钮显示
'result'	boolean	比赛结果显示
'result_bkg'	boolean	比赛结果底板显示
'reopen'	boolean	再来一局按钮显示
 

2)setShapeLine及setShapeCircle这两个接口目前暂时无效果，可不用理会。后面自定义用户界面(Custom UI)完成后可将其替代

 

 

9.UI:ShowScreenEffect 方法的 type 需要更多信息
该接口是用于显示屏幕特效，其中type的值为1表示speedline，2表示powerline，3表示fog

 

 

10.Game:addRenderGlobalEffect 方法的 path 参数需要更多信息
path即为全局特效的路径，目前可用的是path只有"particles/Fog.ent"，详情可参考范例集合[5]里面给出的例子

 

 

11.Game:getDefString 方法的 id 需要更多信息
不提倡开发者使用上述接口，鼓励开发者使用自己定义的字符串

 

 

12.Player:setActionAttrState 方法的 actionattr 参数需要更多信息
setActionAttrState是设置玩家特殊属性的状态(例如可移动、可攻击等)的接口，actionattr参数可参考PLAYERATTR_ENABLE[6]

 

 

13.Team 接口中的 teamid 参数需要更多信息
目前我们游戏中最多支持六个队伍，六个队伍的ID及颜色对应如下： 

  队伍	  对应颜色	 TeamID
 队伍1	 红色	 1
 队伍2	 蓝色	 2
 队伍3	 绿色	 3
 队伍4	 黄色	 4
 队伍5	 橙色	 5
 队伍6	 紫色	 6
 观战队	 无	 999
Team相关接口中，可以teamid使用-1表示全部队伍。玩家或生物如果不设置队伍的话默认teamid是为0，也是无队伍的一种

 

 

14.appendSpeed 接口中的x,y,z参数信息
该接口的参数x,y,z表示设定一个移动距离，需要传入整数。

案例：假设把Z设定为5，当执行一次该接口后，那么objid就会向+z轴移动5格的距离

写法：appendSpeed(objid,0,0,5)

 

 

15.getBlockPowerStatus 接口中的pos的使用方法
假设想判断坐标为（7、7、7）位置的方块通电状态

正确的写法：

local pos = {x=7,y=7,z=7}
Block:getBlockPowerStatus(pos)
Lua
常见错误写法：

local pos = {7,7,7}
Block:getBlockPowerStatus(pos)
Lua
 

 

16.UI接口为什么没有效果？
ui相关的接口暂时不能用，等后续更新。

 

 

17.如何让游戏开始5秒后，每隔5秒生成一批生物？
--5秒后开始刷怪 每隔5秒刷一次 坐标(0,7,0) 怪物id3400 生成5只
local function r(e)
    local t=e.second
    if t>5 and (t-20)%5==0 then
        World:spawnCreature(0,7,0,3400,5)
    end
end
ScriptSupportEvent:registerEvent("Game.RunTime",r)
Lua
 

 

18.游戏坐标(x,y,z)分别指什么？
x：横坐标，y：竖坐标，z：纵坐标；

（x，y，z）代表：坐标（x，z）高度y的位置，如图：



 

 

19.如何查看某个方块的坐标？
--点击方块显示坐标
local function f2(e)
    local x,y,z=math.floor(e.x),math.floor(e.y),math.floor(e.z)
    Chat:sendSystemMsg("( "..x.." , "..y.." , "..z.." )")
    print(x,y,z)
end
ScriptSupportEvent:registerEvent('Player.ClickBlock',f2)
Lua
 

 

20.输出的聊天框消息为什么会是星号(*)？
数字太多会被屏蔽，可以使用print输出，然后打开“测试”，在运行日志里查看：



 

 

21.可以自定义NPC的AI吗？
目前没有相关接口。可以使用插件里自带的一些AI。

 

 

22.为什么生成方块接口那么卡？
不要一次性生成太多方块，不同设备性能不同，一般尽量不要超过100。

 

 

23.如何修改玩家的血量和饱食度？或者跳跃高度、移动速度等属性？
使用Player:setAttr(uid,attr,value)接口。

 

 

24.如何不允许玩家放置某种特定方块？
--不允许放置的方块id为1
local function f3(e)
    if e.blockid==1 then
        Block:destroyBlock(e.x,e.y,e.z)
    end
end
ScriptSupportEvent:registerEvent('Block.PlaceBy',f3)
Lua
 

 

25.为什么我用脚本生成的生物，离一定距离的话，隔段时间就消失了？
这是bug，已经提交修复，等待后续更新。

 

 

26.如何在游戏开始30秒后，从(0,7,0)到(15,10,15)范围内随机生成一些生物？
--30:游戏开始30秒后 (0,7,0)和(15,10,15):生成范围 {{3400,5},{3401,6},{3402,7}}:生成的生物id和数量
local st=30
local x0,y0,z0=0,7,0
local x1,y1,z1=15,10,15
local actors={{3400,5},{3401,6},{3402,7}}
local function r(e)
    local t=e.second
    if t==st then
        local i=0
        for i=1,#actors do
            World:spawnCreature(math.random(x0,x1),math.random(y0,y1),math.random(z0,z1),actors[i][1],actors[i][2])
        end
    end
end
ScriptSupportEvent:registerEvent("Game.RunTime",r)
Lua
 

 

27.如何更改玩家模型？
修改状态插件，在“效果”里选择“更改玩家模型”。需要改模型的时候使用Actor:addBuff(objid,buffid,bufflv)接口给玩家添加这个状态即可。

 

 

28.能否让玩家在某个区域范围内，自动向前加速？
local x0,y0,z0=0,7,0
local x1,y1,z1=15,10,15
local function r()
    local r,n,ps=World:getAllPlayers(1)
    local i=0
    for i=1,n do
        local r2,x,y,z=Player:getPosition(ps[i])
        if x>x0 and x<x1 and y>y0 and y<y1 and z>z0 and z<z1 then
            local r3,dx,dy,dz=Actor:getFaceDirection(ps[i])
            Actor:appendSpeed(ps[i],dx/math.abs(dx+dz),0,dz/math.abs(dx+dz))
        end
    end
end
ScriptSupportEvent:registerEvent("Game.Run",r)
Lua
 

 

29.如何查看生物id？
--点击生物，输出id
local function c(e)
    local r,id=Creature:getActorID(e.toobjid)
    Chat:sendSystemMsg(id)
end
ScriptSupportEvent:registerEvent('Player.ClickActor',c)
Lua
 

 

30.如何清空玩家背包？
使用Backpack:clearAllPack(uid)接口。

 

 

31.为什么使用Player:setPosition(uid,x,y,z)接口，玩家会卡在虚空无法移动？
如果设置的坐标距离过远，不在玩家加载的区块范围内（视野范围），就会导致玩家卡在虚空。可以使用“复活玩家到指定坐标”代替，即Player:reviveToPos(uid,x,y,z)接口。

 

 

32.如何修改生物属性，比如血量、速度等？
使用Creature:setAttr(objid,attr,value)接口。

 

 

33.如何等待1秒后继续执行？
threadpool:wait(1)
Lua
 

 

34.如何在指定位置生成生物？
使用World:spawnCreature(x,y,z,actorid,num)接口。

 

 

35.如何攻击生物时，在生物头顶显示剩余血量？
local function Eath(e)
    local p,a=e.eventobjid,e.toobjid
    local r=Actor:isPlayer(a)
    if r~=0 then
        local r1,maxhp=Creature:getAttr(a,1)
        local r2,hp=Creature:getAttr(a,2)
        Actor:shownickname(a,true)
        Actor:setnickname(a,"#G"..math.floor(hp).."#R/"..math.floor(maxhp))
    end
end
ScriptSupportEvent:registerEvent('Player.AttackHit',Eath)
Lua
 

 

36.能否监听玩家放置生物蛋的事件？
可以，玩家放置生物蛋会触发“生物生成”事件。

 

 

37.如何实现玩家长按Shift加速？
监听“长按按键事件”，判断事件中的按键如果是Shift，就增加玩家速度。

 

 

38.如何获取玩家手持道具的id？
使用Player:getCurToolID(uid)接口。

 

 

39.为什么计时器窗口会消失？
打开背包后计时器的文字会消失，目前不能解决。可以把显示计时器放在“游戏运行”事件里。

 

 

40.如何设置玩家坐标？
使用Actor:setPosition(objid,x,y,z)或Player:setPosition(objid,x,y,z)接口。

 

 

41.能否在游戏运行中更改地图游戏人数上限？
不能。但是可以监听玩家进入游戏事件，然后判断当前游戏人数是否大于某个值，是的话就传送玩家到地图外面。

 

 

42.能否把玩家踢出游戏？
可以设置玩家游戏结果为负，或者在“游戏运行”事件里设置玩家坐标的高度为负，让玩家在地图下方无法移动。

 

 

43.为什么设置了方块无法被破坏，但还是会被炸掉？
目前“方块无法被破坏”无法避免炸弹、激光等的破坏，只能在插件设置方块抗性为-1，或者监听方块被破坏事件，破坏后重新生成。

 

 

44.玩家离开一定距离后，NPC会消失，这个bug可以解决吗？
已经提交，等待后续更新。目前可以改成“玩家进入区域，生成NPC；玩家离开区域，移除NPC”来代替。

 

 

45.如何改变生物模型？
目前没有这种接口。只能先移除再创建。

 

 

46.能否获取整个地图的生物数量？
无法获取整个地图的，但是可以获取指定区域的生物数量。

 

 

47.如何清除某个生物？
使用World:despawnCreature(objid)或Actor:killSelf(objid)接口。

 

 

48.能否获取指定坐标上的生物id？
不能从坐标获取生物。可以从范围获取，获取到的是整个区域内的生物。

 

 

49.如何让生物出现几秒后消失，如何再出现，一直循环？
as={}
function r2(e)
    if e.second%4==0 then
        _,as=World:spawnCreature(0,7,0,3400,5)
    elseif e.second%4==2 then
        for _,a in pairs(as) do
            World:despawnActor(a)
        end
    end
end
ScriptSupportEvent:registerEvent([=[Game.RunTime]=],r2)
Lua
 

 

50.能否移除家园宠物？
local function depet(e)
    local p,a=e.eventobjid,e.toobjid
    if Actor:isPlayer(p)==1001 then a=p end
    local _,id=Creature:getActorID(a)
    if id>10000 then
        World:despawnActor(a)
    end
end
ScriptSupportEvent:registerEvent([=[Player.ClickActor]=],depet)
ScriptSupportEvent:registerEvent([=[Actor.Collide]=],depet)
Lua
 

 

51.如何设置生物的队伍？
--玩家点击生物，设置生物队伍
--当点击生物时会执行此函数
local function Player_ClickActor(event)
	--设置生物所属的队伍
	--第一个参数为要设置的生物在存档中的id
	--第二个参数为要设置为的队伍id
	Creature:setTeam(event.toobjid,1)
	--在聊天框显示
	Chat:sendSystemMsg("objid为"..event.toobjid.."的生物被设置到了队伍1")
end
--注册监听器，点击生物时执行Player_ClickActor函数
ScriptSupportEvent:registerEvent([=[Player.ClickActor]=],Player_ClickActor)
Lua

目录
wiki
登录

接口常量列表
 彼得兔
更新时间: 2024-04-26 16:32:55
可在代码里直接调用无需新建对象，调用形式如下：

local errorCode = ErrorCode.OK
local worldType = WorldType.OWTYPE_GAMEMAKER
Lua
 

 
Lua原生数据类型
数据名称	用法描述
nil	表示一个无效值(在条件表达式中相当于false)
boolean	布尔值,包含两个值：false和true
number	实数,表示双精度类型的实浮点数,也可以是整数
string	字符串,由一对单引号或双引号来表示
table	Lua的一种数据结构，可用来创建不同的数据类型，如：数组、字典等
function	由 C 或 Lua 编写的函数
userdata	表示任意存储在变量中的C数据结构
thread	表示执行的独立线路，用于执行协同程序
 
错误码信息
名称	数值	用法描述
ErrorCode.OK	0	正确返回
ErrorCode.FAILED	1001	错误返回
 
存储栏起始位
名称	数值	用法描述
BPACK_SINDEX.BACKPACK_START_INDEX	0	背包栏
BPACK_SINDEX.SHORTCUT_START_INDEX	1000	快捷栏
BPACK_SINDEX.STORAGE_START_INDEX	3000	储物箱
BPACK_SINDEX.EQUIP_START_INDEX	8000	装备栏
 
游戏模式
名称	数值	用法描述
WorldType.OWTYPE_SINGLE	0	单人模式
WorldType.OWTYPE_CREATE	1	多人创造模式
WorldType.OWTYPE_EXTREMITY	2	极限模式
WorldType.OWTYPE_CREATE_RUNGAME	3	由创造模式转的生存
WorldType.OWTYPE_GAMEMAKER	4	自制玩法的编辑模式
WorldType.OWTYPE_GAMEMAKER_RUN	5	自制玩法的运行模式
WorldType.OWTYPE_FREEMODE	6	冒险模式之自由模式
WorldType.OWTYPE_RECORD	9	录像模式
 
游戏地形
名称	数值	用法描述
TerrainType.TERRAIN_FLAT	0	平坦地形
TerrainType.TERRAIN_NORMAL	1	随机地形
 
自定义视角编辑状态
名称	数值	用法描述
CameraEditState.CAMERA_EDIT_STATE_NULL	0	空
CameraEditState.CAMERA_EDIT_STATE_EDIT	1	编辑
CameraEditState.CAMERA_EDIT_STATE_TEST	2	测试
 
小地图绘图类型
名称	数值	用法描述
MAPMARK_TYPE.MMARK_LINE	0	线形标记
MAPMARK_TYPE.MMARK_RECTANGLE	1	矩形标记
MAPMARK_TYPE.MMARK_CIRCLE	2	圆形标记
 
装备部位类型
名称	数值	用法描述
EQUIP_SLOT_TYPE.EQUIP_HEAD	0	头
EQUIP_SLOT_TYPE.EQUIP_BREAST	1	身体
EQUIP_SLOT_TYPE.EQUIP_LEGGING	2	腿
EQUIP_SLOT_TYPE.EQUIP_SHOE	3	脚
EQUIP_SLOT_TYPE.EQUIP_PIFENG	4	披风
EQUIP_SLOT_TYPE.EQUIP_WEAPON	5	武器
EQUIP_SLOT_TYPE.MAX_EQUIP_SLOTS	6	---
 
附魔属性类型
名称	数值	用法描述
MODATTRIB_TYPE.MODATTR_MOVE_SPEED	0	移动速度
MODATTRIB_TYPE.MODATTR_SWIM_SPEED	1	游泳速度
MODATTRIB_TYPE.MODATTR_JUMP_SPEED	2	往上跳的速度
MODATTRIB_TYPE.MODATTR_ATTACK_PUNCH	3	近程攻击别人时加成的百分比
MODATTRIB_TYPE.MODATTR_ATTACK_RANGE	4	远程攻击别人时加成的百分比
MODATTRIB_TYPE.MODATTR_ATTACK_EXPLODE	5	爆炸攻击别人时加成的百分比
MODATTRIB_TYPE.MODATTR_ATTACK_FIRE	6	火攻击别人时加成的百分比
MODATTRIB_TYPE.MODATTR_ATTACK_POISON	7	毒攻击别人时加成的百分比
MODATTRIB_TYPE.MODATTR_ATTACK_WITHER	8	混乱攻击别人时加成的百分比
MODATTRIB_TYPE.MODATTR_ATTACK_PLAYER	9	攻击玩家时加成的百分比
MODATTRIB_TYPE.MODATTR_ATTACK_UNDEAD	10	攻击亡灵时加成的百分比
MODATTRIB_TYPE.MODATTR_ATTACK_ANIMAL	11	攻击动物别人时加成的百分比
MODATTRIB_TYPE.MODATTR_DAMAGED_PUNCH	12	被近程攻击时加成的百分比
MODATTRIB_TYPE.MODATTR_DAMAGED_RANGE	13	被远程攻击时加成的百分比
MODATTRIB_TYPE.MODATTR_DAMAGED_EXPLODE	14	被爆炸攻击时加成的百分比
MODATTRIB_TYPE.MODATTR_DAMAGED_FIRE	15	被火攻击时加成的百分比
MODATTRIB_TYPE.MODATTR_DAMAGED_POISON	16	被毒攻击时加成的百分比
MODATTRIB_TYPE.MODATTR_DAMAGED_WITHER	17	被混乱攻击时加成的百分比
MODATTRIB_TYPE.MODATTR_DAMAGED_FALLING	18	高处掉下伤害加成的百分比
MODATTRIB_TYPE.MODATTR_ARMOR_PUNCH	19	近程护甲加点
MODATTRIB_TYPE.MODATTR_ARMOR_RANGE	20	远程护甲加点
MODATTRIB_TYPE.MODATTR_ARMOR_EXPLODE	21	爆炸护甲加点
MODATTRIB_TYPE.MODATTR_DAMAGE_ABSORB	22	吸收伤害
MODATTRIB_TYPE.MODATTR_CRITICAL_HIT	23	暴击伤害加成
MODATTRIB_TYPE.MODATTR_KNOCK	24	增加攻击别人的击退距离
MODATTRIB_TYPE.MODATTR_KNOCK_RESIST	25	减少击退距离
MODATTRIB_TYPE.MODATTR_KNOCK_RESIST_PROB	26	击退概率抵抗值, 0.2表示有20%概率不被击退
MODATTRIB_TYPE.MODATTR_ACTOR_SCALE	27	角色大小 0 - 1.0 只针对玩家对象有效
MODATTRIB_TYPE.MAX_MOB_MODATTR	28	怪物 最大附魔属性
MODATTRIB_TYPE.MODATTR_DIG_SPEED	28	挖掘速度
MODATTRIB_TYPE.MODATTR_LUCK_DIG	29	挖掘幸运, 0.2表示增加20%掉落概率
MODATTRIB_TYPE.MODATTR_LUCK_KILLMOB	30	怪物掉落
MODATTRIB_TYPE.MODATTR_VIEW_BRIGHT	31	视野亮度 0 - 1.0
MODATTRIB_TYPE.MODATTR_OXYGEN_SUPPLY	32	氧气提供1:只能水底用， 100: 只能太空用， 101：都能用 10000:恢复氧气
MODATTRIB_TYPE.MAX_PLAYER_MODATTR	33	---
MODATTRIB_TYPE.MAX_MOD_ATTRIB	33	---
 
游戏战斗结果
名称	数值	用法描述
TEAM_RESULTS.TEAM_RESULTS_NONE	0	胜负未定
TEAM_RESULTS.TEAM_RESULTS_WIN	1	胜利
TEAM_RESULTS.TEAM_RESULTS_LOSE	2	失败
TEAM_RESULTS.TEAM_RESULTS_DOGFALL	3	平局
 
声音类型
名称	数值	用法描述
GSOUND_TYPE.GSOUND_DIG	0	挖掘
GSOUND_TYPE.GSOUND_DESTROY	1	破坏
GSOUND_TYPE.GSOUND_PLACE	2	放置
GSOUND_TYPE.GSOUND_FALLGROUND	3	摔落
GSOUND_TYPE.GSOUND_WALK	4	行走
 
生物身体特效
名称	数值	用法描述
ACTORBODY_EFFECT.BODYFX_HURT	0	---
ACTORBODY_EFFECT.BODYFX_FIRE	1	---
ACTORBODY_EFFECT.BODYFX_PORTAL	2	---
ACTORBODY_EFFECT.BODYFX_ACCUMFIRE	3	---
ACTORBODY_EFFECT.BODYFX_DRAGONFIRE	4	---
ACTORBODY_EFFECT.BODYFX_DRAGONSUMMON	5	---
ACTORBODY_EFFECT.BODYFX_TAME_SUCCEED	6	---
ACTORBODY_EFFECT.BODYFX_TAME_FAILED	7	---
ACTORBODY_EFFECT.BODYFX_TAME_FOOD	8	---
ACTORBODY_EFFECT.BODYFX_TAME_NOFOOD	9	---
ACTORBODY_EFFECT.BODYFX_AI_NEEDREEDS	10	---
ACTORBODY_EFFECT.BODYFX_FEAR	11	---
ACTORBODY_EFFECT.BODYFX_ROLECOLLECT	12	---
ACTORBODY_EFFECT.BODYFX_ROLEJUMP	13	---
ACTORBODY_EFFECT.BODYFX_DEADPROTECT	14	---
ACTORBODY_EFFECT.BODYFX_DRAGONDIE0	15	---
ACTORBODY_EFFECT.BODYFX_DRAGONDIE1	16	---
ACTORBODY_EFFECT.BODYFX_DRAGONDIE2	17	---
ACTORBODY_EFFECT.BODYFX_HORSE_FLY	18	---
ACTORBODY_EFFECT.BODYFX_DISAPPEAR	19	---
ACTORBODY_EFFECT.BODYFX_HORSE_BENTENG	20	---
ACTORBODY_EFFECT.BODYFX_DANCE	21	---
ACTORBODY_EFFECT.TOOLFX_JETPACK2	22	---
ACTORBODY_EFFECT.BODYFX_INTERACTION	23	---
ACTORBODY_EFFECT.HUDFX_HEADSHOT	24	---
ACTORBODY_EFFECT.HUDFX_NORMALSHOT	25	---
ACTORBODY_EFFECT.BODYFX_MILKING	26	---
ACTORBODY_EFFECT.BODYFX_AI_ANGRY	27	---
ACTORBODY_EFFECT.BODYFX_AI_SLEEP	28	---
ACTORBODY_EFFECT.BODYFX_TRANSPORT	29	---
ACTORBODY_EFFECT.BODYFX_FORBIDDEN	30	---
ACTORBODY_EFFECT.BODYFX_CONCEAL	31	潜行
ACTORBODY_EFFECT.BODYFX_WEAPON_FIRE	32	野人猎手武器上的火
ACTORBODY_EFFECT.BODYFX_DIZZY	33	眩晕
ACTORBODY_EFFECT.BODYFX_MAKETROUBLE	34	---
ACTORBODY_EFFECT.BODYFX_TRAINMOVE	35	火车移动
ACTORBODY_EFFECT.BODYFX_AI_HUNGRY	36	饥饿
ACTORBODY_EFFECT.BODYFX_BALL_CHARGE	37	蓄力踢球的特效
ACTORBODY_EFFECT.BODYFX_BALL_SHOOT_RELEASE	38	射球瞬间的爆发特效
ACTORBODY_EFFECT.BODYFX_ENCH_FALL	39	附魔速降
 
游戏实例类型
名称	数值	用法描述
OBJ_TYPE.OBJTYPE_PLAYER	1	玩家
OBJ_TYPE.OBJTYPE_CREATURE	2	生物(包含怪物、动物、NPC ，BOSS等)
OBJ_TYPE.OBJTYPE_DROPITEM	3	掉落物
OBJ_TYPE.OBJTYPE_MISSILE	4	投掷物
 
玩家背包类型
名称	数值	用法描述
BACKPACK_TYPE.SHORTCUT	1	快捷栏
BACKPACK_TYPE.INVENTORY	2	存储栏
BACKPACK_TYPE.EQUIP	3	装备栏
 
玩家朝向
名称	数值	用法描述
FACE_DIRECTION.DIR_NOT_INIT	-1	未指定
FACE_DIRECTION.DIR_NEG_X	0	X反方向
FACE_DIRECTION.DIR_POS_X	1	X正方向
FACE_DIRECTION.DIR_NEG_Z	2	Z反方向
FACE_DIRECTION.DIR_POS_Z	3	Z正方向
FACE_DIRECTION.DIR_NEG_Y	4	Y反方向
FACE_DIRECTION.DIR_POS_Y	5	Y正方向
 
生物属性枚举
名称	数值	用法描述
CREATUREATTR.MAX_HP	1	最大生命值
CREATUREATTR.CUR_HP	2	当前生命值
CREATUREATTR.HP_RECOVER	3	生命恢复
CREATUREATTR.MAX_HUNGER	5	最大饥饿值
CREATUREATTR.CUR_HUNGER	6	当前饥饿值
CREATUREATTR.MAX_OXYGEN	7	最大氧气值
CREATUREATTR.CUR_OXYGEN	8	当前氧气值
CREATUREATTR.RECOVER_OXYGEN	9	氧气恢复速度
CREATUREATTR.WALK_SPEED	10	移动速度
CREATUREATTR.RUN_SPEED	11	奔跑速度
CREATUREATTR.SWIN_SPEED	13	游泳速度
CREATUREATTR.JUMP_POWER	14	跳跃力
CREATUREATTR.WEIGHT	15	重量
CREATUREATTR.DODGE	16	闪避率
CREATUREATTR.ATK_MELEE	17	近战攻击
CREATUREATTR.ATK_REMOTE	18	远程攻击
CREATUREATTR.DEF_MELEE	19	近战防御
CREATUREATTR.DEF_REMOTE	20	远程防御
CREATUREATTR.DIMENSION	21	模型大小
CREATUREATTR.ATK_PHYSICAL 
 	物理攻击
CREATUREATTR.ATK_MAGIC 
 	元素攻击
CREATUREATTR.DEF_PHYSICAL 
 	物理防御
CREATUREATTR.DEF_MAGIC 
 	元素防御
 
生物属性设置
名称	数值	用法描述
CREATUREATTR.ENABLE_MOVE	1	可移动
CREATUREATTR.ENABLE_ATTACK	32	可攻击
CREATUREATTR.ENABLE_BEATTACKED	64	可被攻击
CREATUREATTR.ENABLE_BEKILLED	128	可被杀死
CREATUREATTR.ENABLE_PICKUP	256	可拾取道具
CREATUREATTR.ENABLE_DEATHDROPITEM	512	死亡掉落
 
生物行为枚举
名称	数值	用法描述
CREATUREMOTION.IDLE	1	空闲
CREATUREMOTION.STANDBY	2	待机
CREATUREMOTION.STROLL	3	闲逛
CREATUREMOTION.ATK_MELEE	4	近战攻击
CREATUREMOTION.ATK_REMOTE	5	远程攻击
CREATUREMOTION.FOLLOW	6	跟随
CREATUREMOTION.SWIM	7	游泳
CREATUREMOTION.RUN_AWAY	8	逃跑
CREATUREMOTION.SELF_BOMB	9	自爆
CREATUREMOTION.BEATTRACTED	10	被吸引
CREATUREMOTION.COPULATION	11	交配
 
玩家属性枚举
名称	数值	用法描述
PLAYERATTR.MAX_HP	1	最大生命值
PLAYERATTR.CUR_HP	2	当前生命值
PLAYERATTR.HP_RECOVER	3	生命恢复
PLAYERATTR.LIFE_NUM	4	生命数
PLAYERATTR.MAX_HUNGER	5	最大饥饿值
PLAYERATTR.CUR_HUNGER	6	当前饥饿值
PLAYERATTR.MAX_OXYGEN	7	最大氧气值
PLAYERATTR.CUR_OXYGEN	8	当前氧气值
PLAYERATTR.RECOVER_OXYGEN	9	氧气恢复速度
PLAYERATTR.WALK_SPEED	10	移动速度
PLAYERATTR.RUN_SPEED	11	奔跑速度
PLAYERATTR.SNEAK_SPEED	12	潜行速度
PLAYERATTR.SWIN_SPEED	13	游泳速度
PLAYERATTR.JUMP_POWER	14	跳跃力
PLAYERATTR.DODGE	16	闪避率
PLAYERATTR.ATK_MELEE	17	近战攻击
PLAYERATTR.ATK_REMOTE	18	远程攻击
PLAYERATTR.DEF_MELEE	19	近战防御
PLAYERATTR.DEF_REMOTE	20	远程防御
PLAYERATTR.DIMENSION	21	大小
PLAYERATTR.SCORE	22	分数
PLAYERATTR.LEVEL	23	星星等级
PLAYERATTR.CUR_STRENGTH	28	当前体力值
PLAYERATTR.MAX_STRENGTH	29	当前最大体力值
PLAYERATTR.STRENGTH_RECOVER	30	当前体力值恢复速度
PLAYERATTR.ATK_PHYSICAL 
 	物理攻击
PLAYERATTR.ATK_MAGIC 
 	元素攻击
PLAYERATTR.DEF_PHYSICAL 
 	物理防御
PLAYERATTR.DEF_MAGIC 
 	元素防御
PLAYERATTR.CUR_LEVELEXP	26	当前经验
PLAYERATTR.CUR_LEVEL	27	当前等级
 
玩家属性设置
名称	数值	用法描述
PLAYERATTR.ENABLE_MOVE	1	可移动
PLAYERATTR.ENABLE_PLACEBLOCK	2	可摆放方块
PLAYERATTR.ENABLE_OPERATEBLOCK	4	可操作方块
PLAYERATTR.ENABLE_DESTROYBLOCK	8	可破坏方块
PLAYERATTR.ENABLE_USEITEM	16	可使用道具
PLAYERATTR.ENABLE_ATTACK	32	可攻击
PLAYERATTR.ENABLE_BEATTACKED	64	可被攻击
PLAYERATTR.ENABLE_BEKILLED	128	可被杀死
PLAYERATTR.ENABLE_PICKUP	256	可拾取道具
PLAYERATTR.ENABLE_DEATHDROPITEM	512	死亡掉落
PLAYERATTR.ENABLE_VEHICLEAUTOFORWARD	1024	载具自动前行
PLAYERATTR.ENABLE_DISCARDITEM	2048	可丢弃道具
 
玩家道具设置
名称	数值	用法描述
PLAYERATTR.ITEM_DISABLE_THROW	1	道具不可丢弃
PLAYERATTR.ITEM_DISABLE_DROP	2	道具不可掉落
 
玩家行为枚举
名称	数值	用法描述
PLAYERMOTION.STATIC	0	静止
PLAYERMOTION.WALK	1	行走
PLAYERMOTION.RUN	2	奔跑
PLAYERMOTION.JUMP	4	跳跃
PLAYERMOTION.JUMP_TWICE	8	二段跳
PLAYERMOTION.SNEAK	16	潜行
PLAYERMOTION.FALL_GROUND	32	落地
PLAYERMOTION.TURNBACK	1000000	转身(已经取消)
PLAYERMOTION.UP	1000001	上升(已经取消)
PLAYERMOTION.DOWN	1000002	下降(已经取消)
PLAYERMOTION.FALL	1000003	下落(已经取消)
 
队伍属性枚举
名称	数值	用法描述
TEAMATTR.PLAYER_NUM	1	玩家数量
TEAMATTR.SCORE	2	分数
 
伤害类型枚举
名称	数值	用法描述
HURTTYPE.MELEE	0	近战伤害 ATTACK_PUNCH
HURTTYPE.REMOTE	1	远程伤害 ATTACK_RANGE
HURTTYPE.BOMB	2	爆炸伤害 ATTACK_EXPLODE
HURTTYPE.PHYSICS	3	物理伤害 MAX_PHYSICS_ATTACK
HURTTYPE.BURNING	3	燃烧伤害 ATTACK_FIRE
HURTTYPE.TOXIN	4	毒素伤害 ATTACK_POISON
HURTTYPE.WITHER	5	混乱伤害 ATTACK_WITHER
HURTTYPE.MAGIC	6	元素伤害 MAX_MAGIC_ATTACK
HURTTYPE.SUN	6	日晒 ATTACK_SUN
HURTTYPE.FALL	7	跌落伤害 ATTACK_FALLING
HURTTYPE.ANVIL	8	被砸中伤害 ATTACK_ANVIL
HURTTYPE.CACTUS	9	仙人掌伤害 ATTACK_CACTUS
HURTTYPE.ASPHYXIA	10	窒息伤害 ATTACK_WALL
HURTTYPE.DROWN	11	溺水伤害 ATTACK_DROWN
HURTTYPE.SUFFOCATE	12	水下生物在空气中窒息伤害 ATTACK_SUFFOCATE
HURTTYPE.ANTIINJURY	13	反伤 ATTACK_ANTIINJURY
HURTTYPE.LASER	14	被激光伤害 ATTACK_BLOCK_LASER
 
特殊方块类型
名称	数值	用法描述
BLOCKID.AIR	0	空气
 
方块属性枚举
名称	数值	用法描述
BLOCKATTR.EXPLODE_RESISTANCE	1	爆炸抗性
BLOCKATTR.HARDNESS	2	硬度
BLOCKATTR.GLISSADE	3	滑行惯性
BLOCKATTR.BURNING_SPEED	4	燃烧速度
BLOCKATTR.BURNING_PROBABILITY	5	燃烧几率
BLOCKATTR.LIGHTNESS	6	亮度
 
方块属性设置
名称	数值	用法描述
BLOCKATTR.ENABLE_DESTROYED	1	可破坏
BLOCKATTR.ENABLE_BEOPERATED	2	可操作
BLOCKATTR.ENABLE_BEPUSHED	4	可被推动
BLOCKATTR.ENABLE_DROPITEM	8	可掉落道具
BLOCKATTR.BEPUSHED_DROPITEM	16	被推动掉落
 
方块状态
名称	数值	用法描述
BLOCKSTATUS.ACTIVE	1	活跃(被激活)
BLOCKSTATUS.INACTIVE	2	不活跃(未被激活)
 
天气状态枚举
名称	数值	用法描述
WEATHERSTATUS.SHINE_AND_RAIN	0	晴雨交替
WEATHERSTATUS.SHINE	1	晴天
WEATHERSTATUS.RAIN	2	雨天
 
视口方向
名称	数值	用法描述
VIEWPORTTYPE.MAINVIEW	0	主视角
VIEWPORTTYPE.BACKVIEW	1	背视角
VIEWPORTTYPE.FRONTVIEW	2	正视角
VIEWPORTTYPE.BACK2VIEW	3	背视角2
VIEWPORTTYPE.TOPVIEW	4	俯视角
VIEWPORTTYPE.CUSTOMVIEW	5	自定义视角
 
模板库类型
名称	数值	用法描述
RESLIBTYPE.NONE	0	无
RESLIBTYPE.BLOCK	1	方块
RESLIBTYPE.ITEM	2	道具
RESLIBTYPE.MONSTER	3	生物
RESLIBTYPE.PARTICLE	4	特效
RESLIBTYPE.SOUND	5	音效
 
变量类型
名称	数值	用法描述
POSITION	1	位置
AREAINS	2	区域
NUMBER	3	数值
STRING	4	字符串
BOOLEAN	5	布尔值
PLAYER	6	玩家
PLAYERGROUT	7	玩家组
BLOCKTYPE	8	方块类型
ITEMTYPE	9	道具类型
CREATURE	10	生物
ACTORID	11	actor类型
CREATUREGROUP	12	生物组
TIMER	13	计时器
EFFECTTYPE	14	特效类型
SITEGROUP	15	位置组
AREAGROUP	16	区域组
NUMBERGROUP	17	数值组
STRINGGROUP	18	字符串组
BOOLEANGROUP	19	布尔值组
BLOCKTYPEGROUP	20	方块类型组
ITEMTYPEGROUP	21	道具类型组
CREATURETYPEGROUP	22	生物类型组
TIMERGROUP	23	计时器组
EFFECTTYPEGROUP	24	特效类型组
 
图文信息枚举
名称	数值	用法描述
GRAPHICS.GRAPHICS_HORNBOOK	1	文字板
GRAPHICS.GRAPHICS_SUSPENDBOOK	2	漂浮文字
GRAPHICS.GRAPHICS_PROGRESS	3	进度条
GRAPHICS.GRAPHICS_ARROW_POS	4	箭头 指向位置
GRAPHICS.GRAPHICS_ARROW_ACTOR	5	箭头 指向生物
GRAPHICS.GRAPHICS_LINE_POS	6	线 指向位置
GRAPHICS.GRAPHICS_LINE_ACTOR	7	线 指向生物
GRAPHICS.GRAPHICS_SURFACE_POS	8	面 指向界面
GRAPHICS.GRAPHICS_SURFACE_ACTOR	9	面 指向生物
GRAPHICS.GRAPHICS_IMAGE 
10	图片 图片
 
合成炉枚举
名称	数值	用法描述
FURNACEID.FURNACEID_STONE	802	石炉,
FURNACEID.FURNACEID_IRON	798	铁炉,
FURNACEID.FURNACEID_COPPER	799	铜炉,
 
储物箱枚举
名称	数值	用法描述
STORAGEID.STORAGEID_BOX	801	储物箱,
STORAGEID.STORAGEID_BOXROW	1180	大型储物箱（横）,
STORAGEID.STORAGEID_BOXCOL	1181	大型储物箱（竖）,
 
排序枚举
名称	数值	用法描述
SORT.UP	0	升序,
SORT.DOWN	1	降序,
 
按键值枚举
字符串	用法描述
"SPACE"	空格键(手机跳跃键)
"SHIFT"	Shift键(手机潜行键)
"A"	A键(手机左移键)
"B"	B键
"C"	C键
"D"	D键(手机右移键)
"E"	E键
"F"	F键
"G"	G键
"H"	H键
"I"	I键
"J"	J键
"K"	K键
"L"	L键
"M"	M键
"N"	N键
"O"	O键
"P"	P键
"Q"	Q键
"R"	R键
"S"	S键(手机后移键)
"T"	T键
"U"	U键
"V"	V键
"W"	W键(手机前移键)
"X"	X键
"Y"	Y键
"Z"	Z键
 
移动方式枚举
名称	数值	用法描述
MOVETYPE.FLY	1	飞行
MOVETYPE.IDLE	2	默认移动方式
 
设备完整时间类型枚举
名称	数值	用法描述
CurEventParam.EventDate.time	1	设备完整时间
 
设备时间类型枚举
名称	数值	用法描述
CurEventParam.EventDate.year	1	设备时间-年
CurEventParam.EventDate.month	2	设备时间-月
CurEventParam.EventDate.day	3	设备时间- 日
CurEventParam.EventDate.hour	4	 设备时间-时
CurEventParam.EventDate.minute	5	 设备时间-分
 CurEventParam.EventDate.second	6	 设备时间-秒
 
事件参数类型枚举
名称	数值	用法描述
CurEventParam.EventString	1	事件中的字符串
 

QQMusic操作类型

名称	数值	用法描述
QQMUSICOP.PAUSE	0	暂停
QQMUSICOP.RESUME
1	恢复
QQMUSICOP.STOP
2	停止
 

EVENTDATE操作类型

名称	数值	用法描述
EVENTDATE.YEAR 	0	年
EVENTDATE.MONTH	1	月
EVENTDATE.DAY	2	日
EVENTDATE.HOUR	3	时
EVENTDATE.MINUTE	4	分
EVENTDATE.SECOND	5	秒
EVENTDATE.TIMESTAMP	6	时间戳
 

ITEMATTR道具属性

名称	数值	用法描述
ITEMATTR.ATTACK	1	攻击力
ITEMATTR.STACKMAX	2	叠加数
ITEMATTR.SHORTDEFENSE	3	近战防御
ITEMATTR.LONGDEFENSE	4	远程防御
ITEMATTR.EXPLODEDEFENSE	5	爆炸防御
ITEMATTR.FIREDEFENSE	6	燃烧防御
ITEMATTR.POISONDEFENSE	7	毒素防御
ITEMATTR.WITHERDEFENSE	8	混乱防御
ITEMATTR.DURATION	9	耐久度
ITEMATTR.FIREINTERVAL	10	射击间隔
ITEMATTR.MAGAZINES	11	弹夹量
 

DROPMODE掉落方式

名称	数值	用法描述
DROPMODE.DISCARDITEM	2	丢弃道具
DROPMODE.DESTROYBOX	3	箱子被破坏掉落
DROPMODE.DEFEATMOB	4	生物被击败掉落
DROPMODE.DESTROYBLOCK	5	方块被破坏掉落
DROPMODE.SPAWNITEM	6	触发器创建
DROPMODE.CHANGEPLAYMODE	7	掉落物对象转玩法创建
 

动作播放方式

名称	数值	用法描述
ANIMMODE.ANIM_MODE_LOOP	0	循环播放
ANIMMODE.ANIM_MODE_ONCE	1	播放一次
ANIMMODE.ANIM_MODE_ONCE_STOP	2	播放一次完毕，停在末尾
ANIMMODE.ANIM_MODE_DEFAULT	3	表格默认值播放
 

线性变换

名称	数值	用法描述
LinearTransformation.None	-1	无动画
LinearTransformation.Linear	0	直线变换
LinearTransformation.QuadIn	4	平方曲线1渐入
LinearTransformation.QuadOut	5	平方曲线2渐出
LinearTransformation.QuadInOut	6	平方曲线3进出
LinearTransformation.ExpoIn	16	指数曲线1渐入
LinearTransformation.ExpoOut	17	指数曲线2渐出
LinearTransformation.ExpoInOut	18	指数曲线3进出
LinearTransformation.CircIn	19	圆曲线1渐入
LinearTransformation.CircOut	20	圆曲线2渐出
LinearTransformation.CircInOut	21	圆曲线3进出
LinearTransformation.ElasticIn	22	弹簧曲线1渐入
LinearTransformation.ElasticOut	23	弹簧曲线2渐出
LinearTransformation.ElasticInOut	24	弹簧曲线3进出
LinearTransformation.BackIn	25	回退曲线1渐入
LinearTransformation.BackOut	26	回退曲线2渐出
LinearTransformation.BackInOut	27	回退曲线3进出
LinearTransformation.BounceIn	28	弹跳曲线1渐入
LinearTransformation.BounceOut	29	弹跳曲线1渐出
LinearTransformation.BounceInOut	30	弹跳曲线1进出
 

天空盒贴图

名称	数值	用法描述
SKYBOXMAP.SKYMAP	1	天空贴图
SKYBOXMAP.SUNMAP	2	太阳贴图
SKYBOXMAP.MOONMAP	3	月亮贴图
 

天空盒颜色

名称	数值	用法描述
SKYBOXCOLOR.TOPCOLOR	1	天空顶部颜色
SKYBOXCOLOR.MIDDLECOLOR	2	天空腰部颜色
SKYBOXCOLOR.BOTTOMCOLOR	3	天空底部颜色
SKYBOXCOLOR.LIGHTCOLOR	4	天空光照颜色
SKYBOXCOLOR.ENVCOLOR	5	环境光颜色
SKYBOXCOLOR.SUNCOLOR	6	太阳颜色
SKYBOXCOLOR.MOONCOLOR	7	月亮颜色
SKYBOXCOLOR.CLOUDCOLOR	8	云颜色
SKYBOXCOLOR.FOGCOLOR	9	雾颜色
 

天空盒参数

名称	数值	用法描述
SKYBOXATTR.SUNSCALE	1	太阳大小
SKYBOXATTR.MOONSCALE	2	月亮大小
SKYBOXATTR.STARDENSITY	3	星星密度
SKYBOXATTR.CLOUDSPEED	4	云的运动速度
SKYBOXATTR.CLOUDENSITY	5	云的密度
SKYBOXATTR.CLOUDHIGH	6	云的高度
SKYBOXATTR.FOGREMINDIS	7	雾的最近距离
SKYBOXATTR.FOGREMAXDIS	8	雾的最远距离
SKYBOXATTR.TEMPLATE	9	模板
 

天空盒环境粒子参数

名称	数值	用法描述
SKYBOXPARTICLE.STRENGTH	1	强度
SKYBOXPARTICLE.RANGE	2	范围
SKYBOXPARTICLE.SPEED	3	速度
SKYBOXPARTICLE.RANDOMNESS	4	运动不规则度
 

天空盒滤镜参数

名称	数值	用法描述
SKYBOXFILTER.CONTRAST	1	对比度
SKYBOXFILTER.SATURATION	2	饱和度
SKYBOXFILTER.FLOOD	3	泛光强度
SKYBOXFILTER.EXPOSURE	4	曝光强度
SKYBOXFILTER.VOLUMELIGHT	5	体积光强度
SKYBOXFILTER.GAMMA	6	伽马强度
SKYBOXFILTER.DEPTH	7	景深强度
SKYBOXFILTER.COLOR	8	滤镜颜色
SKYBOXFILTER.LUT	9	色彩校正
SKYBOXFILTER.TEMPLATE	10	滤镜模板
 

摄像机属性

名称	数值	用法描述
CameraModel.MoveFollow	1	跟随角色移动
CameraModel.RotateFollow	2	跟随角色旋转
CameraModel.Autoindent	3	阻挡后自动缩进
CameraModel.RelativeRotate	4	相对人物旋转
CameraModel.RoleTranslucent 	 	角色半透
 

摄像机旋转模式

名称	数值	用法描述
CameraRotate.AllDir	1	全方向
CameraRotate.OnlyYaw	2	仅左右
CameraRotate.OnlyPitch	3	仅上下
CameraRotate.NoTurn	4	无法转动
 

开发者商店页面类型

名称	用法描述
MiniShopPage.Item	道具购买
MiniShopPage.Skin	皮肤
MiniShopPage.Convert	兑换
MiniShopPage.Welfare	福利
MiniShopPage.MiniVip 	大会员
 

