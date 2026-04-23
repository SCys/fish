[ -d $HOME/.npm-packages/bin ] && fish_add_path -gp "$HOME/.npm-packages/bin"
[ -d $NVM_BIN ] && fish_add_path $NVM_BIN

#if test $in_cn -eq 1
#    set -U NVM_NODEJS_ORG_MIRROR https://mirrors.ustc.edu.cn/node/
#end

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    fish_add_path "$PNPM_HOME"
end
