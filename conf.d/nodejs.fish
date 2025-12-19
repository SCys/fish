[ -d $HOME/.npm-packages/bin ] && set PATH $PATH $HOME/.npm-packages/bin

# nvm
if [ -s "$NVM_DIR/nvm.sh" ];
        export NVM_DIR="$HOME/.nvm"
        export NVM_NODEJS_ORG_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
        . "$NVM_DIR/nvm.sh"  # This loads nvm
end
