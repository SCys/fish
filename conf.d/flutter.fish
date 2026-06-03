[ -d /opt/flutter/bin ] && set PATH $PATH /opt/flutter/bin

if set -q in_cn; and [ "$in_cn" -eq 1 ]
    set -U FLUTTER_STORAGE_BASE_URL https://mirrors.tuna.tsinghua.edu.cn/flutter
    set -U PUB_HOSTED_URL https://mirrors.tuna.tsinghua.edu.cn/dart-pub
end
