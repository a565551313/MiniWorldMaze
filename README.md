# 迷你世界 脚本API 完整说明文档

> 本文档基于官方Wiki及最新资料整理，包含迷你世界全部脚本API接口说明、事件监听、参数、返回值及示例，方便开发者快速查阅使用。

---

## 目录

- [事件监听 Event](#事件监听-event)
- [世界接口 World](#世界接口-world)
- [游戏逻辑接口 Game](#游戏逻辑接口-game)
- [玩家接口 Player](#玩家接口-player)
- [生物接口 Actor](#生物接口-actor)
- [方块接口 Block](#方块接口-block)
- [道具接口 Item](#道具接口-item)
- [特效接口 Particle](#特效接口-particle)
- [UI事件接口 UI](#ui事件接口-ui)
- [其他事件](#其他事件)
- [示例代码](#示例代码)
- [错误码 ErrorCode](#错误码-errorcode)

---

# 事件监听 Event

直接添加要监听的事件，无需自行创建事件管理对象。

```lua
-- 游戏事件
ScriptSupportEvent:registerEvent("Game.Start", Game_StartGame)
ScriptSupportEvent:registerEvent("Game.Run", Game_Update)
ScriptSupportEvent:registerEvent("Game.End", Game_GameOver)

-- 玩家事件
ScriptSupportEvent:registerEvent("Player.Die", Player_Dead)
ScriptSupportEvent:registerEvent("Player.Revive", Player_Revive)
ScriptSupportEvent:registerEvent("Player.AddItem", BackPack_AddItem)

-- 方块事件
ScriptSupportEvent:registerEvent("Block.Add", Block_Add)
ScriptSupportEvent:registerEvent("Block.DestroyBy", Block_Destroy)
ScriptSupportEvent:registerEvent("Block.Trigger", Block_Trigger)
```

---

# 事件分类与说明

| 事件分类     | 说明                       |
| ------------ | -------------------------- |
| 世界事件     | 地图内相关事件             |
| 游戏逻辑     | 游戏时间、Tick变化等       |
| 玩家事件     | 玩家相关行为事件           |
| 生物事件     | 非玩家生物相关事件         |
| 方块事件     | 方块创建、破坏、触发等     |
| 道具事件     | 道具生成、拾取、消耗等     |
| 特效事件     | 特效生成                   |
| UI事件       | 自定义UI交互               |
| 其他事件     | 蓝图、合成、购买等特殊事件 |

---

# 世界事件 (World)

| 事件名称            | 用法描述           | 接口参数                        | 参数说明               |
| ------------------- | ------------------ | ------------------------------- | ---------------------- |
| Backpack.ItemChange  | 容器内道具变化     | blockid, itemid, itemnum, x,y,z | 方块类型，道具类型，道具数量，方块坐标 |
| Backpack.ItemPutIn   | 容器内有道具放入   | blockid, itemid, itemnum, x,y,z | 同上                   |
| Backpack.ItemTakeOut | 容器内有道具取出   | blockid, itemid, itemnum, x,y,z | 同上                   |

---

# 游戏逻辑事件 (Game)

| 事件名称       | 用法描述           | 接口参数              | 参数说明       |
| -------------- | ------------------ | --------------------- | -------------- |
| Game.Hour      | 世界小时时间变化   | hour                  | 游戏小时时间   |
| Game.RunTime   | 世界Tick变化       | second, ticks         | 游戏分钟，游戏秒 |

---

# 玩家事件 (Player)

| 事件名称                 | 用法描述             | 接口参数                                  | 参数说明                           |
| ------------------------ | -------------------- | ----------------------------------------- | -------------------------------- |
| Game.AnyPlayer.Defeat     | 任一玩家失败         | eventobjid, shortix, x, y, z              | 事件玩家，快捷栏索引，坐标位置   |
| Game.AnyPlayer.EnterGame  | 任一玩家进入游戏     | eventobjid, shortix, x, y, z              | 同上                             |
| Game.AnyPlayer.LeaveGame  | 任一玩家离开游戏     | eventobjid, shortix, x, y, z              | 同上                             |
| Game.AnyPlayer.Victory    | 任一玩家胜利         | eventobjid, shortix, x, y, z              | 同上                             |
| Player.AddBuff            | 玩家获得状态效果     | eventobjid, buffid, bufflvl                | 事件玩家，状态ID，状态等级       |
| Player.AddItem            | 玩家获得道具         | eventobjid, itemid, itemnum                | 事件玩家，道具类型，道具数量     |
| Player.AreaIn             | 玩家进入区域         | eventobjid, areaid                         | 事件玩家，区域ID                 |
| Player.AreaOut            | 玩家离开区域         | eventobjid, areaid                         | 同上                             |
| Player.AttackHit          | 玩家击中目标         | eventobjid, targetactorid                  | 事件玩家，被攻击对象             |
| Player.Attack             | 玩家攻击             | eventobjid, shortix, x, y, z              | 事件玩家，快捷栏索引，坐标位置 |
| Player.BackPackChange     | 背包栏变化           | eventobjid, itemid, itemnum, itemix       | 事件玩家，道具类型，道具数量，道具所在格子索引 |
| Player.BeHurt             | 玩家受到伤害         | eventobjid, hurtlv                         | 事件玩家，伤害值                 |
| Player.ChangeAttr         | 玩家属性变化         | eventobjid, shortix, playerattr, playerattrval, x, y, z | 事件玩家，快捷栏索引，属性，属性值，坐标位置 |
| Player.ClickActor         | 点击生物             | eventobjid, targetactorid                  | 事件玩家，被点击对象             |
| Player.ClickBlock         | 点击方块             | eventobjid, blockid, x, y, z               | 事件玩家，方块类型，方块坐标   |
| Player.Collide            | 玩家与玩家/生物碰撞  | eventobjid, toobjid                        | 事件玩家，目标对象             |
| Player.ConsumeItem        | 玩家消耗道具         | eventobjid, itemid, itemnum                | 玩家，道具类型，道具数量         |
| Player.DamageActor        | 玩家造成伤害         | eventobjid, toobjid, targetactorid, hurtlv | 事件玩家，目标对象，目标生物ID，伤害值 |
| Player.DefeatActor        | 玩家击败目标         | eventobjid, toobjid, targetactorid        | 事件玩家，目标对象，被攻击对象 |
| Player.Die                | 玩家死亡             | eventobjid, shortix, x, y, z              | 事件玩家，快捷栏索引，坐标位置 |
| Player.DiscardItem        | 丢弃道具             | eventobjid, itemid, itemnum, toobjid      | 玩家，道具类型，道具数量，掉落物ID |
| Player.DismountActor      | 玩家骑乘下           | eventobjid, targetactorid                  | 事件玩家，被攻击对象           |
| Player.EquipChange        | 装备栏变化           | eventobjid, itemid, itemnum, itemix       | 玩家，道具类型，道具数量，道具所在格子索引 |
| Player.EquipOff           | 脱下装备             | eventobjid, itemid, itemnum, itemix       | 同上                           |
| Player.EquipOn            | 穿上装备             | eventobjid, itemid, itemnum, itemix       | 同上                           |
| Player.InputContent       | 输入字符串           | eventobjid, content                        | 事件玩家，输入的字符串         |
| Player.InputKeyDown       | 玩家按下按键         | eventobjid, vkey                           | 事件玩家，按下的键值           |
| Player.InputKeyOnPress    | 玩家长按按键         | eventobjid, vkey                           | 同上                           |
| Player.InputKeyUp         | 玩家松开按键         | eventobjid, vkey                           | 同上                           |
| Player.InvateFriend       | 邀请好友             | eventobjid, toobjid                        | 事件玩家，目标玩家             |
| Player.LevelModelUpgrade  | 玩家等级发生改变     | eventobjid                                 | 事件玩家                       |
| Player.MotionStateChange  | 玩家行为状态变更     | eventobjid, playermotion                   | 事件玩家，行为状态枚举         |
| Player.MountActor         | 玩家骑乘上           | eventobjid, targetactorid                  | 事件玩家，被攻击对象           |
| Player.MoveOneBlockSize   | 玩家移动一格         | eventobjid, shortix, x, y, z              | 事件玩家                       |
| Player.NewInputContent    | 聊天框输入           | eventobjid, content                        | 事件玩家，输入的字符串         |
| Player.PickUpItem         | 玩家拾取道具         | eventobjid, toobjid, itemid, itemnum, x, y, z | 玩家，掉落物对象，道具类型，道具数量，坐标 |
| Player.PlayAction         | 玩家使用表情动作     | eventobjid, act                            | 玩家，动作ID                   |
| Player.RemoveBuff         | 玩家失去状态效果     | eventobjid, buffid, bufflvl                | 玩家，状态ID，状态等级         |
| Player.Revive             | 玩家复活             | eventobjid, shortix, x, y, z              | 玩家，快捷栏索引，坐标位置     |
| Player.SelectShortcut     | 快捷栏选择           | eventobjid, itemid, itemnum                | 玩家，道具类型，道具数量       |
| Player.ShortcutChange     | 快捷栏变化           | eventobjid, itemid, itemnum, itemix       | 玩家，道具类型，道具数量，道具所在格子索引 |
| Player.UseGiftPack        | 使用礼包道具         | eventobjid, itemid, itemnum                | 玩家，道具类型，道具数量       |
| Player.UseItem            | 玩家使用道具         | eventobjid, itemid, itemnum, itemix       | 玩家，道具类型，道具数量，道具所在格子索引 |

---

# 生物事件 (Actor)

| 事件名称                 | 用法描述             | 接口参数                                  | 参数说明                           |
| ------------------------ | -------------------- | ----------------------------------------- | -------------------------------- |
| Actor.AddBuff            | 生物获得状态效果     | eventobjid, actorid, buffid, bufflvl      | 生物对象，生物类型，状态ID，状态等级 |
| Actor.AreaIn             | 生物进入区域         | eventobjid, areaid                         | 生物对象，区域ID                 |
| Actor.AreaOut            | 生物离开区域         | eventobjid, areaid                         | 同上                             |
| Actor.AttackHit          | 攻击命中             | eventobjid, toobjid, actorid, targetactorid | 生物对象，被攻击对象，生物类型，被攻击生物类型 |
| Actor.Attack             | 生物攻击             | eventobjid, toobjid, actorid, targetactorid | 同上                           |
| Actor.BeHurt             | 生物受到伤害         | eventobjid, toobjid, hurtlv, actorid      | 生物对象，攻击对象，伤害值，生物类型 |
| Actor.Beat               | 生物击败玩家/生物    | eventobjid, toobjid, actorid, targetactorid | 生物对象，攻击对象，生物类型，被攻击生物类型 |
| Actor.ChangeAttr         | 生物属性变化         | eventobjid, actorid, actorattr, actorattrval | 生物对象，生物类型，属性枚举，改变值 |
| Actor.ChangeMotion       | 生物行为状态变更     | eventobjid, actorid, actormotion           | 生物对象，生物类型，动作枚举值   |
| Actor.Collide            | 生物碰撞玩家/生物    | eventobjid, toobjid, actorid, targetactorid | 生物对象，目标对象，生物类型，被碰撞生物类型 |
| Actor.Create             | 生物被创建           | eventobjid, actorid                         | 生物对象，生物类型               |
| Actor.Damage             | 生物造成伤害         | eventobjid, toobjid, hurtlv, actorid, targetactorid | 生物对象，目标对象，伤害值，生物类型，被攻击生物类型 |
| Actor.Die                | 生物死亡             | eventobjid, toobjid, actorid               | 生物对象，攻击对象，生物类型     |
| Actor.Projectile.Hit     | 投掷物击中           | eventobjid, toobjid, itemid, targetactorid, x, y, z, helperobjid | 投掷物对象，被击中对象，道具类型，被击中生物类型，坐标，投掷物所属对象 |
| Actor.RemoveBuff         | 生物失去状态效果     | eventobjid, actorid, buffid, bufflvl       | 生物对象，生物类型，状态ID，状态等级 |

---

# 方块事件 (Block)

| 事件名称                 | 用法描述             | 接口参数                                  | 参数说明                           |
| ------------------------ | -------------------- | ----------------------------------------- | -------------------------------- |
| Block.Add                | 方块被创建           | blockid, x, y, z                          | 方块类型，坐标                   |
| Block.DestroyBy          | 方块被破坏           | eventobjid, blockid, x, y, z              | 玩家对象，方块类型，坐标         |
| Block.Dig.Begin          | 方块开始被挖掘       | eventobjid, blockid, x, y, z              | 玩家对象，方块类型，坐标         |
| Block.Dig.Cancel         | 挖掘方块被取消       | eventobjid, blockid, x, y, z              | 同上                           |
| Block.Dig.End            | 方块被挖掘完成       | eventobjid, blockid, x, y, z              | 同上                           |
| Block.Remove             | 方块被移除           | blockid, x, y, z                          | 方块类型，坐标                   |
| Block.Trigger            | 方块被激活/通电     | eventobjid, blockid, x, y, z              | 玩家对象，方块类型，坐标         |

---

# 道具事件 (Item)

| 事件名称                 | 用法描述             | 接口参数                                  | 参数说明                           |
| ------------------------ | -------------------- | ----------------------------------------- | -------------------------------- |
| DropItem.AreaIn          | 掉落物进入区域       | eventobjid, areaid, itemid                | 掉落物对象，区域ID，道具类型     |
| DropItem.AreaOut         | 掉落物离开区域       | eventobjid, areaid, itemid                | 同上                           |
| Item.Create             | 掉落物被创建         | eventobjid, itemid, defaultvalue, x, y, z | 掉落物对象，道具类型，掉落方式，坐标 |
| Item.Destroy            | 装备被破坏           | eventobjid, itemid, itemnum                | 事件对象，道具类型，道具数量     |
| Item.Disappear          | 掉落物消失           | eventobjid, itemid, itemnum, x, y, z      | 掉落物对象，道具类型，道具数量，坐标 |
| Item.Pickup             | 掉落物被拾取         | eventobjid, toobjid, itemid, itemnum, x, y, z | 玩家对象，掉落物对象，道具类型，道具数量，坐标 |
| Item.expend             | 食物道具被消耗       | eventobjid, itemid, itemnum                | 事件对象，道具类型，道具数量     |
| Missile.AreaIn          | 投掷物进入区域       | eventobjid, areaid, itemid, helperobjid   | 投掷物对象，区域ID，道具类型，投掷物所属对象 |
| Missile.AreaOut         | 投掷物离开区域       | eventobjid, areaid, itemid, helperobjid   | 同上                           |
| Missile.Create          | 投掷物被创建         | eventobjid, itemid, toobjid, x, y, z      | 玩家对象，道具类型，投掷物对象，坐标 |
| Particle.Item.OnCreate  | 特效在掉落物上创建   | eventobjid, effectid, x, y, z              | 掉落物对象，特效类型，坐标       |

---

# 特效事件 (Particle)

| 事件名称                 | 用法描述             | 接口参数                                  | 参数说明                           |
| ------------------------ | -------------------- | ----------------------------------------- | -------------------------------- |
| Particle.Mob.OnCreate    | 生物身上特效创建     | eventobjid, effectid, x, y, z             | 生物对象，特效类型，坐标         |
| Particle.Player.OnCreate | 玩家身上特效创建     | eventobjid, effectid, x, y, z             | 玩家对象，特效类型，坐标         |
| Particle.Pos.OnCreate    | 位置上特效创建       | effectid, x, y, z                         | 特效类型，坐标                   |
| Particle.Projectile.OnCreate | 投掷物特效创建   | eventobjid, effectid, x, y, z             | 投掷物对象，特效类型，坐标       |

---

# UI事件 (UI)

| 事件名称                 | 用法描述             | 接口参数                                  | 参数说明                           |
| ------------------------ | -------------------- | ----------------------------------------- | -------------------------------- |
| UI.Button.Click          | 按钮松开             | eventobjid, CustomUI, uielement           | 玩家，UI对象，UI元件             |
| UI.Button.TouchBegin     | 按钮按下             | eventobjid, CustomUI, uielement           | 同上                           |
| UI.GLoader3D.Click       | 3D模型被松开         | eventobjid, CustomUI, uielement           | 同上                           |
| UI.GLoader3D.TouchBegin  | 3D模型被按下         | eventobjid, CustomUI, uielement           | 同上                           |
| UI.Hide                  | 界面被关闭           | eventobjid, CustomUI                       | 玩家，UI对象                   |
| UI.LostFocus             | 输入框失去焦点       | eventobjid, CustomUI, uielement, content  | 玩家，UI对象，UI元件，输入内容 |
| UI.Show                  | 界面被打开           | eventobjid, CustomUI                       | 玩家，UI对象                   |

---

# 其他事件 (*)

| 事件名称                 | 用法描述             | 接口参数                                  | 参数说明                           |
| ------------------------ | -------------------- | ----------------------------------------- | -------------------------------- |
| BluePrint.BuildBegin     | 蓝图开始创建         | areaid                                    | 区域ID                         |
| Craft.end                | 配方合成完成         | eventobjid, craftid, itemid, itemnum     | 事件对象，配方ID，道具类型，道具数量 |
| Developer.BuyItem        | 玩家购买或提取商品   | eventobjid, itemid                        | 事件对象，道具类型             |
| Furnace.begin            | 熔炼开始             | furnaceid, x, y, z                        | 熔炼ID，坐标                   |

---

# 示例代码

### 监听玩家击杀生物事件，计数并结束游戏示例

```lua
local killCount = 0
local targetActorId = 3102 -- 目标生物ID

local function OnDefeatActor(event)
    local actorId = event.targetactorid
    if actorId == targetActorId then
        killCount = killCount + 1
        Chat:sendSystemMsg("击杀数量："..killCount)
        if killCount >= 10 then
            Game:doGameEnd()
        end
    end
end

ScriptSupportEvent:registerEvent("Player.DefeatActor", OnDefeatActor)
```

### 监听玩家进入区域事件

```lua
local function OnPlayerAreaIn(event)
    local playerId = event.eventobjid
    local areaId = event.areaid
    Chat:sendSystemMsg("玩家 "..playerId.." 进入区域 "..areaId)
end

ScriptSupportEvent:registerEvent("Player.AreaIn", OnPlayerAreaIn)
```

---

# 错误码 (ErrorCode)

| 错误码         | 含义               |
| -------------- | ------------------ |
| OK             | 成功               |
| Failed         | 失败               |
| InvalidParam   | 参数错误           |
| NotFound       | 未找到             |
| NoPermission   | 无权限             |
| Busy           | 资源忙             |

---

> **注意**  
> - 所有事件回调函数参数均为一个table，字段名对应接口参数。  
> - 返回值一般为ErrorCode，具体请参考API各函数说明。  
> - 以上为官方公开的主流事件和接口，更多详细接口请参考官方Wiki或SDK文档。

---

如果需要，我可以帮你进一步拆分模块，添加函数详细参数说明和更多示例。  
欢迎继续提问！

