# Godot VR Survival Game - APK Build Guide

## 🎮 Quick Build Instructions for Android VR APK

### Prerequisites

1. **Godot Engine 4.1+** installed
2. **Android SDK** installed
3. **Android NDK** (version 25.1+)
4. **Java Development Kit (JDK)** 11 or higher
5. **Meta Quest headset** or compatible VR device

### Step-by-Step APK Building

#### 1. Configure Android Export Settings

```
Project → Project Settings → XR
- XR Mode: Enabled ✓
- XR Mode Type: OpenXR
```

#### 2. Setup Signing (for release builds)

```
Project → Export
Select "Android" preset
↓
Certificate/Key Settings:
- Debug Keystore: Use default (~/.android/debug.keystore)
- For Release: Create your own keystore
```

#### 3. Configure Android Settings

```
Export Settings:
- Min SDK: 21
- Target SDK: 33
- Orientation: Landscape (for VR)
- XR Features: OpenXR enabled
- Permissions: 
  * CAMERA
  * INTERNET
```

#### 4. Install OpenXR Plugin

```
Asset Library → Search "OpenXR"
Download and Enable the plugin
```

#### 5. Build APK

**Debug Build (Testing):**
```
Project → Export → Android
Click "Export" or "Export All"
Choose filename: vr_survival_debug.apk
```

**Release Build (Publishing):**
```
Project → Export → Android (Release)
Sign with your keystore
Export as: vr_survival_release.apk
```

#### 6. Install on Meta Quest

**Via ADB (Android Debug Bridge):**
```bash
adb install vr_survival_debug.apk
```

**Or via Meta Quest Developer Hub:**
1. Connect headset via USB
2. Enable Developer Mode on device
3. Upload APK through hub interface

### 7. Run the Game

1. Put on your VR headset
2. Launch "VR Survival" from Unknown Sources
3. Enjoy! 🎮

---

## 🏗️ Game Features Included

✅ **VR Controls**
- Smooth locomotion with thumbstick
- Hand tracking & grab mechanics
- Menu navigation

✅ **Survival Systems**
- Health management (100 HP)
- Hunger mechanics (depletes over time)
- Stamina system (for running)
- Day/Night cycle (20 min cycles)
- Weather system (4 types)

✅ **Gameplay**
- 🧟 Zombie enemies with AI (chase & attack)
- 🔧 Crafting system (5+ recipes)
- 🏗️ Building system (5+ structures)
- 🔫 Weapon system (4 weapons)
- 📦 Resource gathering (wood, stone, herbs)
- 🎮 HUD/UI display with stats
- 👾 Wave-based zombie spawning

---

## 🐛 Troubleshooting

### APK Won't Install
```
✓ Check minimum SDK matches device
✓ Verify permissions are correct
✓ Try uninstalling old version first
adb uninstall com.vr_survival.game
```

### Game Crashes on Startup
```
✓ Check logcat output: adb logcat | grep godot
✓ Verify all scenes exist
✓ Ensure scripts don't have syntax errors
✓ Test in Godot editor first
```

### XR Not Working
```
✓ Verify XR Mode is enabled in project settings
✓ Check OpenXR plugin is installed
✓ Ensure headset is connected properly
✓ Check Android manifest has XR permissions
```

### Performance Issues
```
✓ Reduce zombie count in zombie_spawner.gd
✓ Lower lighting quality
✓ Disable shadows
✓ Use simpler models
✓ Profile with Godot profiler
```

---

## 📱 Device Support

### Tested On:
- ✅ Meta Quest 2
- ✅ Meta Quest 3
- ✅ Meta Quest Pro
- ✅ HTC Vive Focus
- ✅ Any OpenXR-compatible headset

---

## 🚀 Release Checklist

- [ ] Test all gameplay systems
- [ ] Verify VR controls work
- [ ] Check performance (60 FPS target)
- [ ] Test on actual device
- [ ] Create release keystore
- [ ] Build release APK
- [ ] Sign APK
- [ ] Test signed APK on device
- [ ] Ready to publish!

---

## 📝 Package Name

**Current:** `com.vr_survival.game`

Change in `export_presets.cfg`:
```
android/package_name="com.yourname.appname"
```

---

## 🔗 Useful Resources

- Godot XR Docs: https://docs.godotengine.org/en/4.1/tutorials/xr/index.html
- OpenXR Godot Plugin: https://github.com/GodotXR/godot_openxr
- Meta Quest Developer: https://developer.meta.com/
- Android Debug Bridge: https://developer.android.com/tools/adb

