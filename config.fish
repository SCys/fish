# 前置运行环境
if status is-interactive
  # 关闭欢迎信息
  set -U fish_greeting ""

  # 检测是否在中国大陆
  set -U in_cn false
  set -U __check_location ""
  #set __check_location (curl -s -m 1.2 https://cloudflare.com/cdn-cgi/trace|grep loc=|cut -d'=' -f2)
  #set __check_location (curl -s -m 1.2 https://www.cloudflare-cn.com/cdn-cgi/trace|grep loc=|cut -d'=' -f2)
  #set __check_location (curl -s -m 1.2 https://www.visa.cn/cdn-cgi/trace|grep loc=|cut -d'=' -f2)
  set __check_location (curl -s -m 0.8 https://www.shopify.com/cdn-cgi/trace|grep loc=|cut -d'=' -f2)
  if test -n "$__check_location" -a "$__check_location" = "CN"
    set -U in_cn true
  end
end

# 实际运行环境
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
      echo "切换 Node.js 版本到 $nvm_desired_version ..."
      nvm use $nvm_desired_version > /dev/null
    end
  end
end

