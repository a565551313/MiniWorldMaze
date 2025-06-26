# 事件监听文档

## 目录

- [Wiki](#wiki)  
- [登录](#登录)  
- [事件列表](#事件列表)  
  - [世界事件 (World)](#世界事件-world)  
  - [游戏逻辑 (Game)](#游戏逻辑-game)  
  - [玩家事件 (Player)](#玩家事件-player)  
  - [生物事件 (Actor)](#生物事件-actor)  
  - [方块事件 (Block)](#方块事件-block)  
  - [道具事件 (Item)](#道具事件-item)  
  - [特效事件 (Particle)](#特效事件-particle)  

---

## Wiki

（此处可添加 Wiki 相关内容）

---

## 登录

（此处可添加登录相关说明）

---

## 事件列表

### 彼得兔  
更新时间: 2025-05-07 15:25:41

> 直接添加要监听的事件即可，无需自行创建事件管理对象。具体例子如下：

```lua
-- 游戏事件 ---
ScriptSupportEvent:registerEvent([=[Game.Start]=], Game_StartGame)
ScriptSupportEvent:registerEvent([=[Game.Run]=], Game_Update)
ScriptSupportEvent:registerEvent([=[Game.End]=], Game_GameOver)

-- 玩家事件 ---
ScriptSupportEvent:registerEvent([=[Player.Die]=], Player_Dead)
ScriptSupportEvent:registerEvent([=[Player.Revive]=], Player_Revive)
ScriptSupportEvent:registerEvent([=[Player.AddItem]=], BackPack_AddItem)

-- 方块事件 ---
ScriptSupportEvent:registerEvent([=[Block.Add]=], Block_Add)
ScriptSupportEvent:registerEvent([=[Block.DestroyBy]=], Block_Destroy)
ScriptSupportEvent:registerEvent([=[Block.Trigger]=], Block_Trigger)
```

---

## 世界事件 (World)

| 名称                | 用法描述         | 接口参数                 | 参数说明                       |
|---------------------|------------------|--------------------------|------------------------------|
| Backpack.ItemChange  | 容器内道具变化   | blockid,itemid,itemnum,x,y,z | 方块类型, 道具类型, 道具数量, 方块坐标 |
| Backpack.ItemPutIn   | 容器内有道具放入 | blockid,itemid,itemnum,x,y,z | 方块类型, 道具类型, 道具数量, 方块坐标 |
| Backpack.ItemTakeOut | 容器内有道具取出 | blockid,itemid,itemnum,x,y,z | 方块类型, 道具类型, 道具数量, 方块坐标 |

---

## 游戏逻辑 (Game)

| 名称         | 用法描述         | 接口参数     | 参数说明    |
|--------------|------------------|--------------|-------------|
| Game.Hour    | 世界小时时间变化 | hour         | 游戏小时时间 |
| Game.RunTime | 世界Tick变化     | second,ticks | 游戏分钟, 游戏秒 |

---

## 玩家事件 (Player)

| 名称                 | 用法描述           | 接口参数                         | 参数说明                           |
|----------------------|--------------------|---------------------------------|----------------------------------|
| Game.AnyPlayer.Defeat | 任一玩家失败       | eventobjid,shortix,x,y,z        | 事件玩家, 快捷栏索引, 坐标位置    |
| Game.AnyPlayer.EnterGame | 任一玩家进入    | eventobjid,shortix,x,y,z        | 事件玩家, 快捷栏索引, 坐标位置    |
| Player.AddBuff        | 玩家获得状态效果   | eventobjid,buffid,bufflvl       | 事件玩家, 状态ID, 状态等级        |
| Player.AddItem        | 玩家获得道具       | eventobjid,itemid,itemnum       | 事件玩家, 道具类型, 道具数量      |
| Player.Die            | 玩家死亡           | eventobjid,shortix,x,y,z        | 事件玩家, 快捷栏索引, 坐标位置    |
| Player.Revive         | 玩家复活           | eventobjid,shortix,x,y,z        | 事件玩家, 快捷栏索引, 坐标位置    |
| Player.InputKeyDown   | 玩家按下按键       | eventobjid,vkey                 | 事件玩家, 按下的键值              |
| Player.PickUpItem     | 玩家拾取道具       | eventobjid,toobjid,itemid,itemnum | 事件玩家, 掉落物objid, 道具类型ID, 道具数量 |

> 更多玩家事件请根据需求参考完整列表。

---

## 生物事件 (Actor)

| 名称                 | 用法描述           | 接口参数                         | 参数说明                           |
|----------------------|--------------------|---------------------------------|----------------------------------|
| Actor.AddBuff         | 生物获得状态效果   | eventobjid,actorid,buffid,bufflvl | 事件生物, 生物类型, 状态ID, 状态等级 |
| Actor.AreaIn          | 生物进入区域       | eventobjid,areaid               | 事件生物, 区域ID                  |
| Actor.AttackHit       | 攻击命中           | eventobjid,toobjid,actorid,targetactorid | 事件生物, 攻击对象, 生物类型, 攻击对象生物类型 |
| Actor.Die             | 生物死亡           | eventobjid,toobjid,actorid      | 事件生物, 攻击对象, 生物类型      |

---

## 方块事件 (Block)

| 名称             | 用法描述         | 接口参数                | 参数说明               |
|------------------|------------------|-------------------------|------------------------|
| Block.Add        | 被创建           | blockid,x,y,z           | 方块类型, 方块坐标     |
| Block.DestroyBy  | 局部方块被破坏   | eventobjid,blockid,x,y,z | 事件玩家, 方块类型, 方块坐标 |
| Block.Dig.Begin  | 方块开始被挖掘   | eventobjid,blockid,x,y,z | 事件玩家, 方块类型, 方块坐标 |
| Block.Trigger    | 活跃/通电       | eventobjid,blockid,x,y,z | 事件玩家, 方块类型, 方块坐标 |

---

## 道具事件 (Item)

| 名称                 | 用法描述           | 接口参数                         | 参数说明                           |
|----------------------|--------------------|---------------------------------|----------------------------------|
| Item.Create          | 掉落物被创建       | eventobjid,itemid,defaultvalue,x,y,z | 掉落物, 道具类型, 掉落方式, 方块坐标 |
| Item.Destroy         | 装备被破坏         | eventobjid,itemid,itemnum       | 事件对象, 道具类型, 道具数量      |
| Item.Pickup          | 掉落物被拾取       | eventobjid,toobjid,itemid,itemnum,x,y,z | 事件玩家, 掉落物objid, 道具类型, 道具数量, 方块坐标 |

---

## 特效事件 (Particle)

| 名称                   | 用法描述           | 接口参数                 | 参数说明               |
|------------------------|--------------------|--------------------------|------------------------|
| Particle.Mob.OnCreate   | 生物身上特效创建   | eventobjid,effectid,x,y,z | 事件生物, 特效类型, 方块位置 |
| Particle.Player.OnCreate| 玩家身上特效创建   | eventobjid,effectid,x,y,z | 事件玩家, 特效类型, 方块位置 |
