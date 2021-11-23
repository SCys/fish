[ -d /opt/android/sdk ] && set ANDROID_SDK_ROOT /opt/android/sdk
[ -d /Users/scys/Library/Android/sdk/ ] && set ANDROID_SDK_ROOT /Users/scys/Library/Android/sdk/

[ -d $ANDROID_SDK_ROOT/platform-tools ] && fish_add_path $ANDROID_SDK_ROOT/platform-tools
[ -d $ANDROID_SDK_ROOT/cmdline-tools/latest/bin ] && fish_add_path $ANDROID_SDK_ROOT/cmdline-tools/latest/bin

