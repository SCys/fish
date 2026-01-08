[ -d $HOME/.npm-packages/bin ] && set PATH $PATH $HOME/.npm-packages/bin


if test in_cn
    set -U nvm_mirror https://mirrors.ustc.edu.cn/node/
    #export NVM_NODEJS_ORG_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
end

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
