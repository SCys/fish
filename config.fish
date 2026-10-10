# vim: sw=2

# 关闭欢迎信息
set -U fish_greeting ""

#https://cloudflare.com/cdn-cgi/trace
#https://www.cloudflare-cn.com/cdn-cgi/trace
#https://www.visa.cn/cdn-cgi/trace
#https://www.shopify.com/cdn-cgi/trace
# 检测是否在中国大陆 (异步检测，避免阻塞启动)
if not set -q in_cn
  set -l __check_location (curl -s -m 2 https://www.shopify.com/cdn-cgi/trace | grep loc= | cut -d"=" -f2)
  if test "__$check_location" = "CN"
      set -U in_cn 1
  else
      set -U in_cn 2
  end
end

# 前置运行环境
if status is-interactive
  if contains edc/bass (fisher list 2>/dev/null) && test -f $HOME/.nvm/nvm.sh
    # global function to use nvm
    function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
    end

    # check version from .nvmrc eq current version
    if test -f $HOME/.nvmrc
      set nvm_current_version (nvm current)
      set nvm_desired_version (cat $HOME/.nvmrc | string trim)
      if test $nvm_current_version != $nvm_desired_version
        # echo "切换 Node.js 版本到 $nvm_desired_version ..."
        nvm use $nvm_desired_version > /dev/null
      end
    end

    [ -d $NVM_BIN ] && fish_add_path $NVM_BIN
  end
end

# >>> grok installer >>>
fish_add_path $HOME/.grok/bin
# <<< grok installer <<<
