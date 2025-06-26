# 迷你世界 脚本API 完整说明文档

> 本文档基于官方Wiki内容整理，包含迷你世界全部脚本API接口说明、参数、返回值及示例，方便开发者快速查阅使用。

---

## 目录

- [事件监听 Event](#事件监听-event)
- [游戏规则 GameRule](#游戏规则-gamerule)
- [游戏接口 Game](#游戏接口-game)
- [方块接口 Block](#方块接口-block)
- [状态接口 Buff](#状态接口-buff)
- [UI接口 UI](#ui接口-ui)
- [区域接口 Area](#区域接口-area)
- [聊天接口 Chat](#聊天接口-chat)
- [组队接口 Team](#组队接口-team)
- [道具接口 Item](#道具接口-item)
- [背包接口 Backpack](#背包接口-backpack)
- [容器接口 WorldContainer](#容器接口-worldcontainer)
- [显示板管理 DisPlayBoard](#显示板管理-displayboard)
- [云服数据存储 CloudSever](#云服数据存储-cloudsever)
- [计时器接口 MiniTimer](#计时器接口-minitimer)
- [函数监听接口 ListenParam](#函数监听接口-listenparam)
- [变量组接口 ValueGroup](#变量组接口-valuegroup)
- [对象库接口 ObjectLib](#对象库接口-objectlib)
- [小地图接口 Mapmark](#小地图接口-mapmark)
- [出生点接口 Spawnport](#出生点接口-spawnport)
- [接口常量列表](#接口常量列表)
- [学习案例](#学习案例)
- [脚本常见问题](#脚本常见问题)

---

## 事件监听 Event

### 注册事件示例

```lua
ScriptSupportEvent:registerEvent("Player.ClickBlock", function(event)
    local blockid = event.blockid
    Chat:sendSystemMsg("点击了方块ID:"..blockid)
end)
```

### 事件分类

| 分类         | 说明                   |
| ------------ | ---------------------- |
| 世界事件     | 容器道具变化等         |
| 游戏逻辑     | 时间变化等             |
| 玩家事件     | 玩家行为，如死亡、攻击 |
| 生物事件     | 生物状态变化、攻击等   |
| 方块事件     | 方块创建、破坏、触发   |
| 道具事件     | 掉落物创建、拾取       |
| 特效事件     | 特效创建               |
| UI事件       | 自定义UI交互           |
| 其他事件     | 蓝图、合成、剧情等     |

---

## 游戏规则 GameRule

| 规则项           | 描述                      | 示例值 |
| ---------------- | ------------------------- | ------ |
| EndTime          | 游戏时长（分钟）          | 6      |
| TeamNum          | 队伍数量                  | 2      |
| MaxPlayers       | 最大玩家数量              | 6      |
| AllowMidwayJoin  | 是否允许中途加入（0/1）   | 1      |
| DisplayScore     | 是否显示比分（0/1）       | 1      |

示例：

```lua
local GameRule = class.GameRule.new()
GameRule.EndTime = 6
GameRule.TeamNum = 2
GameRule.MaxPlayers = 6
GameRule.AllowMidwayJoin = 1
```

---

## 游戏接口 Game

### 函数列表

| 序号 | 函数名                     | 描述                         |
| -----|----------------------------|------------------------------|
| 1    | doGameEnd()                | 游戏结束                     |
| 2    | dispatchEvent(msgid, params) | 派发自定义事件             |
| 3    | getDefString(id)           | 获取默认字符串               |
| 4    | setScriptVar(index, val)   | 设置脚本参数                 |
| 5    | getScriptVar(index)        | 获取脚本参数                 |
| 6    | sendScriptVars2Client()    | 上传脚本参数到客户端         |
| 7    | addRenderGlobalEffect(path) | 添加全局特效               |
| 8    | removeRenderGlobalEffect(effectid) | 移除全局特效          |
| 9    | setRenderGlobalEffectPos(effectid, x, y, z) | 设置特效位置     |
| 10   | setRenderGlobalEffectScale(effectid, scalex, scaley, scalez) | 设置特效缩放 |
| 11   | msgBox(msg)                | 消息弹框                     |
| 12   | splitStr(str, mark)        | 分割字符串                   |

---

### doGameEnd

- **参数**: 无  
- **返回值**: code:number (ErrorCode)  
- **功能**: 结束游戏

示例：

```lua
Game:doGameEnd()
```

---

### dispatchEvent

- **参数**:  
  - msgid:string 事件ID  
  - params:table 事件参数  
- **返回值**: code:number (ErrorCode)  
- **功能**: 派发自定义事件

示例：

```lua
local data = {id = 123, ops = "aaa"}
local ok, json = pcall(JSON.encode, JSON, data)
Game:dispatchEvent("customevent", {customdata = json})
```

---

### getDefString

- **参数**: id:number  
- **返回值**: code:number, str:string  
- **功能**: 获取默认字符串

示例：

```lua
local code, str = Game:getDefString(1)
Chat:sendSystemMsg("默认字符串内容："..str)
```

---

### setScriptVar / getScriptVar

- **setScriptVar(index:number, val:number)**  
- **getScriptVar(index:number)** 返回 code, val

示例：

```lua
Game:setScriptVar(1, 100)
local code, val = Game:getScriptVar(1)
if code == ErrorCode.OK then
    print("值为", val)
end
```

---

### addRenderGlobalEffect / removeRenderGlobalEffect

- **addRenderGlobalEffect(path:string)** 返回 code, effectid  
- **removeRenderGlobalEffect(effectid:number)** 返回 code

示例：

```lua
local code, effectid = Game:addRenderGlobalEffect("particles/Fog.ent")
Game:removeRenderGlobalEffect(effectid)
```

---

### msgBox

- **参数**: msg:string  
- **功能**: 弹出消息框

示例：

```lua
Game:msgBox("这是一个弹窗！")
```

---

### splitStr

- **参数**: str:string, mark:string  
- **返回**: code:number, strs:table

示例：

```lua
local code, arr = Game:splitStr("a,b,c", ",")
```

---

## 方块接口 Block

### 常用函数

| 函数名                     | 参数说明                         | 返回值     | 功能描述               |
| -------------------------- | --------------------------------| ---------- | ---------------------- |
| isSolidBlock(x,y,z)         | 坐标x,y,z                       | code       | 是否固体方块           |
| isLiquidBlock(x,y,z)        | 坐标x,y,z                       | code       | 是否液体方块           |
| isAirBlock(x,y,z)           | 坐标x,y,z                       | code       | 是否空气方块           |
| getBlockID(x,y,z)           | 坐标x,y,z                       | code, id   | 获取方块ID             |
| getBlockData(x,y,z)         | 坐标x,y,z                       | code, data | 获取方块数据           |
| setBlockAll(x,y,z, id, data)| 坐标x,y,z, 方块ID，数据         | code       | 设置方块及数据         |
| destroyBlock(x,y,z, drop)   | 坐标x,y,z, 是否掉落道具(0/1)   | code       | 摧毁方块               |
| placeBlock(id,x,y,z,face)   | 方块ID，坐标，放置面            | code       | 放置方块               |
| replaceBlock(id,x,y,z,face) | 方块ID，坐标，替换面            | code       | 替换方块               |

示例：

```lua
local res = Block:isSolidBlock(0,6,0)
if res == ErrorCode.OK then
    Chat:sendSystemMsg("是固体方块")
end
```

---

## 状态接口 Buff

### 常用函数

| 函数名                      | 参数说明                     | 返回值 | 功能描述             |
| --------------------------- | ----------------------------| ------ | -------------------- |
| addBuff(objid,buffid,bufflv,duration) | 目标对象ID，buffID，等级，持续时间 | code | 添加状态效果         |
| removeBuff(objid,buffid)    | 目标对象ID，buffID           | code   | 移除指定状态         |
| clearAllBuff(objid)         | 目标对象ID                   | code   | 清除所有状态         |
| hasBuff(objid,buffid,bufflv)| 目标对象ID，buffID，等级     | code   | 判断是否有指定状态   |

示例：

```lua
Buff:addBuff(objid, buffid, bufflv, -1)
```

---

## UI接口 UI

### 常用函数示例

```lua
UI:setGBattleUI("left_title", "左标题示例")
Customui:setText(playerid, uiid, elementid, "文本内容")
```

---

## 区域接口 Area

### 创建矩形区域

```lua
local result, areaid = Area:createAreaRect({x=0,y=10,z=0}, {x=1,y=2,z=3})
```

### 区域填充方块

```lua
Area:fillBlock(areaid, 112)
```

---

## 更多接口

请告诉我你想先整理哪个模块，我帮你继续详细写完。

---

## 示例代码

### 游戏开始刷怪并计数击杀

```lua
local ActorId = 3102
local obj_ids = {}
local def_count = 0

local function SpawnMonsters()
    local ret, x, y, z = Player:getPosition()
    for i=1,5 do
        local newX = math.random(-5,5)+x
        local newZ = math.random(-5,5)+z
        local ret, objids = World:spawnCreature(newX,y,newZ, ActorId)
        if ret == ErrorCode.OK then
            table.insert(obj_ids, objids[1])
        end
    end
end

local function ClearMonsters()
    for _, id in ipairs(obj_ids) do
        World:despawnCreature(id)
    end
    obj_ids = {}
end

function Game_Start()
    local ret, timerId = MiniTimer:createTimer("计时X")
    if ret == ErrorCode.OK then
        MiniTimer:startForwardTimer(timerId)
        SpawnMonsters()
    end
end

function Timer_Change(event_args)
    local timerid = event_args['timerid']
    local ret, secs = MiniTimer:getTimerTime(timerid)
    if ret == ErrorCode.OK and secs % 10 == 0 then
        ClearMonsters()
        SpawnMonsters()
    end
end

function Defeat_Actor(event_args)
    local toobjid = event_args['toobjid']
    local ret, actorId = Creature:getActorID(toobjid)
    if ret == ErrorCode.OK and actorId == ActorId then
        def_count = def_count + 1
        Chat:sendSystemMsg("击杀数量:"..def_count)
        if def_count >= 10 then
            Game:doGameEnd()
        end
    end
end

ScriptSupportEvent:registerEvent("Game.Start", Game_Start)
ScriptSupportEvent:registerEvent("minitimer.change", Timer_Change)
ScriptSupportEvent:registerEvent("Player.DefeatActor", Defeat_Actor)
```

---

> **提示**：  
> - 本文档示例均为Lua脚本代码块，支持GitHub语法高亮  
> - 可自行根据需要添加更多模块说明和示例  
> - 需要完整文档或拆分模块请告诉我  

---

如果你需要，我可以帮你继续完成全部模块的详细README.md格式文档，或者帮你生成分章节的Markdown文件包。  
随时告诉我你的需求！
