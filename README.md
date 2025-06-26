# 迷你世界 脚本API 完整说明文档

> 本文档基于官方Wiki及最新资料，全面整理迷你世界脚本API接口，包括事件监听、函数说明、参数、返回值及示例，适合放置于GitHub做为开发参考。

---

## 目录

- [事件监听 Event](#event-listening)
- [世界事件 World](#world-events)
- [游戏逻辑事件 Game](#game-events)
- [玩家事件 Player](#player-events)
- [生物事件 Actor](#actor-events)
- [方块事件 Block](#block-events)
- [道具事件 Item](#item-events)
- [特效事件 Particle](#particle-events)
- [UI事件 UI](#ui-events)
- [其他事件 Other](#other-events)
- [错误码 ErrorCode](#errorcode)
- [示例代码 Examples](#examples)

---

<a name="event-listening"></a>
## 事件监听 Event

无需创建事件管理对象，直接注册事件即可：

```lua
ScriptSupportEvent:registerEvent("Game.Start", Game_StartGame)
ScriptSupportEvent:registerEvent("Player.Die", Player_Dead)
ScriptSupportEvent:registerEvent("Block.Add", Block_Add)
```

---

<a name="world-events"></a>
## 世界事件 World

| 事件名称              | 用法描述        | 接口参数                         | 参数说明                         |
|-----------------------|-----------------|---------------------------------|----------------------------------|
| Backpack.ItemChange    | 容器内道具变化  | blockid, itemid, itemnum, x,y,z | 方块类型，道具类型，道具数量，方块坐标 |
| Backpack.ItemPutIn     | 容器内道具放入  | blockid, itemid, itemnum, x,y,z | 同上                             |
| Backpack.ItemTakeOut   | 容器内道具取出  | blockid, itemid, itemnum, x,y,z | 同上                             |

---

<a name="game-events"></a>
## 游戏逻辑事件 Game

| 事件名称       | 用法描述           | 接口参数        | 参数说明         |
|----------------|--------------------|-----------------|------------------|
| Game.Hour      | 世界小时时间变化   | hour            | 游戏小时         |
| Game.RunTime   | 世界Tick变化       | second, ticks   | 游戏分钟、游戏秒 |

---

<a name="player-events"></a>
## 玩家事件 Player

| 事件名称                 | 用法描述             | 接口参数                                   | 参数说明                         |
|--------------------------|----------------------|--------------------------------------------|----------------------------------|
| Game.AnyPlayer.Defeat     | 任一玩家失败         | eventobjid, shortix, x, y, z               | 玩家ID，快捷栏索引，坐标         |
| Game.AnyPlayer.EnterGame  | 任一玩家进入         | eventobjid, shortix, x, y, z               | 同上                           |
| Game.AnyPlayer.LeaveGame  | 任一玩家离开         | eventobjid, shortix, x, y, z               | 同上                           |
| Game.AnyPlayer.Victory    | 任一玩家胜利         | eventobjid, shortix, x, y, z               | 同上                           |
| Player.AddBuff            | 玩家获得状态效果     | eventobjid, buffid, bufflvl                 | 玩家ID，状态ID，等级             |
| Player.AddItem            | 玩家获得道具         | eventobjid, itemid, itemnum                 | 玩家ID，道具类型，道具数量       |
| Player.AreaIn             | 玩家进入区域         | eventobjid, areaid                          | 玩家ID，区域ID                   |
| Player.AreaOut            | 玩家离开区域         | eventobjid, areaid                          | 同上                           |
| Player.AttackHit          | 玩家击中目标         | eventobjid, targetactorid                   | 玩家ID，被攻击生物ID             |
| Player.Attack             | 玩家攻击             | eventobjid, shortix, x, y, z               | 玩家ID，快捷栏索引，坐标         |
| Player.BackPackChange     | 背包栏变化           | eventobjid, itemid, itemnum, itemix        | 玩家ID，道具类型，道具数量，道具格索引 |
| Player.BeHurt             | 玩家受到伤害         | eventobjid, hurtlv                          | 玩家ID，伤害值                   |
| Player.ChangeAttr         | 玩家属性变化         | eventobjid, shortix, playerattr, playerattrval, x, y, z | 玩家ID，快捷栏索引，属性，属性值，坐标 |
| Player.ClickActor         | 点击生物             | eventobjid, targetactorid                   | 玩家ID，被点击生物ID             |
| Player.ClickBlock         | 点击方块             | eventobjid, blockid, x, y, z                | 玩家ID，方块类型，坐标           |
| Player.Collide            | 玩家与玩家/生物碰撞  | eventobjid, toobjid                         | 玩家ID，目标对象ID               |
| Player.ConsumeItem        | 玩家消耗道具         | eventobjid, itemid, itemnum                 | 玩家ID，道具类型，道具数量       |
| Player.DamageActor        | 玩家造成伤害         | eventobjid, toobjid, targetactorid, hurtlv | 玩家ID，目标对象ID，目标生物ID，伤害值 |
| Player.DefeatActor        | 玩家击败目标         | eventobjid, toobjid, targetactorid         | 玩家ID，目标对象ID，被攻击对象ID |
| Player.Die                | 玩家死亡             | eventobjid, shortix, x, y, z               | 玩家ID，快捷栏索引，坐标         |
| Player.DiscardItem        | 丢弃道具             | eventobjid, itemid, itemnum, toobjid       | 玩家ID，道具类型，道具数量，掉落物ID |
| Player.DismountActor      | 玩家骑乘下           | eventobjid, targetactorid                   | 玩家ID，被攻击对象ID             |
| Player.EquipChange        | 装备栏变化           | eventobjid, itemid, itemnum, itemix        | 玩家ID，道具类型，道具数量，道具格索引 |
| Player.EquipOff           | 脱下装备             | eventobjid, itemid, itemnum, itemix        | 同上                           |
| Player.EquipOn            | 穿上装备             | eventobjid, itemid, itemnum, itemix        | 同上                           |
| Player.InputContent       | 输入字符串           | eventobjid, content                         | 玩家ID，输入字符串               |
| Player.InputKeyDown       | 玩家按下按键         | eventobjid, vkey                            | 玩家ID，按键值                 |
| Player.InputKeyOnPress    | 玩家长按按键         | eventobjid, vkey                            | 同上                           |
| Player.InputKeyUp         | 玩家松开按键         | eventobjid, vkey                            | 同上                           |
| Player.InvateFriend       | 邀请好友             | eventobjid, toobjid                         | 玩家ID，目标玩家ID             |
| Player.LevelModelUpgrade  | 玩家等级改变         | eventobjid                                  | 玩家ID                         |
| Player.MotionStateChange  | 玩家行为状态变更     | eventobjid, playermotion                    | 玩家ID，行为状态枚举           |
| Player.MountActor         | 玩家骑乘上           | eventobjid, targetactorid                   | 玩家ID，被攻击对象ID           |
| Player.MoveOneBlockSize   | 玩家移动一格         | eventobjid, shortix, x, y, z               | 玩家ID，快捷栏索引，坐标       |
| Player.NewInputContent    | 聊天框输入           | eventobjid, content                         | 玩家ID，输入字符串             |
| Player.PickUpItem         | 玩家拾取道具         | eventobjid, toobjid, itemid, itemnum, x, y, z | 玩家ID，掉落物ID，道具类型，道具数量，坐标 |
| Player.PlayAction         | 玩家使用表情动作     | eventobjid, act                             | 玩家ID，动作ID                 |
| Player.RemoveBuff         | 玩家失去状态效果     | eventobjid, buffid, bufflvl                 | 玩家ID，状态ID，等级           |
| Player.Revive             | 玩家复活             | eventobjid, shortix, x, y, z               | 玩家ID，快捷栏索引，坐标       |
| Player.SelectShortcut     | 快捷栏选择           | eventobjid, itemid, itemnum                 | 玩家ID，道具类型，道具数量     |
| Player.ShortcutChange     | 快捷栏变化           | eventobjid, itemid, itemnum, itemix        | 玩家ID，道具类型，道具数量，道具格索引 |
| Player.UseGiftPack        | 使用礼包道具         | eventobjid, itemid, itemnum                 | 玩家ID，道具类型，道具数量     |
| Player.UseItem            | 玩家使用道具         | eventobjid, itemid, itemnum, itemix        | 玩家ID，道具类型，道具数量，道具格索引 |

---

<a name="actor-events"></a>
## 生物事件 Actor

| 事件名称                 | 用法描述             | 接口参数                                   | 参数说明                         |
|--------------------------|----------------------|--------------------------------------------|----------------------------------|
| Actor.AddBuff            | 生物获得状态效果     | eventobjid, actorid, buffid, bufflvl       | 生物对象ID，生物类型，状态ID，等级 |
| Actor.AreaIn             | 生物进入区域         | eventobjid, areaid                         | 生物对象ID，区域ID               |
| Actor.AreaOut            | 生物离开区域         | eventobjid, areaid                         | 同上                           |
| Actor.AttackHit          | 攻击命中             | eventobjid, toobjid, actorid, targetactorid | 攻击生物对象，目标对象，攻击生物类型，目标生物类型 |
| Actor.Attack             | 生物攻击             | eventobjid, toobjid, actorid, targetactorid | 同上                           |
| Actor.BeHurt             | 生物受到伤害         | eventobjid, toobjid, hurtlv, actorid       | 生物对象，攻击对象，伤害值，生物类型 |
| Actor.Beat               | 生物击败玩家/生物    | eventobjid, toobjid, actorid, targetactorid | 生物对象，目标对象，生物类型，目标生物类型 |
| Actor.ChangeAttr         | 生物属性变化         | eventobjid, actorid, actorattr, actorattrval | 生物对象，生物类型，属性枚举，变化值 |
| Actor.ChangeMotion       | 生物行为状态变更     | eventobjid, actorid, actormotion           | 生物对象，生物类型，动作枚举值   |
| Actor.Collide            | 生物碰撞玩家/生物    | eventobjid, toobjid, actorid, targetactorid | 生物对象，目标对象，生物类型，目标生物类型 |
| Actor.Create             | 生物被创建           | eventobjid, actorid                         | 生物对象，生物类型             |
| Actor.Damage             | 生物造成伤害         | eventobjid, toobjid, hurtlv, actorid, targetactorid | 生物对象，目标对象，伤害值，生物类型，目标生物类型 |
| Actor.Die                | 生物死亡             | eventobjid, toobjid, actorid               | 生物对象，攻击对象，生物类型     |
| Actor.Projectile.Hit     | 投掷物击中           | eventobjid, toobjid, itemid, targetactorid, x, y, z, helperobjid | 投掷物对象，被击中对象，道具类型，被击中生物类型，坐标，投掷物所属对象 |
| Actor.RemoveBuff         | 生物失去状态效果     | eventobjid, actorid, buffid, bufflvl       | 生物对象，生物类型，状态ID，等级 |

---

<a name="block-events"></a>
## 方块事件 Block

| 事件名称                 | 用法描述             | 接口参数                                   | 参数说明                         |
|--------------------------|----------------------|--------------------------------------------|----------------------------------|
| Block.Add                | 方块被创建           | blockid, x, y, z                          | 方块类型，坐标                   |
| Block.DestroyBy          | 方块被破坏           | eventobjid, blockid, x, y, z               | 玩家对象ID，方块类型，坐标       |
| Block.Dig.Begin          | 方块开始被挖掘       | eventobjid, blockid, x, y, z               | 同上                           |
| Block.Dig.Cancel         | 挖掘被取消           | eventobjid, blockid, x, y, z               | 同上                           |
| Block.Dig.End            | 方块被挖掘完成       | eventobjid, blockid, x, y, z               | 同上                           |
| Block.Remove             | 方块被移除           | blockid, x, y, z                          | 方块类型，坐标                 |
| Block.Trigger            | 方块被激活/通电     | eventobjid, blockid, x, y, z               | 玩家对象ID，方块类型，坐标       |

---

<a name="item-events"></a>
## 道具事件 Item

| 事件名称                 | 用法描述             | 接口参数                                   | 参数说明                         |
|--------------------------|----------------------|--------------------------------------------|----------------------------------|
| DropItem.AreaIn          | 掉落物进入区域       | eventobjid, areaid, itemid                 | 掉落物对象ID，区域ID，道具类型   |
| DropItem.AreaOut         | 掉落物离开区域       | eventobjid, areaid, itemid                 | 同上                           |
| Item.Create             | 掉落物被创建         | eventobjid, itemid, defaultvalue, x, y, z | 掉落物对象ID，道具类型，掉落方式，坐标 |
| Item.Destroy            | 装备被破坏           | eventobjid, itemid, itemnum                 | 事件对象，道具类型，道具数量     |
| Item.Disappear          | 掉落物消失           | eventobjid, itemid, itemnum, x, y, z       | 掉落物对象，道具类型，道具数量，坐标 |
| Item.Pickup             | 掉落物被拾取         | eventobjid, toobjid, itemid, itemnum, x, y, z | 玩家ID，掉落物ID，道具类型，道具数量，坐标 |
| Item.expend             | 食物道具被消耗       | eventobjid, itemid, itemnum                 | 事件对象，道具类型，道具数量     |
| Missile.AreaIn          | 投掷物进入区域       | eventobjid, areaid, itemid, helperobjid    | 投掷物对象，区域ID，道具类型，所属对象ID |
| Missile.AreaOut         | 投掷物离开区域       | eventobjid, areaid, itemid, helperobjid    | 同上                           |
| Missile.Create          | 投掷物被创建         | eventobjid, itemid, toobjid, x, y, z       | 玩家对象，道具类型，投掷物对象，坐标 |
| Particle.Item.OnCreate  | 特效在掉落物上创建   | eventobjid, effectid, x, y, z               | 掉落物对象，特效ID，坐标         |

---

<a name="particle-events"></a>
## 特效事件 Particle

| 事件名称                 | 用法描述             | 接口参数                                   | 参数说明                         |
|--------------------------|----------------------|--------------------------------------------|----------------------------------|
| Particle.Mob.OnCreate    | 生物身上特效创建     | eventobjid, effectid, x, y, z              | 生物对象，特效ID，坐标           |
| Particle.Player.OnCreate | 玩家身上特效创建     | eventobjid, effectid, x, y, z              | 玩家对象，特效ID，坐标           |
| Particle.Pos.OnCreate    | 位置上特效创建       | effectid, x, y, z                         | 特效ID，坐标                   |
| Particle.Projectile.OnCreate | 投掷物特效创建   | eventobjid, effectid, x, y, z              | 投掷物对象，特效ID，坐标         |

---

<a name="ui-events"></a>
## UI事件 UI

| 事件名称                 | 用法描述             | 接口参数                                   | 参数说明                         |
|--------------------------|----------------------|--------------------------------------------|----------------------------------|
| UI.Button.Click          | 按钮松开             | eventobjid, CustomUI, uielement            | 玩家ID，UI对象，UI元素           |
| UI.Button.TouchBegin     | 按钮按下             | eventobjid, CustomUI, uielement            | 同上                           |
| UI.GLoader3D.Click       | 3D模型松开           | eventobjid, CustomUI, uielement            | 同上                           |
| UI.GLoader3D.TouchBegin  | 3D模型按下           | eventobjid, CustomUI, uielement            | 同上                           |
| UI.Hide                  | 界面关闭             | eventobjid, CustomUI                        | 玩家ID，UI对象                   |
| UI.LostFocus             | 输入框失去焦点       | eventobjid, CustomUI, uielement, content   | 玩家ID，UI对象，UI元素，内容     |
| UI.Show                  | 界面打开             | eventobjid, CustomUI                        | 玩家ID，UI对象                   |

---

<a name="other-events"></a>
## 其他事件 Other

| 事件名称                 | 用法描述             | 接口参数                                   | 参数说明                         |
|--------------------------|----------------------|--------------------------------------------|----------------------------------|
| BluePrint.BuildBegin     | 蓝图开始创建         | areaid                                    | 区域ID                         |
| Craft.end                | 配方合成完成         | eventobjid, craftid, itemid, itemnum     | 玩家ID，配方ID，道具类型，道具数量 |
| Developer.BuyItem        | 玩家购买或提取商品   | eventobjid, itemid                        | 玩家ID，道具类型               |
| Furnace.begin            | 熔炼开始             | furnaceid, x, y, z                        | 熔炼ID，坐标                   |

---

<a name="errorcode"></a>
## 错误码 ErrorCode

| 错误码         | 含义               |
| -------------- | ------------------ |
| OK             | 成功               |
| Failed         | 失败               |
| InvalidParam   | 参数错误           |
| NotFound       | 未找到             |
| NoPermission   | 无权限             |
| Busy           | 资源忙             |

---

<a name="examples"></a>
## 示例代码 Examples

### 监听玩家击杀指定生物，计数并结束游戏

```lua
local killCount = 0
local targetActorId = 3102 -- 目标生物ID

local function OnDefeatActor(event)
    if event.targetactorid == targetActorId then
        killCount = killCount + 1
        Chat:sendSystemMsg("击杀数量：" .. killCount)
        if killCount >= 10 then
            Game:doGameEnd()
        end
    end
end

ScriptSupportEvent:registerEvent("Player.DefeatActor", OnDefeatActor)
```

### 玩家进入指定区域提示

```lua
local function OnPlayerAreaIn(event)
    Chat:sendSystemMsg(string.format("玩家 %d 进入区域 %d", event.eventobjid, event.areaid))
end

ScriptSupportEvent:registerEvent("Player.AreaIn", OnPlayerAreaIn)
```

### 方块被破坏事件示例

```lua
local function OnBlockDestroy(event)
    Chat:sendSystemMsg(string.format("玩家 %d 破坏方块 %d 坐标(%d,%d,%d)", event.eventobjid, event.blockid, event.x, event.y, event.z))
end

ScriptSupportEvent:registerEvent("Block.DestroyBy", OnBlockDestroy)
```

---

## 说明

- 事件回调函数参数均为table，字段名对应事件参数名  
- 返回值一般为ErrorCode，具体接口请参考各函数说明  
- 本文档基于官方API整理，适合用作开发参考

---

如果需要，我可以帮您继续完善具体函数调用示例或补充特殊接口说明。  
感谢您的耐心！
