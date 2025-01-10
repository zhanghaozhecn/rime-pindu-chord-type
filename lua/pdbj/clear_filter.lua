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
 
local function filter(input, env)
    context = env.engine.context
    for cand in input:iter() do
        yield(cand)
    end
    if check_string_format(context.input) then
        if not context:get_selected_candidate() then
            context:clear()
        end
    end
end

return filter
