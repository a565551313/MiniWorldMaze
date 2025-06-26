# 迷你世界 脚本API 完整说明文档

> 本文档基于官方Wiki及最新资料整理，包含迷你世界主要脚本API接口说明、事件监听、参数、返回值及示例，方便开发者快速查阅使用。

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
- [错误码 ErrorCode](#错误码-errorcode)

---

## 事件监听 Event

### 注册事件示例

```lua
-- 注册游戏开始事件
ScriptSupportEvent:registerEvent("Game.Start", function(event)
    print("游戏开始")
end)

-- 注册玩家死亡事件
ScriptSupportEvent:registerEvent("Player.Die", function(event)
    local playerId = event.eventobjid
    print("玩家死亡，ID:", playerId)
end)
```

### 事件参数说明示例

| 事件名           | 参数名       | 类型    | 说明                 |
| ---------------- | ------------ | ------- | -------------------- |
| Player.Die       | eventobjid   | number  | 事件玩家对象ID       |
|                  | shortix      | number  | 快捷栏索引           |
|                  | x, y, z      | number  | 玩家坐标             |

---

## 世界接口 World

### 函数列表

| 函数名                          | 参数说明                         | 返回值            | 说明                       |
| -------------------------------| --------------------------------| ----------------- | -------------------------- |
| spawnCreature(x,y,z, actorId)  | 坐标x,y,z，生物ID               | code, objids      | 生成生物                   |
| despawnCreature(objid)          | 生物对象ID                      | code              | 删除生物                   |
| getBlockID(x,y,z)               | 坐标x,y,z                      | code, blockid     | 获取方块ID                 |
| setBlockAll(x,y,z, id, data)    | 坐标x,y,z，方块ID，方块数据     | code              | 设置方块                   |
| getAllPlayer()                  | 无                             | code, playerids   | 获取所有玩家ID             |
| getAllCreature()                | 无                             | code, objids      | 获取所有生物对象ID         |

### 示例

```lua
local ret, objids = World:spawnCreature(0,10,0, 3102)
if ret == ErrorCode.OK then
    Chat:sendSystemMsg("生物生成成功")
end

World:despawnCreature(objids[1])
```

---

## 游戏逻辑接口 Game

### 主要函数

| 函数名                     | 参数                         | 返回值          | 说明                       |
| -------------------------- | ---------------------------- | --------------- | -------------------------- |
| doGameEnd()                | 无                           | code            | 结束游戏                   |
| dispatchEvent(msgid, params) | 事件ID(string), 参数(table) | code            | 派发自定义事件             |
| getDefString(id)           | 字符串ID(number)             | code, string    | 获取默认字符串             |
| setScriptVar(index, val)   | 参数索引(number), 值(number) | code            | 设置脚本变量               |
| getScriptVar(index)        | 参数索引(number)             | code, val       | 获取脚本变量               |

### 示例

```lua
-- 结束游戏
Game:doGameEnd()

-- 派发自定义事件
local ok, jsonStr = pcall(JSON.encode, JSON, {id=123, ops="aaa"})
Game:dispatchEvent("customevent", {customdata = jsonStr})

-- 获取默认字符串
local code, str = Game:getDefString(1)
if code == ErrorCode.OK then
    print("默认字符串:", str)
end
```

---

## 玩家接口 Player

### 主要函数

| 函数名                     | 参数                         | 返回值          | 说明                       |
| -------------------------- | ---------------------------- | --------------- | -------------------------- |
| getPosition()              | 无                           | code, x, y, z   | 获取玩家位置               |
| setPosition(x,y,z)         | 坐标                         | code            | 设置玩家位置               |
| getHealth()                | 无                           | code, hp        | 获取玩家生命值             |
| setHealth(hp)              | 生命值                       | code            | 设置玩家生命值             |
| getName()                  | 无                           | code, string    | 获取玩家名称               |
| sendMessage(msg)           | 消息字符串                   | code            | 发送聊天信息               |
| addItemToBackpack(itemid, count) | 道具ID，数量             | code            | 添加道具到背包             |

### 示例

```lua
local ret, x, y, z = Player:getPosition()
if ret == ErrorCode.OK then
    print("玩家位置:", x, y, z)
end

Player:setHealth(100)
Player:sendMessage("欢迎来到游戏！")
```

---

## 生物接口 Actor

### 主要函数

| 函数名                     | 参数                         | 返回值          | 说明                       |
| -------------------------- | ---------------------------- | --------------- | -------------------------- |
| getActorID(objid)          | 生物对象ID                   | code, actorId   | 获取生物类型ID             |
| getHealth(objid)           | 生物对象ID                   | code, hp        | 获取生命值                 |
| setHealth(objid, hp)       | 生物对象ID，生命值           | code            | 设置生命值                 |
| isAlive(objid)             | 生物对象ID                   | code, bool      | 判断是否存活               |
| addBuff(objid, buffid, level, duration) | 生物ID，buffID，等级，持续时间 | code | 添加状态效果         |

### 示例

```lua
local ret, actorId = Actor:getActorID(objid)
if ret == ErrorCode.OK then
    print("生物类型ID:", actorId)
end

Actor:addBuff(objid, 101, 1, 60)
```

---

## 方块接口 Block

### 主要函数

| 函数名                     | 参数                         | 返回值          | 说明                       |
| -------------------------- | ---------------------------- | --------------- | -------------------------- |
| isSolidBlock(x,y,z)        | 坐标                         | code            | 是否固体方块               |
| isLiquidBlock(x,y,z)       | 坐标                         | code            | 是否液体方块               |
| getBlockID(x,y,z)          | 坐标                         | code, blockid   | 获取方块ID                 |
| setBlockAll(x,y,z, id, data) | 坐标，方块ID，数据          | code            | 设置方块及数据             |
| destroyBlock(x,y,z, drop)  | 坐标，是否掉落(0/1)          | code            | 摧毁方块                   |

### 示例

```lua
local code = Block:isSolidBlock(0, 6, 0)
if code == ErrorCode.OK then
    print("该位置是固体方块")
end

Block:setBlockAll(0, 6, 0, 1, 0) -- 设置方块ID为1，数据为0
```

---

## 道具接口 Item

### 主要函数

| 函数名                     | 参数                         | 返回值          | 说明                       |
| -------------------------- | ---------------------------- | --------------- | -------------------------- |
| createItem(itemid, count)  | 道具ID，数量                 | code, objid     | 创建掉落物                 |
| destroyItem(objid)         | 掉落物对象ID                 | code            | 删除掉落物                 |
| getItemCount(objid)        | 掉落物对象ID                 | code, count     | 获取掉落物数量             |

---

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

## 事件详细说明（示例部分）

### 玩家事件 Player.Die

- **事件名称**：Player.Die  
- **描述**：玩家死亡时触发  
- **回调参数**：

| 参数名    | 类型   | 说明             |
| --------- | ------ | ---------------- |
| eventobjid | number | 事件玩家对象ID   |
| shortix   | number | 快捷栏索引       |
| x, y, z   | number | 玩家当前位置坐标 |

### 示例代码

```lua
local function OnPlayerDie(event)
    local playerId = event.eventobjid
    local x, y, z = event.x, event.y, event.z
    print(string.format("玩家 %d 死亡，位置：(%d,%d,%d)", playerId, x, y, z))
end

ScriptSupportEvent:registerEvent("Player.Die", OnPlayerDie)
```

---

### 生物事件 Actor.AddBuff

- **事件名称**：Actor.AddBuff  
- **描述**：生物获得状态效果时触发  
- **回调参数**：

| 参数名    | 类型   | 说明               |
| --------- | ------ | ------------------ |
| eventobjid | number | 事件生物对象ID     |
| actorid   | number | 生物类型ID         |
| buffid    | number | 状态效果ID         |
| bufflvl   | number | 状态效果等级       |

### 示例代码

```lua
local function OnActorAddBuff(event)
    print(string.format("生物 %d 获得状态 %d，等级 %d", event.eventobjid, event.buffid, event.bufflvl))
end

ScriptSupportEvent:registerEvent("Actor.AddBuff", OnActorAddBuff)
```

---

## 说明

- 所有事件回调函数均接收一个table参数，字段名对应事件参数名  
- 返回值一般为ErrorCode，具体请参考各接口说明  
- 以上为主要接口示范，完整API请根据需求补充扩展  

---

如果需要，我可以帮你继续整理剩余接口和事件，形成完整标准的README.md。  
请告诉我是否继续？
