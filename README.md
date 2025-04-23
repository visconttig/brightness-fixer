# 💡 Auto-Brightness-Fixer (AHK v1)

### _Because nothing says "good morning" like your screen pretending to be the sun._

---

## 🛠️ What This Script Does

Every time you boot your computer, **Windows plays a fun game** called “Let’s mess with brightness settings!” Sometimes it resets it. Sometimes it disables the slider entirely. And sometimes it just… blinds you.

This AutoHotKey script fixes that nonsense. It:

- **Immediately sets brightness to 0%** on startup.
- **Gives you keyboard shortcuts** to adjust brightness on the fly.
- **Skips interfering** while you’re using code editors like **VS Code** or **IntelliJ IDEA**.

All with zero drama and maximum relief for your tired eyeballs.

---

## ⚡ Features

- 🔁 **Auto-launches on startup** with a shortcut in your `Startup` folder
- 🌗 **Instantly sets brightness to 0%** to protect your corneas
- 🎹 **Hotkeys for fast manual control**
- 🧠 **Ignores brightness keys when coding** (because **copy-paste matters more**)

---

## 🎹 **Hotkeys**

| **Shortcut**         | **Action**                                |
| -------------------- | ----------------------------------------- |
| **Ctrl + H**         | Increase brightness by **5%**             |
| **Ctrl + J**         | Decrease brightness by **5%**             |
| **Ctrl + B**         | Set brightness to **100%** (Full Blast)   |
| **Ctrl + Shift + B** | Set brightness to **0%** (Total Darkness) |

> ⚠️ These shortcuts are **disabled while using VS Code or IntelliJ IDEA**, to avoid annoying interference.

---

## 🚀 How It Works

At the top of the script:

```autohotkey
FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir%
```

☝️ This drops a shortcut to itself in your Startup folder. That means the script runs every time you boot — no setup, no reminders, no stress.

Then:

```autohotkey
ChangeBrightness(0)
```

✨ Boom. Instant darkness. Your screen won’t ambush you anymore.

Brightness control is done through **WMI** (Windows Management Instrumentation), which talks directly to your monitor like a polite tech butler.

---

## 👨‍💻 Code Editor Awareness

```autohotkey
GroupAdd, programs, ahk_exe Code.exe
GroupAdd, programs, ahk_exe idea64.exe

#IfWinNotActive ahk_group programs
^b:: ChangeBrightness(100)
^+b:: ChangeBrightness(0)
```

While VS Code or IntelliJ are active, brightness hotkeys **won’t trigger**, because no one wants their display suddenly nuked mid-debug.

---

## 🧪 Under the Hood

The script ensures brightness stays between **0%–100%**, avoids invalid input, and uses a snappy 1ms timeout for setting changes:

```autohotkey
property.WmiSetBrightness(timeout, brightness)
```

It's clean, fast, and doesn't mess around.

---

## ✅ Why I Wrote This

Every time I started my PC, Windows decided to either:

- Blast me with **100% brightness**, or
- **Remove the brightness slider** entirely  
  …leaving me stuck in a screenlit purgatory.

This script brought peace to my mornings. Now it can bring peace to yours.

---

## 💾 Want to Use It?

Just run the `.ahk` script once and it’ll auto-install itself in Startup. You can also compile it into an `.exe` if you don’t have AutoHotKey installed system-wide.

---

**That’s it. No more brightness betrayal. Just you, your screen, and a perfectly calibrated glow.**
