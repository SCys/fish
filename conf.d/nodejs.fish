[ -d $HOME/.npm-packages/bin ] && fish_add_path -gp "$HOME/.npm-packages/bin"

if test in_cn
    set -U nvm_mirror https://mirrors.ustc.edu.cn/node/
    #export NVM_NODEJS_ORG_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
end

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    #set -gx PATH "$PNPM_HOME" $PATH
    fish_add_path "$PNPM_HOME"
end
