###-begin-opencode-completions-###
#
# yargs 通用补全 + opencode -s/--session 动态 Session ID 补全（Fish shell）
# 最终修复版：-s 后面【只显示 Session IDs】，彻底排除其他参数
#

# 1. 通用 yargs 补全函数（保持不变）
function __fish_opencode_completions
    set -l args (commandline -opc)
    set -e args[1]
    opencode --get-yargs-completions $args 2>/dev/null | string match -v '$0'
end

# 2. 判断是否刚输入了 -s / --session（精确条件）
function __fish_opencode_needs_session
    set -l tokens (commandline -opc)
    if test (count $tokens) -ge 2
        set -l prev $tokens[-1]
        if string match -q -- '-s' $prev; or string match -q -- '--session' $prev
            return 0
        end
    end
    return 1
end

# 3. Session ID 补全函数（带标题描述，解析更稳健）
function __fish_opencode_sessions -d "List opencode session IDs with titles"
    opencode session list 2>/dev/null | awk '
        NR <= 2 { next }                    # 跳过表头和分隔线
        {
            id = $1
            title = ""
            for (i = 2; i <= NF; i++) title = title $i " "
            gsub(/^[ \t]+|[ \t]+$/, "", title)   # 清理空格
            if (title == "") title = "(无标题)"
            print id "\t" title
        }
    '
end

# 4. 先彻底清理所有旧补全（防止缓存残留）
complete -c opencode -e

# 5. 注册通用 yargs 补全（**关键修复**：只在「不需要 Session」时生效）
complete -c opencode \
    -n 'not __fish_opencode_needs_session' \
    -f \
    -a '(__fish_opencode_completions)'

# 6. 注册 Session 专用补全（**独占模式**，彻底屏蔽其他参数）
complete -c opencode \
    -n '__fish_opencode_needs_session' \
    -x \
    -a '(__fish_opencode_sessions)' \
    -d 'Session ID'

###-end-opencode-completions-###
