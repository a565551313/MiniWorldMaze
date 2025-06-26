-- 迷宫生成脚本 v4.2
-- 此脚本为完整功能版，可生成包含迷宫、陷阱、宝箱、宝罐和怪物系统的场景，各系统均可通过开关控制。

-- ===== 版本信息 =====
local VERSION = "4.2"
local CHANGELOG = {
    ["4.2"] = "添加性能优化、错误处理、模块化设计和监控系统",
    ["4.1"] = "完整功能版本"
}

-- ===== 常量定义 =====
local CONSTANTS = {
    WALL = 1,
    PATH = 0,
    AIR_BLOCK = 0,
    MAX_ATTEMPTS = 100,
    MAX_DISTANCE_CHECK = 1000
}

-- ===== 配置系统 =====
local Config = {
    -- 迷宫基础配置
    maze = {
        width = 50,                    -- 迷宫总宽度（X轴方向）
        height = 5,                    -- 迷宫高度（Y轴方向层数）
        depth = 50,                    -- 迷宫总深度（Z轴方向）
        startPos = {x = 0, y = 7, z = 0}, -- 迷宫在游戏世界中的起始坐标
        pathWidth = 3,                 -- 通道宽度（玩家可通行区域）
        wallThickness = 1,             -- 墙壁厚度（分隔通道的墙体）
        selectedBlockMode = -2,        -- 方块生成模式：-2=随机2种交替，-1=全随机，0=随机1种，1~N=固定第N种
        algorithm = "aldous_broder"              -- 迷宫生成算法：dfs, prim, kruskal, recursive_division, aldous_broder
    },
    -- 各系统开关和参数配置
    systems = {
        -- 陷阱系统配置
        traps = {
            enabled = true,            -- 是否启用陷阱系统
            density = 0.50,            -- 陷阱生成密度（0-1，数值越大陷阱越多）
            minDistance = 5           -- 陷阱之间的最小距离（防止过于密集）
        },
        -- 宝箱系统配置
        chests = {
            enabled = true,            -- 是否启用宝箱系统
            density = 0.03,            -- 宝箱生成密度（0-1，数值越大宝箱越多）
            minDistance = 10           -- 宝箱之间的最小距离（防止过于密集）
        },
        -- 宝罐系统配置
        jars = {
            enabled = true,            -- 是否启用宝罐系统
            density = 0.02,            -- 宝罐生成密度（0-1，数值越大宝罐越多）
            minDistance = 10           -- 宝罐之间的最小距离（防止过于密集）
        },
        -- 怪物系统配置
        monsters = {
            enabled = false,           -- 是否启用怪物系统
            density = 0.01,            -- 怪物生成密度（0-1，数值越大怪物越多）
            minDistance = 15           -- 怪物之间的最小距离（防止过于密集）
        },
        -- 地面装饰系统配置
        floorDecor = {
            enabled = true,            -- 是否启用地面装饰
            density = 1.0,             -- 地面装饰生成密度（0-1，数值越大装饰越多）
            selectedBlockMode = -2     -- 地面装饰方块选择模式
        }
    },
    -- 方块类型配置
    blocks = {
        -- 墙壁方块列表（迷宫主体结构）
        walls = {
            { id = 667, data = 0 }, { id = 668, data = 0 },
            { id = 669, data = 0 }, { id = 670, data = 0 },
            { id = 671, data = 0 }, { id = 672, data = 0 },
            { id = 673, data = 0 }, { id = 674, data = 0 }
        },
        -- 地面装饰方块列表（通道地面装饰）
        floors = {
            { id = 667, data = 0 }, { id = 668, data = 0 },
            { id = 669, data = 0 }, { id = 670, data = 0 },
            { id = 671, data = 0 }
        },
        -- 陷阱方块列表（type=0为液态陷阱，type=1为固态陷阱）
        traps = {
            { id = 3, data = 0, type = 0 }, { id = 4, data = 0, type = 0 },
            { id = 5, data = 0, type = 0 }, { id = 6, data = 0, type = 0 },
            { id = 13, data = 0, type = 0 }, { id = 14, data = 0, type = 0 },
            { id = 17, data = 0, type = 0 }, { id = 18, data = 0, type = 0 },
            { id = 29, data = 0, type = 0 }, { id = 15, data = 0, type = 1 },
            { id = 16, data = 0, type = 1 }, { id = 19, data = 0, type = 1 },
            { id = 138, data = 0, type = 1 }, { id = 25, data = 0, type = 1 }
        },
        -- 宝罐方块ID列表
        jars = { 733, 738, 739 }
    },
    -- 怪物配置（每个怪物包含ID、名称、权重和生成数量范围）
    monsters = {
        { id = 3101, name = "野人", weight = 30, min = 1, max = 3 },
        { id = 3102, name = "野人", weight = 30, min = 1, max = 3 },
        { id = 3103, name = "野人猎手", weight = 20, min = 1, max = 2 },
        { id = 3104, name = "爆爆蛋", weight = 15, min = 1, max = 1 },
        { id = 3105, name = "大眼蛛", weight = 25, min = 1, max = 2 },
        { id = 3106, name = "地心人", weight = 10, min = 1, max = 1 }
    },
    -- 宝罐状态效果配置（宝罐被破坏时触发的状态效果）
    jarStates = {
    { id = 50, name = "生命恢复 1 级", duration = 600, maxlv = 2 },
    { id = 51, name = "疾跑 1 级", duration = 400, maxlv = 2 },
    { id = 70, name = "强力击退 1 级", duration = 600, maxlv = 2 },
    { id = 80, name = "强力攻击 1 级", duration = 200, maxlv = 2 },
    { id = 81, name = "强力防御 1 级", duration = 200, maxlv = 2 },
    { id = 82, name = "冰冻", duration = 400, maxlv = 2 }
},
    -- 宝箱配置（每个宝箱包含方块信息和对应的物品池）
    chests = {
        {
            id = 734, data = 0, type = 0, name = "普通宝箱",
            items = {
                { id = 101, min = 1, max = 5, weight = 30, name = "土块" },
                { id = 102, min = 1, max = 3, weight = 20, name = "石块" },
                { id = 103, min = 1, max = 2, weight = 15, name = "铁块" },
                { id = 104, min = 1, max = 1, weight = 10, name = "金块" },
                { id = 105, min = 1, max = 1, weight = 5, name = "钻石" },
                { id = 106, min = 1, max = 3, weight = 25, name = "木材" },
                { id = 107, min = 1, max = 2, weight = 15, name = "玻璃" },
                { id = 108, min = 1, max = 1, weight = 8, name = "红石" },
                { id = 109, min = 1, max = 1, weight = 3, name = "绿宝石" }
            }
        },
        {
            id = 735, data = 0, type = 0, name = "精制宝箱",
            items = {
                { id = 105, min = 1, max = 1, weight = 10, name = "钻石" },
                { id = 109, min = 1, max = 1, weight = 20, name = "绿宝石" },
                { id = 104, min = 1, max = 1, weight = 30, name = "金块" }
            }
        },
        {
            id = 736, data = 0, type = 0, name = "黄金宝箱",
            items = {
                { id = 101, min = 1, max = 5, weight = 40, name = "土块" },
                { id = 106, min = 1, max = 3, weight = 40, name = "木材" }
            }
        }
        -- 你可以继续添加更多类型
    }
}

-- ===== 统计信息 =====
local Stats = {
    wallsGenerated = 0,    -- 生成的墙壁方块数量
    trapsPlaced = 0,       -- 放置的陷阱数量
    chestsPlaced = 0,      -- 放置的宝箱数量
    jarsPlaced = 0,        -- 放置的宝罐数量
    monstersSpawned = 0,   -- 生成的怪物数量
    generationTime = 0,    -- 迷宫生成总耗时（秒）
    errors = 0             -- 生成过程中的错误数量
}

-- ===== 全局状态 =====
local MazeState = {
    maze = {},             -- 迷宫二维数组（1=墙壁，0=通道）
    visited = {},          -- DFS算法访问标记
    trapLocationMap = {},  -- 陷阱位置占用标记（防止重复生成）
    chestPositions = {},   -- 宝箱位置列表
    jarPositions = {},     -- 宝罐位置列表
    monsterGroups = {},    -- 怪物组信息（位置和怪物列表）
    trapPositions = {},    -- 陷阱位置列表
    totalMonsterWeight = 0 -- 所有怪物的总权重（用于随机选择）
}

-- ===== 工具函数 =====
local Utils = {}

---计算表中元素的数量
---@param t table 要计算的表
---@return number count 元素数量
function Utils.tableSize(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

---查找元素在表中的索引
---@param t table 要搜索的表
---@param value any 要查找的值
---@return number|nil index 元素索引，如果未找到返回nil
function Utils.tableIndexOf(t, value)
    for i, v in ipairs(t) do
        if v == value then
            return i
        end
    end
    return nil
end

---安全的函数执行包装器（防止脚本崩溃）
---@param func function 要执行的函数
---@param name string 函数名称（用于错误报告）
---@return boolean success 是否成功执行
---@return any result 执行结果或错误信息
function Utils.safeExecute(func, name)
    local success, result = pcall(func)
    if not success then
        Stats.errors = Stats.errors + 1
        print("错误: " .. name .. " 执行失败: " .. tostring(result))
        return false, result
    end
    return true, result
end

---性能计时器（测量函数执行时间）
---@param func function 要计时的函数
---@param name string 函数名称（用于输出显示）
---@return any result 执行结果
function Utils.timeFunction(func, name)
    local startTime = os.time() or 0
    local result = func()
    local endTime = os.time() or 0
    local duration = endTime - startTime
    print(string.format("%s 耗时: %d秒", name, duration))
    return result
end

---显示生成进度（向玩家反馈生成状态）
---@param step number 当前步骤
---@param total number 总步骤数
---@param description string 当前步骤的描述信息
function Utils.showProgress(step, total, description)
    local percentage = math.floor((step / total) * 100)
    if Chat and Chat.sendSystemMsg then
        Chat:sendSystemMsg(string.format("迷宫生成进度: %d%% - %s", percentage, description))
    else
        print(string.format("迷宫生成进度: %d%% - %s", percentage, description))
    end
end

---验证配置参数（确保配置有效）
---@param config table 配置对象
---@return boolean valid 配置是否有效
---@return string message 错误消息（如果配置无效）
function Utils.validateConfig(config)
    if not config.maze or not config.maze.width then
        return false, "缺少迷宫宽度配置"
    end
    if config.maze.width <= 0 or config.maze.depth <= 0 or config.maze.height <= 0 then
        return false, "迷宫尺寸必须大于0"
    end
    if config.maze.pathWidth <= 0 or config.maze.wallThickness <= 0 then
        return false, "通道宽度和墙壁厚度必须大于0"
    end
    return true
end

---根据模式选择方块（支持多种选择策略）
---@param blocks table 方块列表
---@param mode number 选择模式：-2=随机2种交替，-1=全随机，0=随机1种，1~N=固定第N种
---@return table selectedBlocks 选中的方块列表
function Utils.selectBlocksByMode(blocks, mode)
    if mode == -2 and #blocks >= 2 then
        local block1 = blocks[math.random(1, #blocks)]
        local block2 = blocks[math.random(1, #blocks)]
        while block1.id == block2.id and block1.data == block2.data do
            block2 = blocks[math.random(1, #blocks)]
        end
        return {block1, block2}
    elseif mode == -1 then
        return blocks
    elseif mode == 0 then
        return {blocks[math.random(1, #blocks)]}
    elseif mode > 0 and mode <= #blocks then
        return {blocks[mode]}
    else
        return {blocks[math.random(1, #blocks)]}
    end
end

---计算总权重（用于随机选择时的概率计算）
---@param items table 物品列表（每个物品需包含weight字段）
---@return number totalWeight 所有物品的总权重
function Utils.calculateTotalWeight(items)
    local total = 0
    if items then
        for _, item in ipairs(items) do
            if item and item.weight then
                total = total + item.weight
            end
        end
    end
    return total
end

-- ===== 陷阱形状定义 =====
local TrapShapes = {
    -- 液态陷阱形状（高度较低，适合地面陷阱）
    liquid = {
        -- 单竖条：单个方块
        function(x, z) return { { x = x, z = z, h = 1, w = 1, d = 1 } } end,
        -- 横三连块：水平方向3个方块
        function(x, z)
            local blocks = {}
            for dx = 0, 2 do table.insert(blocks, { x = x + dx, z = z, h = 1, w = 1, d = 1 }) end
            return blocks
        end,
        -- 十字形：中心点及上下左右各1格
        function(x, z)
            local blocks = {}
            for dz = -1, 1 do
                for dx = -1, 1 do
                    if math.abs(dx) + math.abs(dz) <= 1 then
                        table.insert(blocks, { x = x + dx, z = z + dz, h = 1, w = 1, d = 1 })
                    end
                end
            end
            return blocks
        end,
        -- L形：3个方块组成L形状
        function(x, z)
            return {
                { x = x,     z = z,     h = 1, w = 1, d = 1 },
                { x = x + 1, z = z,     h = 1, w = 1, d = 1 },
                { x = x,     z = z + 1, h = 1, w = 1, d = 1 }
            }
        end,
        -- 十字扩展形：中心点及上下左右各2格
        function(x, z)
            return {
                { x = x,     z = z,     h = 1, w = 1, d = 1 },
                { x = x + 1, z = z,     h = 1, w = 1, d = 1 },
                { x = x - 1, z = z,     h = 1, w = 1, d = 1 },
                { x = x,     z = z + 1, h = 1, w = 1, d = 1 },
                { x = x,     z = z - 1, h = 1, w = 1, d = 1 }
            }
        end
    },
    -- 固态陷阱形状（高度较高，适合立体障碍）
    solid = {
        -- 单立方块：4格高的立方体
        function(x, z) return { { x = x, z = z, h = 4, w = 1, d = 1 } } end,
        -- 十字形：中心4格高，周围2格高
        function(x, z)
    local blocks = {}
    
    -- 中心部分 (x7,y13,z7) 有3格高
    table.insert(blocks, {x = x, y, z = z, h = 3, w = 1, d = 1})
    
    -- x轴正方向延伸一格 (x8,y13,z9) 有1格高
    table.insert(blocks, {x = x + 1, y, z = z, h = 1, w = 1, d = 1})
    
    -- x轴负方向延伸一格 (x6,y13,z9) 有1格高
    table.insert(blocks, {x = x - 1, y, z = z, h = 1, w = 1, d = 1})
    
    return blocks
end,
        -- L形台阶：两个4格高的方块组成L形
        function(x, z)
            return {
                { x = x,     z = z,     h = 4, w = 1, d = 1 },
                { x = x + 1, z = z,     h = 4, w = 1, d = 1 }
            }
        end,
        -- 方柱形：2x2的4格高方柱
        function(x, z)
            local blocks = {}
            for dx = 0, 1 do
                for dz = 0, 1 do
                    table.insert(blocks, { x = x + dx, z = z + dz, h = 4, w = 1, d = 1 })
                end
            end
            return blocks
        end
    }
}

-- ===== 迷宫生成模块 =====
local MazeGenerator = {}

-- 算法名称映射
local algorithmNames = {
    dfs = "深度优先搜索算法",
    prim = "Prim算法",
    kruskal = "Kruskal算法", 
    recursive_division = "递归分割算法",
    aldous_broder = "Aldous-Broder算法"
}

---初始化迷宫数组（创建二维数组并标记所有位置为墙壁）
function MazeGenerator.initMaze()
    local stepSize = Config.maze.pathWidth + Config.maze.wallThickness
    -- 调整迷宫尺寸以确保能被步长整除
    Config.maze.width = math.floor(Config.maze.width / stepSize) * stepSize
    Config.maze.depth = math.floor(Config.maze.depth / stepSize) * stepSize

    MazeState.maze = {}
    for z = 1, Config.maze.depth do
        MazeState.maze[z] = {}
        for x = 1, Config.maze.width do
            MazeState.maze[z][x] = CONSTANTS.WALL -- 初始化为墙壁
        end
    end
end

---深度优先搜索算法生成迷宫（经典算法，生成较为线性的迷宫）
---@param x number 起始X坐标
---@param z number 起始Z坐标
function MazeGenerator.dfs(x, z)
    local dirs = { { -1, 0 }, { 1, 0 }, { 0, -1 }, { 0, 1 } } -- 四个方向：左、右、上、下
    local stepSize = Config.maze.pathWidth + Config.maze.wallThickness

    -- 标记当前区域为通道
    for iz = z, z + Config.maze.pathWidth - 1 do
        for ix = x, x + Config.maze.pathWidth - 1 do
            if iz >= 1 and iz <= Config.maze.depth and ix >= 1 and ix <= Config.maze.width then
                MazeState.maze[iz][ix] = CONSTANTS.PATH
            end
        end
    end
    MazeState.visited[x .. "," .. z] = true

    -- 随机打乱方向（确保迷宫生成的随机性）
    for i = #dirs, 2, -1 do
        local j = math.random(1, i)
        dirs[i], dirs[j] = dirs[j], dirs[i]
    end

    -- 尝试各个方向
    for _, dir in ipairs(dirs) do
        local nx, nz = x + dir[1] * stepSize, z + dir[2] * stepSize

        if nx >= 1 and nx <= Config.maze.width - Config.maze.pathWidth + 1 and
            nz >= 1 and nz <= Config.maze.depth - Config.maze.pathWidth + 1 and
            not MazeState.visited[nx .. "," .. nz] then
            
            -- 打通墙壁连接两个区域
            if dir[1] ~= 0 then -- X 方向（左右）
                local wx = dir[1] > 0 and (x + Config.maze.pathWidth) or (nx + Config.maze.pathWidth)
                for iz = z, z + Config.maze.pathWidth - 1 do
                    for iwall = 0, Config.maze.wallThickness - 1 do
                        MazeState.maze[iz][wx + iwall] = CONSTANTS.PATH
                    end
                end
            else -- Z 方向（上下）
                local wz = dir[2] > 0 and (z + Config.maze.pathWidth) or (nz + Config.maze.pathWidth)
                for ix = x, x + Config.maze.pathWidth - 1 do
                    for iwall = 0, Config.maze.wallThickness - 1 do
                        MazeState.maze[wz + iwall][ix] = CONSTANTS.PATH
                    end
                end
            end

            MazeGenerator.dfs(nx, nz) -- 递归处理下一个区域
        end
    end
end

---Prim算法生成迷宫（生成较为均匀的迷宫，难度适中）
function MazeGenerator.prim()
    local stepSize = Config.maze.pathWidth + Config.maze.wallThickness
    local cells = {}
    local walls = {}
    
    -- 初始化所有单元格
    for z = 1, Config.maze.depth, stepSize do
        for x = 1, Config.maze.width, stepSize do
            table.insert(cells, {x = x, z = z})
        end
    end
    
    -- 随机选择起始单元格
    local current = cells[math.random(1, #cells)]
    MazeState.visited[current.x .. "," .. current.z] = true
    
    -- 标记起始区域为通道
    for iz = current.z, current.z + Config.maze.pathWidth - 1 do
        for ix = current.x, current.x + Config.maze.pathWidth - 1 do
            if iz >= 1 and iz <= Config.maze.depth and ix >= 1 and ix <= Config.maze.width then
                MazeState.maze[iz][ix] = CONSTANTS.PATH
            end
        end
    end
    
    -- 添加起始单元格的墙壁
    MazeGenerator.addWalls(current.x, current.z, walls)
    
    -- Prim算法主循环
    while #walls > 0 do
        local wallIndex = math.random(1, #walls)
        local wall = walls[wallIndex]
        table.remove(walls, wallIndex)
        
        local cell1 = wall.cell1
        local cell2 = wall.cell2
        
        local visited1 = MazeState.visited[cell1.x .. "," .. cell1.z]
        local visited2 = MazeState.visited[cell2.x .. "," .. cell2.z]
        
        -- 如果只有一个单元格被访问过，则打通墙壁
        if visited1 ~= visited2 then
            local unvisitedCell = visited1 and cell2 or cell1
            
            -- 标记未访问的单元格为通道
            for iz = unvisitedCell.z, unvisitedCell.z + Config.maze.pathWidth - 1 do
                for ix = unvisitedCell.x, unvisitedCell.x + Config.maze.pathWidth - 1 do
                    if iz >= 1 and iz <= Config.maze.depth and ix >= 1 and ix <= Config.maze.width then
                        MazeState.maze[iz][ix] = CONSTANTS.PATH
                    end
                end
            end
            
            -- 打通墙壁
            if wall.direction == "horizontal" then
                local wx = wall.x
                for iz = wall.z, wall.z + Config.maze.pathWidth - 1 do
                    for iwall = 0, Config.maze.wallThickness - 1 do
                        MazeState.maze[iz][wx + iwall] = CONSTANTS.PATH
                    end
                end
            else -- vertical
                local wz = wall.z
                for ix = wall.x, wall.x + Config.maze.pathWidth - 1 do
                    for iwall = 0, Config.maze.wallThickness - 1 do
                        MazeState.maze[wz + iwall][ix] = CONSTANTS.PATH
                    end
                end
            end
            
            MazeState.visited[unvisitedCell.x .. "," .. unvisitedCell.z] = true
            MazeGenerator.addWalls(unvisitedCell.x, unvisitedCell.z, walls)
        end
    end
end

---添加单元格周围的墙壁到候选列表
---@param x number 单元格X坐标
---@param z number 单元格Z坐标
---@param walls table 墙壁列表
function MazeGenerator.addWalls(x, z, walls)
    local stepSize = Config.maze.pathWidth + Config.maze.wallThickness
    local dirs = { { -1, 0 }, { 1, 0 }, { 0, -1 }, { 0, 1 } }
    
    for _, dir in ipairs(dirs) do
        local nx, nz = x + dir[1] * stepSize, z + dir[2] * stepSize
        
        if nx >= 1 and nx <= Config.maze.width - Config.maze.pathWidth + 1 and
            nz >= 1 and nz <= Config.maze.depth - Config.maze.pathWidth + 1 then
            
            local wall = {
                x = dir[1] ~= 0 and (dir[1] > 0 and (x + Config.maze.pathWidth) or nx) or x,
                z = dir[2] ~= 0 and (dir[2] > 0 and (z + Config.maze.pathWidth) or nz) or z,
                direction = dir[1] ~= 0 and "horizontal" or "vertical",
                cell1 = {x = x, z = z},
                cell2 = {x = nx, z = nz}
            }
            
            -- 检查墙壁是否已存在
            local exists = false
            for _, existingWall in ipairs(walls) do
                if existingWall.x == wall.x and existingWall.z == wall.z and 
                   existingWall.direction == wall.direction then
                    exists = true
                    break
                end
            end
            
            if not exists then
                table.insert(walls, wall)
            end
        end
    end
end

---Kruskal算法生成迷宫（生成较为随机的迷宫，难度较高）
function MazeGenerator.kruskal()
    local stepSize = Config.maze.pathWidth + Config.maze.wallThickness
    local walls = {}
    local sets = {}
    
    -- 初始化所有单元格和墙壁
    for z = 1, Config.maze.depth, stepSize do
        for x = 1, Config.maze.width, stepSize do
            local setId = x .. "," .. z
            sets[setId] = {id = setId, cells = {{x = x, z = z}}}
            
            -- 添加水平墙壁
            if x + stepSize <= Config.maze.width then
                table.insert(walls, {
                    x = x + Config.maze.pathWidth,
                    z = z,
                    direction = "horizontal",
                    cell1 = {x = x, z = z},
                    cell2 = {x = x + stepSize, z = z}
                })
            end
            
            -- 添加垂直墙壁
            if z + stepSize <= Config.maze.depth then
                table.insert(walls, {
                    x = x,
                    z = z + Config.maze.pathWidth,
                    direction = "vertical",
                    cell1 = {x = x, z = z},
                    cell2 = {x = x, z = z + stepSize}
                })
            end
        end
    end
    
    -- 随机打乱墙壁顺序
    for i = #walls, 2, -1 do
        local j = math.random(1, i)
        walls[i], walls[j] = walls[j], walls[i]
    end
    
    -- Kruskal算法主循环
    for _, wall in ipairs(walls) do
        local set1 = MazeGenerator.findSet(wall.cell1, sets)
        local set2 = MazeGenerator.findSet(wall.cell2, sets)
        
        if set1 ~= set2 then
            -- 合并两个集合
            MazeGenerator.unionSets(set1, set2, sets)
            
            -- 打通墙壁
            if wall.direction == "horizontal" then
                for iz = wall.z, wall.z + Config.maze.pathWidth - 1 do
                    for iwall = 0, Config.maze.wallThickness - 1 do
                        MazeState.maze[iz][wall.x + iwall] = CONSTANTS.PATH
                    end
                end
            else -- vertical
                for ix = wall.x, wall.x + Config.maze.pathWidth - 1 do
                    for iwall = 0, Config.maze.wallThickness - 1 do
                        MazeState.maze[wall.z + iwall][ix] = CONSTANTS.PATH
                    end
                end
            end
        end
    end
    
    -- 标记所有单元格为通道
    for z = 1, Config.maze.depth, stepSize do
        for x = 1, Config.maze.width, stepSize do
            for iz = z, z + Config.maze.pathWidth - 1 do
                for ix = x, x + Config.maze.pathWidth - 1 do
                    if iz >= 1 and iz <= Config.maze.depth and ix >= 1 and ix <= Config.maze.width then
                        MazeState.maze[iz][ix] = CONSTANTS.PATH
                    end
                end
            end
        end
    end
end

---查找单元格所属的集合
---@param cell table 单元格
---@param sets table 集合列表
---@return table set 所属集合
function MazeGenerator.findSet(cell, sets)
    local setId = cell.x .. "," .. cell.z
    return sets[setId]
end

---合并两个集合
---@param set1 table 集合1
---@param set2 table 集合2
---@param sets table 集合列表
function MazeGenerator.unionSets(set1, set2, sets)
    -- 将set2的所有单元格合并到set1
    for _, cell in ipairs(set2.cells) do
        table.insert(set1.cells, cell)
        local setId = cell.x .. "," .. cell.z
        sets[setId] = set1
    end
end

---递归分割算法生成迷宫（生成较为规整的迷宫，难度较低）
---@param x1 number 起始X坐标
---@param z1 number 起始Z坐标
---@param x2 number 结束X坐标
---@param z2 number 结束Z坐标
function MazeGenerator.recursiveDivision(x1, z1, x2, z2)
    if x2 - x1 < Config.maze.pathWidth * 2 or z2 - z1 < Config.maze.pathWidth * 2 then
        return
    end
    
    -- 随机选择分割点
    local wallX = x1 + math.floor((x2 - x1) / 2 / (Config.maze.pathWidth + Config.maze.wallThickness)) * (Config.maze.pathWidth + Config.maze.wallThickness)
    local wallZ = z1 + math.floor((z2 - z1) / 2 / (Config.maze.pathWidth + Config.maze.wallThickness)) * (Config.maze.pathWidth + Config.maze.wallThickness)
    
    -- 创建十字形墙壁
    for x = x1, x2 do
        for z = wallZ, wallZ + Config.maze.wallThickness - 1 do
            if x >= 1 and x <= Config.maze.width and z >= 1 and z <= Config.maze.depth then
                MazeState.maze[z][x] = CONSTANTS.WALL
            end
        end
    end
    
    for z = z1, z2 do
        for x = wallX, wallX + Config.maze.wallThickness - 1 do
            if x >= 1 and x <= Config.maze.width and z >= 1 and z <= Config.maze.depth then
                MazeState.maze[z][x] = CONSTANTS.WALL
            end
        end
    end
    
    -- 在墙壁上随机开三个洞
    local holes = {}
    local directions = {"north", "south", "east", "west"}
    for i = 1, 3 do
        local dir = directions[math.random(1, #directions)]
        table.remove(directions, Utils.tableIndexOf(directions, dir))
        
        if dir == "north" then
            local holeX = wallX + math.random(0, Config.maze.pathWidth - 1)
            for z = wallZ, wallZ + Config.maze.wallThickness - 1 do
                if holeX >= 1 and holeX <= Config.maze.width and z >= 1 and z <= Config.maze.depth then
                    MazeState.maze[z][holeX] = CONSTANTS.PATH
                end
            end
        elseif dir == "south" then
            local holeX = wallX + math.random(0, Config.maze.pathWidth - 1)
            for z = wallZ, wallZ + Config.maze.wallThickness - 1 do
                if holeX >= 1 and holeX <= Config.maze.width and z >= 1 and z <= Config.maze.depth then
                    MazeState.maze[z][holeX] = CONSTANTS.PATH
                end
            end
        elseif dir == "east" then
            local holeZ = wallZ + math.random(0, Config.maze.pathWidth - 1)
            for x = wallX, wallX + Config.maze.wallThickness - 1 do
                if x >= 1 and x <= Config.maze.width and holeZ >= 1 and holeZ <= Config.maze.depth then
                    MazeState.maze[holeZ][x] = CONSTANTS.PATH
                end
            end
        elseif dir == "west" then
            local holeZ = wallZ + math.random(0, Config.maze.pathWidth - 1)
            for x = wallX, wallX + Config.maze.wallThickness - 1 do
                if x >= 1 and x <= Config.maze.width and holeZ >= 1 and holeZ <= Config.maze.depth then
                    MazeState.maze[holeZ][x] = CONSTANTS.PATH
                end
            end
        end
    end
    
    -- 递归处理四个象限
    MazeGenerator.recursiveDivision(x1, z1, wallX - 1, wallZ - 1)
    MazeGenerator.recursiveDivision(wallX + Config.maze.wallThickness, z1, x2, wallZ - 1)
    MazeGenerator.recursiveDivision(x1, wallZ + Config.maze.wallThickness, wallX - 1, z2)
    MazeGenerator.recursiveDivision(wallX + Config.maze.wallThickness, wallZ + Config.maze.wallThickness, x2, z2)
end

---Aldous-Broder算法生成迷宫（生成完全随机的迷宫，难度最高）
function MazeGenerator.aldousBroder()
    local stepSize = Config.maze.pathWidth + Config.maze.wallThickness
    local unvisited = {}
    local visited = {}
    
    -- 初始化所有单元格
    for z = 1, Config.maze.depth, stepSize do
        for x = 1, Config.maze.width, stepSize do
            table.insert(unvisited, {x = x, z = z})
        end
    end
    
    -- 随机选择起始单元格
    local current = unvisited[math.random(1, #unvisited)]
    table.remove(unvisited, Utils.tableIndexOf(unvisited, current))
    visited[current.x .. "," .. current.z] = true
    
    -- 标记起始区域为通道
    for iz = current.z, current.z + Config.maze.pathWidth - 1 do
        for ix = current.x, current.x + Config.maze.pathWidth - 1 do
            if iz >= 1 and iz <= Config.maze.depth and ix >= 1 and ix <= Config.maze.width then
                MazeState.maze[iz][ix] = CONSTANTS.PATH
            end
        end
    end
    
    -- Aldous-Broder算法主循环
    while #unvisited > 0 do
        local dirs = { { -1, 0 }, { 1, 0 }, { 0, -1 }, { 0, 1 } }
        local dir = dirs[math.random(1, #dirs)]
        local next = {x = current.x + dir[1] * stepSize, z = current.z + dir[2] * stepSize}
        
        if next.x >= 1 and next.x <= Config.maze.width - Config.maze.pathWidth + 1 and
            next.z >= 1 and next.z <= Config.maze.depth - Config.maze.pathWidth + 1 then
            
            local nextKey = next.x .. "," .. next.z
            if not visited[nextKey] then
                -- 打通墙壁
                if dir[1] ~= 0 then -- X 方向
                    local wx = dir[1] > 0 and (current.x + Config.maze.pathWidth) or (next.x + Config.maze.pathWidth)
                    for iz = current.z, current.z + Config.maze.pathWidth - 1 do
                        for iwall = 0, Config.maze.wallThickness - 1 do
                            MazeState.maze[iz][wx + iwall] = CONSTANTS.PATH
                        end
                    end
                else -- Z 方向
                    local wz = dir[2] > 0 and (current.z + Config.maze.pathWidth) or (next.z + Config.maze.pathWidth)
                    for ix = current.x, current.x + Config.maze.pathWidth - 1 do
                        for iwall = 0, Config.maze.wallThickness - 1 do
                            MazeState.maze[wz + iwall][ix] = CONSTANTS.PATH
                        end
                    end
                end
                
                -- 标记下一个区域为通道
                for iz = next.z, next.z + Config.maze.pathWidth - 1 do
                    for ix = next.x, next.x + Config.maze.pathWidth - 1 do
                        if iz >= 1 and iz <= Config.maze.depth and ix >= 1 and ix <= Config.maze.width then
                            MazeState.maze[iz][ix] = CONSTANTS.PATH
                        end
                    end
                end
                
                visited[nextKey] = true
                table.remove(unvisited, Utils.tableIndexOf(unvisited, next))
            end
            
            current = next
        end
    end
end

---根据配置选择算法生成迷宫
function MazeGenerator.generateMaze()
    local algorithm = Config.maze.algorithm
    local algorithmName = algorithmNames[algorithm] or "深度优先搜索算法"
    print("使用迷宫生成算法: " .. algorithmName)
    
    if algorithm == "dfs" then
        local startCellX = math.max(1, math.min(Config.maze.width - Config.maze.pathWidth + 1, 1))
        local startCellZ = math.max(1, math.min(Config.maze.depth - Config.maze.pathWidth + 1, 1))
        MazeGenerator.dfs(startCellX, startCellZ)
    elseif algorithm == "prim" then
        MazeGenerator.prim()
    elseif algorithm == "kruskal" then
        MazeGenerator.kruskal()
    elseif algorithm == "recursive_division" then
        MazeGenerator.recursiveDivision(1, 1, Config.maze.width, Config.maze.depth)
    elseif algorithm == "aldous_broder" then
        MazeGenerator.aldousBroder()
    else
        -- 默认使用DFS算法
        local startCellX = math.max(1, math.min(Config.maze.width - Config.maze.pathWidth + 1, 1))
        local startCellZ = math.max(1, math.min(Config.maze.depth - Config.maze.pathWidth + 1, 1))
        MazeGenerator.dfs(startCellX, startCellZ)
    end
end

---获取算法说明信息
---@return table algorithmInfo 算法信息表
function MazeGenerator.getAlgorithmInfo()
    return {
        dfs = {
            name = "深度优先搜索算法",
            description = "经典算法，生成较为线性的迷宫，路径较长但相对简单",
            difficulty = "简单",
            characteristics = "长路径，较少分支，适合新手"
        },
        prim = {
            name = "Prim算法",
            description = "生成较为均匀的迷宫，路径分布平衡",
            difficulty = "中等",
            characteristics = "平衡的路径分布，适中的复杂度"
        },
        kruskal = {
            name = "Kruskal算法",
            description = "生成较为随机的迷宫，路径复杂多变",
            difficulty = "困难",
            characteristics = "高度随机，复杂分支，挑战性较高"
        },
        recursive_division = {
            name = "递归分割算法",
            description = "生成较为规整的迷宫，结构清晰",
            difficulty = "简单",
            characteristics = "规整结构，清晰布局，易于导航"
        },
        aldous_broder = {
            name = "Aldous-Broder算法",
            description = "生成完全随机的迷宫，最高难度",
            difficulty = "噩梦",
            characteristics = "完全随机，极度复杂，适合专家玩家"
        }
    }
end

---生成迷宫墙壁（根据迷宫数组放置方块）
function MazeGenerator.generateWalls()
    local blocksToUse = Utils.selectBlocksByMode(Config.blocks.walls, Config.maze.selectedBlockMode)
    
    for y = 0, Config.maze.height - 1 do
        for z = 1, Config.maze.depth do
            for x = 1, Config.maze.width do
                if MazeState.maze[z][x] == CONSTANTS.WALL then
                    local block
                    if Config.maze.selectedBlockMode == -2 and #blocksToUse == 2 then
                        -- 交替模式：根据坐标奇偶性选择不同方块
                        block = (x + z) % 2 == 0 and blocksToUse[1] or blocksToUse[2]
                    else
                        -- 随机模式：从可用方块中随机选择
                        block = blocksToUse[math.random(1, #blocksToUse)]
                    end
                    if Block and Block.setBlockAll then
                        Block:setBlockAll(
                            Config.maze.startPos.x + x - 1,
                            Config.maze.startPos.y + y,
                            Config.maze.startPos.z + z - 1,
                            block.id, block.data
                        )
                    end
                    Stats.wallsGenerated = Stats.wallsGenerated + 1
                end
            end
        end
    end
end

---生成地面装饰（在通道地面上随机放置装饰方块）
function MazeGenerator.generateFloor()
    if not Config.systems.floorDecor.enabled then return end
    
    local blocksToUse = Utils.selectBlocksByMode(Config.blocks.floors, Config.systems.floorDecor.selectedBlockMode)
    
    for z = 1, Config.maze.depth do
        for x = 1, Config.maze.width do
            if MazeState.maze[z][x] == CONSTANTS.PATH and math.random() < Config.systems.floorDecor.density then
                local block
                if Config.systems.floorDecor.selectedBlockMode == -2 and #blocksToUse == 2 then
                    -- 交替模式：根据坐标奇偶性选择不同方块
                    block = (x + z) % 2 == 0 and blocksToUse[1] or blocksToUse[2]
                else
                    -- 随机模式：从可用方块中随机选择
                    block = blocksToUse[math.random(1, #blocksToUse)]
                end
                if Block and Block.setBlockAll then
                    Block:setBlockAll(
                        Config.maze.startPos.x + x - 1,
                        Config.maze.startPos.y - 1,
                        Config.maze.startPos.z + z - 1,
                        block.id, block.data
                    )
                end
            end
        end
    end
end

---创建迷宫出口（在迷宫边缘随机选择一个通道作为出口）
function MazeGenerator.createExit()
    local exits = {}
    -- 收集所有边缘通道位置
    for x = 1, Config.maze.width do
        if MazeState.maze[1][x] == CONSTANTS.PATH then table.insert(exits, { x = x, z = 1 }) end
        if MazeState.maze[Config.maze.depth][x] == CONSTANTS.PATH then table.insert(exits, { x = x, z = Config.maze.depth }) end
    end
    for z = 1, Config.maze.depth do
        if MazeState.maze[z][1] == CONSTANTS.PATH then table.insert(exits, { x = 1, z = z }) end
        if MazeState.maze[z][Config.maze.width] == CONSTANTS.PATH then table.insert(exits, { x = Config.maze.width, z = z }) end
    end

    -- 随机选择一个出口并清除方块
    if #exits > 0 then
        local exit = exits[math.random(1, #exits)]
        for y = 0, Config.maze.height - 1 do
            if Block and Block.setBlockAll then
                Block:setBlockAll(
                    Config.maze.startPos.x + exit.x - 1,
                    Config.maze.startPos.y + y,
                    Config.maze.startPos.z + exit.z - 1,
                    CONSTANTS.AIR_BLOCK, 0
                )
            end
        end
    end
end

-- ===== 陷阱系统模块 =====
local TrapSystem = {}

---检查位置是否太靠近现有陷阱（防止陷阱过于密集）
---@param x number X坐标
---@param z number Z坐标
---@return boolean isTooClose 是否太靠近
function TrapSystem.isTooClose(x, z)
    for _, pos in ipairs(MazeState.trapPositions) do
        if pos and pos.x and pos.z then
            local dx = math.abs(x - pos.x)
            local dz = math.abs(z - pos.z)
            if dx and dz and Config.systems.traps.minDistance then
                if dx < Config.systems.traps.minDistance and dz < Config.systems.traps.minDistance then
                    return true
                end
            end
        end
    end
    return false
end

---生成陷阱（在迷宫通道中随机放置各种形状的陷阱）
function TrapSystem.generate()
    if not Config.systems.traps.enabled then return end

    for z = 1, Config.maze.depth do
        for x = 1, Config.maze.width do
            if MazeState.maze[z][x] == CONSTANTS.PATH and math.random() < Config.systems.traps.density then
                if not TrapSystem.isTooClose(x, z) then
                    -- 随机选择陷阱类型和形状
                    local trap = Config.blocks.traps[math.random(1, #Config.blocks.traps)]
                    local shapeTable = trap.type == 0 and TrapShapes.liquid or TrapShapes.solid
                    local shape = shapeTable[math.random(1, #shapeTable)]
                    local blocks = shape(x, z)

                    -- 放置陷阱方块
                    for _, b in ipairs(blocks) do
                        if b.x >= 1 and b.x <= Config.maze.width and b.z >= 1 and b.z <= Config.maze.depth and MazeState.maze[b.z][b.x] == CONSTANTS.PATH then
                            local startYPos = trap.type == 1 and Config.maze.startPos.y or (Config.maze.startPos.y - 1)
                            for y = startYPos, startYPos + b.h - 1 do
                                if Block and Block.setBlockAll then
                                    Block:setBlockAll(
                                        Config.maze.startPos.x + b.x - 1,
                                        y,
                                        Config.maze.startPos.z + b.z - 1,
                                        trap.id, trap.data
                                    )
                                end
                                if y == Config.maze.startPos.y then
                                    -- 标记地面位置为已占用
                                    MazeState.trapLocationMap[(Config.maze.startPos.x + b.x - 1) .. "," .. (Config.maze.startPos.z + b.z - 1)] = true
                                end
                            end
                        end
                    end
                    table.insert(MazeState.trapPositions, { x = x, z = z })
                    Stats.trapsPlaced = Stats.trapsPlaced + 1
                end
            end
        end
    end
end

-- ===== 宝箱系统模块 =====
local ChestSystem = {}

---向宝箱添加随机物品（根据权重系统随机选择物品）
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param minCount number 最小物品数量
---@param maxCount number 最大物品数量
---@return table addedItems 添加的物品列表
function ChestSystem.addRandomItems(x, y, z, items, minCount, maxCount)
    local itemCount = math.random(minCount or 1, maxCount or 3)
    local addedItems = {}
    if items and #items > 0 then
        local totalWeight = Utils.calculateTotalWeight(items)
        if totalWeight > 0 then
            for i = 1, itemCount do
                local roll = math.random(1, totalWeight)
                local currentWeight = 0
                local selectedItem = nil
                for _, item in ipairs(items) do
                    if item and item.weight then
                        currentWeight = currentWeight + item.weight
                        if roll <= currentWeight then
                            selectedItem = item
                            break
                        end
                    end
                end
                if selectedItem and selectedItem.min and selectedItem.max then
                    local amount = math.random(selectedItem.min, selectedItem.max)
                    local _, relNum = 0, 0
                    if WorldContainer and WorldContainer.addItemToContainer then
                        local success, result = pcall(function()
                            return WorldContainer:addItemToContainer(x, y, z, selectedItem.id, amount)
                        end)
                        if success and result then
                            _, relNum = result
                        end
                    end
                    if relNum and relNum > 0 then
                        table.insert(addedItems, { id = selectedItem.id, amount = relNum, name = selectedItem.name or "未知物品" })
                    end
                end
            end
        end
    end
    return addedItems
end

---检查位置是否太靠近现有宝箱（防止宝箱过于密集）
---@param x number X坐标
---@param z number Z坐标
---@return boolean isTooClose 是否太靠近
function ChestSystem.isTooClose(x, z)
    for _, pos in ipairs(MazeState.chestPositions) do
        if pos and pos.x and pos.z then
            local dx = math.abs(x - (pos.x - Config.maze.startPos.x + 1))
            local dz = math.abs(z - (pos.z - Config.maze.startPos.z + 1))
            if dx and dz and Config.systems.chests.minDistance then
                if dx < Config.systems.chests.minDistance and dz < Config.systems.chests.minDistance then
                    return true
                end
            end
        end
    end
    return false
end

---生成宝箱（在迷宫通道中随机放置宝箱并填充物品）
---@return number chestCount 宝箱数量
---@return number totalItems 总物品数量
---@return table itemTypes 物品类型统计
function ChestSystem.generate()
    if not Config.systems.chests.enabled then return 0, 0, {} end
    local chestCount, totalItems, itemTypes = 0, 0, {}
    for z = 1, Config.maze.depth do
        for x = 1, Config.maze.width do
            if MazeState.maze[z][x] == CONSTANTS.PATH and math.random() < Config.systems.chests.density then
                if not ChestSystem.isTooClose(x, z) then
                    local posKey = (Config.maze.startPos.x + x - 1) .. "," .. (Config.maze.startPos.z + z - 1)
                    if not MazeState.trapLocationMap[posKey] then
                        -- 随机选择宝箱类型并放置
                        local chestObj = Config.chests[math.random(1, #Config.chests)]
                        if Block and Block.setBlockAll then
                            Block:setBlockAll(
                                Config.maze.startPos.x + x - 1,
                                Config.maze.startPos.y,
                                Config.maze.startPos.z + z - 1,
                                chestObj.id, chestObj.data or 0
                            )
                        end
                        -- 向宝箱添加随机物品（使用该宝箱的items池）
                        local addedItems = ChestSystem.addRandomItems(
                            Config.maze.startPos.x + x - 1,
                            Config.maze.startPos.y,
                            Config.maze.startPos.z + z - 1,
                            chestObj.items
                        )
                        chestCount = chestCount + 1
                        for _, item in ipairs(addedItems) do
                            totalItems = totalItems + item.amount
                            itemTypes[item.id] = (itemTypes[item.id] or 0) + item.amount
                        end
                        table.insert(MazeState.chestPositions, {
                            x = Config.maze.startPos.x + x - 1,
                            y = Config.maze.startPos.y,
                            z = Config.maze.startPos.z + z - 1,
                            items = addedItems
                        })
                        MazeState.trapLocationMap[posKey] = true
                        Stats.chestsPlaced = Stats.chestsPlaced + 1
                    end
                end
            end
        end
    end
    return chestCount, totalItems, itemTypes
end

-- ===== 宝罐系统模块 =====
local JarSystem = {}

---检查位置是否太靠近现有宝罐（防止宝罐过于密集）
---@param x number X坐标
---@param z number Z坐标
---@return boolean isTooClose 是否太靠近
function JarSystem.isTooClose(x, z)
    for _, pos in ipairs(MazeState.jarPositions) do
        if pos and pos.x and pos.z then
            local dx = math.abs(x - (pos.x - Config.maze.startPos.x + 1))
            local dz = math.abs(z - (pos.z - Config.maze.startPos.z + 1))
            if dx and dz and Config.systems.jars.minDistance then
                if dx < Config.systems.jars.minDistance and dz < Config.systems.jars.minDistance then
                    return true
                end
            end
        end
    end
    return false
end

---生成宝罐（在迷宫通道中随机放置宝罐，破坏后可获得状态效果）
function JarSystem.generate()
    if not Config.systems.jars.enabled then return end

    for z = 1, Config.maze.depth do
        for x = 1, Config.maze.width do
            if MazeState.maze[z][x] == CONSTANTS.PATH and math.random() < Config.systems.jars.density then
                if not JarSystem.isTooClose(x, z) then
                    local posKey = (Config.maze.startPos.x + x - 1) .. "," .. (Config.maze.startPos.z + z - 1)
                    if not MazeState.trapLocationMap[posKey] then
                        -- 随机选择宝罐类型并放置
                        local jarId = Config.blocks.jars[math.random(1, #Config.blocks.jars)]
                        if Block and Block.setBlockAll then
                            Block:setBlockAll(
                                Config.maze.startPos.x + x - 1,
                                Config.maze.startPos.y,
                                Config.maze.startPos.z + z - 1,
                                jarId, 0
                            )
                        end
                        -- 记录宝罐位置（用于破坏事件检测）
                        table.insert(MazeState.jarPositions, {
                            x = Config.maze.startPos.x + x - 1,
                            y = Config.maze.startPos.y,
                            z = Config.maze.startPos.z + z - 1
                        })
                        MazeState.trapLocationMap[posKey] = true
                        Stats.jarsPlaced = Stats.jarsPlaced + 1
                    end
                end
            end
        end
    end
end

-- ===== 怪物系统模块 =====
local MonsterSystem = {}

---检查位置是否太靠近现有怪物
---@param x number X坐标
---@param z number Z坐标
---@return boolean isTooClose 是否太靠近
function MonsterSystem.isTooClose(x, z)
    for _, group in ipairs(MazeState.monsterGroups) do
        if group and group.position and group.position.x and group.position.z then
            local dx = math.abs(x - group.position.x)
            local dz = math.abs(z - group.position.z)
            if dx and dz and Config.systems.monsters.minDistance then
                if dx < Config.systems.monsters.minDistance and dz < Config.systems.monsters.minDistance then
                    return true
                end
            end
        end
    end
    return false
end

---检查怪物生成位置是否有障碍物
---@param sx number 世界X坐标
---@param sz number 世界Z坐标
---@return boolean isObstructed 是否有障碍物
function MonsterSystem.isObstructed(sx, sz)
    if sx >= Config.maze.startPos.x and sx < Config.maze.startPos.x + Config.maze.width and 
       sz >= Config.maze.startPos.z and sz < Config.maze.startPos.z + Config.maze.depth then
        for y = Config.maze.startPos.y, Config.maze.startPos.y + 1 do
            local blockId = 0
            if Block and Block.getBlockID then
                blockId = Block:getBlockID(sx, y, sz)
            end
            if blockId ~= CONSTANTS.AIR_BLOCK then
                return true
            end
        end
        return false
    end
    return true
end

---生成怪物
---@return number monsterCount 怪物数量
function MonsterSystem.generate()
    if not Config.systems.monsters.enabled then return 0 end

    local monsterCount = 0

    for z = 1, Config.maze.depth do
        for x = 1, Config.maze.width do
            if MazeState.maze[z][x] == CONSTANTS.PATH and math.random() < Config.systems.monsters.density then
                local posKey = (Config.maze.startPos.x + x - 1) .. "," .. (Config.maze.startPos.z + z - 1)
                if not MazeState.trapLocationMap[posKey] and not MonsterSystem.isTooClose(x, z) then
                    local roll = math.random(1, MazeState.totalMonsterWeight)
                    local currentWeight = 0
                    local selectedMonster = nil

                    for _, m in ipairs(Config.monsters) do
                        currentWeight = currentWeight + m.weight
                        if roll <= currentWeight then
                            selectedMonster = m
                            break
                        end
                    end

                    if selectedMonster then
                        local spawnCount = math.random(selectedMonster.min, selectedMonster.max)
                        local monsters = {}

                        for i = 1, spawnCount do
                            local ox, oz = math.random(-1, 1), math.random(-1, 1)
                            local sx, sz = Config.maze.startPos.x + x - 1 + ox, Config.maze.startPos.z + z - 1 + oz

                            if not MonsterSystem.isObstructed(sx, sz) then
                                local entityId = 0
                                if World and World.spawnCreature then
                                    entityId = World:spawnCreature(sx, Config.maze.startPos.y, sz, selectedMonster.id)
                                end

                                if entityId ~= 0 then
                                    table.insert(monsters, {
                                        id = entityId,
                                        type = selectedMonster.id,
                                        x = sx,
                                        y = Config.maze.startPos.y,
                                        z = sz
                                    })
                                    monsterCount = monsterCount + 1
                                    print("生成怪物类型", selectedMonster.id, "在", sx, Config.maze.startPos.y, sz)
                                end
                            end
                        end

                        if #monsters > 0 then
                            table.insert(MazeState.monsterGroups, {
                                position = { x = Config.maze.startPos.x + x - 1, z = Config.maze.startPos.z + z - 1 },
                                monsters = monsters,
                                type = selectedMonster.id
                            })
                            MazeState.trapLocationMap[posKey] = true
                        end
                    end
                end
            end
        end
    end

    Stats.monstersSpawned = monsterCount
    return monsterCount
end

-- ===== 事件处理模块 =====
local EventHandler = {}

---处理方块破坏事件（检测宝罐破坏和怪物死亡）
---@param event table 事件对象（包含破坏位置和破坏者信息）
function EventHandler.onBlockDestroy(event)
    -- 宝罐破坏检测（给予玩家状态效果）
    if Config.systems.jars.enabled then
        for i, jar in ipairs(MazeState.jarPositions) do
            if event.x == jar.x and event.y == jar.y and event.z == jar.z then
                -- 随机选择一个状态效果
                local state = Config.jarStates[math.random(1, #Config.jarStates)]
                
                -- 随机计算等级（1 到 maxlv）
                local randomLv = math.random(1, state.maxlv)
                
                if Buff and Buff.addBuff then
                    -- 假设 skillLevel = randomLv（如果游戏支持等级参数）
                    local code=Buff:addBuff(event.eventobjid, state.id, randomLv, state.duration)
                    if code == ErrorCode.OK then
    print('buff执行成功：'  )
else
    print('buff执行失败')
end
                    
                    -- 显示消息（可选：显示等级）
                    if Chat and Chat.sendSystemMsg then
                        Chat:sendSystemMsg("获得状态:" .. state.name .. " Lv." .. randomLv .. " (" .. state.duration / 20 .. "秒)")
                    end
                end
                
                -- 播放特效
                if World and World.playParticalEffect then
                    World:playParticalEffect(jar.x, jar.y, jar.z, 1001, 1, 3, true)
                end
                table.remove(MazeState.jarPositions, i)
                break
            end
        end
    end

    -- 怪物死亡检测（可能掉落宝箱）
    if Config.systems.monsters.enabled then
        for gi, group in ipairs(MazeState.monsterGroups) do
            for mi, monster in ipairs(group.monsters) do
                if monster.id == event.eventobjid then
                    -- 30%概率掉落宝箱
                    if math.random() <= 0.3 and Config.systems.chests.enabled then
                        local chestObj = Config.chests[math.random(1, #Config.chests)]
                        if Block and Block.setBlockAll then
                            Block:setBlockAll(monster.x, monster.y, monster.z, chestObj.id, chestObj.data or 0)
                        end
                        local items = ChestSystem.addRandomItems(monster.x, monster.y, monster.z, chestObj.items)
                        if Chat and Chat.sendSystemMsg then
                            Chat:sendSystemMsg("怪物掉落宝箱！内含" .. #items .. "件物品")
                        end
                    end

                    -- 从怪物组中移除死亡的怪物
                    table.remove(group.monsters, mi)
                    if #group.monsters == 0 then table.remove(MazeState.monsterGroups, gi) end
                    break
                end
            end
        end
    end
end


-- ===== 主生成函数 =====
---生成迷宫的主函数（协调所有系统生成完整的迷宫场景）
---@return boolean success 是否成功生成
---@return string message 生成结果消息
function generateMaze()
    print("迷宫生成开始 - 版本 " .. VERSION)
    
    -- 验证配置参数
    local valid, message = Utils.validateConfig(Config)
    if not valid then
        print("配置验证失败: " .. message)
        return false, message
    end

    -- 初始化权重系统（用于随机选择）
    MazeState.totalMonsterWeight = Utils.calculateTotalWeight(Config.monsters)

    -- 重置所有状态数据
    MazeState.visited = {}
    MazeState.trapLocationMap = {}
    MazeState.chestPositions = {}
    MazeState.jarPositions = {}
    MazeState.monsterGroups = {}
    MazeState.trapPositions = {}
    
    -- 重置统计信息
    Stats.wallsGenerated = 0
    Stats.trapsPlaced = 0
    Stats.chestsPlaced = 0
    Stats.jarsPlaced = 0
    Stats.monstersSpawned = 0
    Stats.errors = 0

    local startTime = os.time() or 0

    -- 生成迷宫基础结构
    Utils.safeExecute(function()
        Utils.showProgress(1, 8, "初始化迷宫")
        MazeGenerator.initMaze()
        
        Utils.showProgress(2, 8, "生成迷宫通道")
        MazeGenerator.generateMaze()
    end, "迷宫结构生成")

    -- 生成迷宫墙壁
    Utils.safeExecute(function()
        Utils.showProgress(3, 8, "生成墙壁")
        MazeGenerator.generateWalls()
    end, "墙壁生成")

    -- 生成地面装饰
    Utils.safeExecute(function()
        Utils.showProgress(4, 8, "生成地面装饰")
        MazeGenerator.generateFloor()
    end, "地面装饰生成")

    -- 生成陷阱系统
    Utils.safeExecute(function()
        Utils.showProgress(5, 8, "生成陷阱")
        TrapSystem.generate()
    end, "陷阱生成")

    -- 生成宝箱系统
    local chestCount, totalItems, itemTypes = 0, 0, {}
    Utils.safeExecute(function()
        Utils.showProgress(6, 8, "生成宝箱")
        chestCount, totalItems, itemTypes = ChestSystem.generate()
    end, "宝箱生成")

    -- 生成宝罐系统
    Utils.safeExecute(function()
        Utils.showProgress(7, 8, "生成宝罐")
        JarSystem.generate()
    end, "宝罐生成")

    -- 生成怪物系统
    local monsterCount = 0
    Utils.safeExecute(function()
        Utils.showProgress(8, 8, "生成怪物")
        monsterCount = MonsterSystem.generate()
    end, "怪物生成")

    -- 创建迷宫出口
    Utils.safeExecute(function()
        MazeGenerator.createExit()
    end, "出口创建")

    -- 注册游戏事件（用于处理宝罐破坏和怪物死亡）
    if Config.systems.jars.enabled or Config.systems.monsters.enabled then
        if ScriptSupportEvent and ScriptSupportEvent.registerEvent then
            ScriptSupportEvent:registerEvent([=[Block.DestroyBy]=], EventHandler.onBlockDestroy)
        end
    end

    -- 计算总生成时间
    Stats.generationTime = (os.time() or 0) - startTime

    -- 生成详细的统计报告
    local itemStats = ""
    if Config.systems.chests.enabled and itemTypes and next(itemTypes) then
        for id, count in pairs(itemTypes) do
            local itemName = "未知物品"
            for _, chest in ipairs(Config.chests) do
                for _, item in ipairs(chest.items) do
                    if item.id == id then
                        itemName = item.name
                        break
                    end
                end
                if itemName ~= "未知物品" then break end
            end
            itemStats = itemStats .. string.format("\n %s: %d 个", itemName, count)
        end
    end

    local reportMessage = string.format(
        [[=== 迷宫生成完成 ===
        版本: %s | 生成时间: %d秒
        算法: %s
        尺寸: %dx%dx%d | 起点: %d,%d,%d
        墙壁: %d 种 | 通道宽度: %d 格
        陷阱: %s | 宝箱: %s
        宝罐: %s | 怪物: %s
        地面装饰: %s
        错误数: %d
        出口已生成！%s]],
        VERSION, Stats.generationTime,
        algorithmNames[Config.maze.algorithm] or "深度优先搜索算法",
        Config.maze.width, Config.maze.depth, Config.maze.height,
        Config.maze.startPos.x, Config.maze.startPos.y, Config.maze.startPos.z,
        #Config.blocks.walls, Config.maze.pathWidth,
        Config.systems.traps.enabled and (Stats.trapsPlaced .. "组") or "关闭",
        Config.systems.chests.enabled and (Stats.chestsPlaced .. "个") or "关闭",
        Config.systems.jars.enabled and (Stats.jarsPlaced .. "个") or "关闭",
        Config.systems.monsters.enabled and (Stats.monstersSpawned .. "只 (" .. #Config.monsters .. "种)") or "关闭",
        Config.systems.floorDecor.enabled and ("开启，密度:" .. Config.systems.floorDecor.density) or "关闭",
        Stats.errors,
        itemStats
    )

    -- 向玩家发送生成报告
    if Chat and Chat.sendSystemMsg then
        Chat:sendSystemMsg(reportMessage)
    else
        print(reportMessage)
    end

    return true, "迷宫生成成功"
end

-- ===== 游戏事件注册 =====
-- 注册游戏开始事件（自动生成迷宫）
if ScriptSupportEvent and ScriptSupportEvent.registerEvent then
    ScriptSupportEvent:registerEvent([=[Game.Start]=], function(event)
        Utils.timeFunction(generateMaze, "迷宫生成")
    end)
    -- 注册聊天输入事件，监听热重载指令（改为Player.InputContent）
    ScriptSupportEvent:registerEvent([=[Player.InputContent]=], onPlayerInputContent)
end

-- ===== 脚本启动 =====
-- 输出加载信息并立即开始生成迷宫
print("迷宫生成脚本已加载 - 版本 " .. VERSION)
print("当前迷宫生成算法: " .. (algorithmNames[Config.maze.algorithm] or "深度优先搜索算法"))
Utils.timeFunction(generateMaze, "迷宫生成")

---显示所有可用的迷宫生成算法
function MazeGenerator.showAvailableAlgorithms()
    local info = MazeGenerator.getAlgorithmInfo()
    print("=== 可用的迷宫生成算法 ===")
    
    for key, algorithm in pairs(info) do
        print(string.format("算法: %s (%s)", algorithm.name, key))
        print(string.format("难度: %s", algorithm.difficulty))
        print(string.format("描述: %s", algorithm.description))
        print(string.format("特点: %s", algorithm.characteristics))
        print("---")
    end
    
    print("使用方法: 修改 Config.maze.algorithm 的值来切换算法")
    print("当前算法: " .. (algorithmNames[Config.maze.algorithm] or "深度优先搜索算法"))
end

-- ===== 热重载功能 =====
local function resetAllGameState()
    -- 重置所有全局状态和统计信息
    MazeState.visited = {}
    MazeState.trapLocationMap = {}
    MazeState.chestPositions = {}
    MazeState.jarPositions = {}
    MazeState.monsterGroups = {}
    MazeState.trapPositions = {}
    MazeState.totalMonsterWeight = Utils.calculateTotalWeight(Config.monsters)
    Stats.wallsGenerated = 0
    Stats.trapsPlaced = 0
    Stats.chestsPlaced = 0
    Stats.jarsPlaced = 0
    Stats.monstersSpawned = 0
    Stats.generationTime = 0
    Stats.errors = 0
    -- 以后新加的全局状态和统计信息请在此处补充
end

-- 聊天输入事件回调（兼容两种参数风格，防刷屏）
local function onPlayerInputContent(eventobjid, content)
    -- 兼容 table 参数风格
    if type(eventobjid) == "table" then
        local event = eventobjid
        content = event and (event.content or event.EventString or event.msgStr)
        eventobjid = event and (event.eventobjid or event.TriggerByPlayer)
    end

    -- 只处理有内容且以"/"开头的输入，防止刷屏
    if not content or content == "" or string.sub(content, 1, 1) ~= "/" then return end

    print("玩家输入内容：", eventobjid, content)
    if Chat and Chat.sendSystemMsg then
        Chat:sendSystemMsg("[调试] 玩家输入内容：" .. content)
    end

    -- 热重载逻辑
    if content == "/热重载" or content == "/reload" then
        local hostUin = nil
        if Player and Player.getHostUin then
            local r1, r2 = Player:getHostUin()
            print("getHostUin返回值 r1:", r1, "r2:", r2)
            if r2 == nil then
                hostUin = r1
            else
                hostUin = r2
            end
        else
            print("Player.getHostUin 不可用")
        end
        print("eventobjid:", eventobjid, "hostUin:", hostUin)
        if hostUin and eventobjid == hostUin then
            print("房主校验通过，执行热重载")
            if resetAllGameState then resetAllGameState() end
            if Utils and Utils.timeFunction then
                Utils.timeFunction(generateMaze, "迷宫热重载")
            elseif generateMaze then
                generateMaze()
            end
            if Chat and Chat.sendSystemMsg then
                Chat:sendSystemMsg("[系统] 热重载完成！")
            else
                print("[系统] 热重载完成！")
            end
        else
            print("房主校验失败")
        end
    end
end

-- 只注册一个事件（哪个能用就注册哪个，建议先试 Player.InputContent）
if ScriptSupportEvent and ScriptSupportEvent.registerEvent then
    ScriptSupportEvent:registerEvent([=[Player.InputContent]=], onPlayerInputContent)
    print("已注册 Player.InputContent 事件")
end