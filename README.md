
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
Particle.Pos.OnCreate	任意位置上特效被创建