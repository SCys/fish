# 前置运行环境
if status is-interactive
  # 关闭欢迎信息
  set -U fish_greeting ""

  # 检测是否在中国大陆
  set -U in_cn false
  set __check_location (curl -s -m 1.2 https://cloudflare.com/cdn-cgi/trace|grep loc=|cut -d'=' -f2)
  if test $__check_location = "CN"
    set -U in_cn true
  end

  # 检查并安装 nvm.fish 插件，同时设置清华镜像
  if not contains jorgebucaran/nvm.fish (fisher list 2>/dev/null)
      echo "nvm.fish 未安装，正在通过 fisher 安装..."
      fisher install jorgebucaran/nvm.fish
  end
end

# 实际运行环境
if contains jorgebucaran/nvm.fish (fisher list 2>/dev/null) && test -f $HOME/.nvmrc
  # check version from .nvmrc eq current version
  set nvm_current_version (nvm current)
  set nvm_desired_version (cat $HOME/.nvmrc | string trim)
  if test $nvm_current_version != $nvm_desired_version
    echo "切换 Node.js 版本到 $nvm_desired_version ..."
    nvm use $nvm_desired_version > /dev/null
  end
end
