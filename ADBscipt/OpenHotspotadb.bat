@echo off
adb shell am start -n com.android.settings/.TetherSettings
adb shell input keyevent 66
adb shell input keyevent 66
adb shell am start -n com.miui.home/com.miui.home.launcher.Launcher
adb shell am kill com.android.settings