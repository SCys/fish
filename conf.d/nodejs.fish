[ -d $HOME/.npm-packages/bin ] && set PATH $PATH $HOME/.npm-packages/bin

# 检查并安装 nvm.fish 插件，同时设置清华镜像
if not contains jorgebucaran/nvm.fish (fisher list 2>/dev/null)
    echo "nvm.fish 未安装，正在通过 fisher 安装..."
    fisher install jorgebucaran/nvm.fish
else
    set -U nvm_mirror https://mirrors.ustc.edu.cn/node/
    #export NVM_NODEJS_ORG_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
    echo "已设置 nvm_mirror 为清华源：$nvm_mirror"
end
