[ -d /opt/android/sdk ] && set ANDROID_SDK_ROOT /opt/android/sdk
[ -d /Users/scys/Library/Android/sdk/ ] && set ANDROID_SDK_ROOT /Users/scys/Library/Android/sdk/

set PATH $PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
set PATH $PATH:$ANDROID_SDK_ROOT/platform-tools
