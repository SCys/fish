[ -d /opt/flutter/bin ] && set PATH $PATH /opt/flutter/bin

if test in_cn
 set -U FLUTTER_STORAGE_BASE_URL https://mirrors.tuna.tsinghua.edu.cn/flutter
 set -U PUB_HOSTED_URL https://mirrors.tuna.tsinghua.edu.cn/dart-pub
end
