function check_string_format(s)
    -- 定义正则表达式，表示你提到的几种可能的格式
    local patterns = {
        "^Z..$",
        "^.Z.$",
        "^..a$",
        "^...Z..$",
        "^....Z.$",
        "^.....Z$",
        "^.........$",
    }
    -- 遍历所有模式，检查是否匹配任意一个
    for _, pattern in ipairs(patterns) do
        if string.match(s, pattern) then
            return true
        end
    end
    return false
end
 
local function processor(key_event, env)
    local context = env.engine.context
    local keycode = key_event.keycode
    --末尾编码范围为a-zA-Z，末尾是其他键值时直接返回
    if (keycode < 0x61 or keycode > 0x7a) and (keycode < 0x41 or keycode > 0x5a) then
        return 2
    end
    if check_string_format(context.input) then
        context:select(0)
    end
    return 2
end

return processor
