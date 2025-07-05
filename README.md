# 🛠️ Alexis' Modular Neovim Configuration

Welcome to my personal **Neovim setup**, designed for **modularity**, **aesthetics**, and **developer comfort**.

Unlike most configurations, this one puts **control in your hands**. You can easily toggle themes, diagnostics, and even your AI assistant — all without leaving Neovim.

This configuration is greatly inspired by the one of the Youtuber [Josean Martinez](https://www.youtube.com/@joseanmartinez)

## ✨ Features

- ⚙️ Built with [Lazy.nvim](https://github.com/folke/lazy.nvim) for efficient plugin management
- 🎨 Live theme switching with a single keybinding
- 🚨 On/off diagnostics toggle
- 🤖 Codeium AI assistant toggle
- 🧼 Minimal, clean, and distraction-free interface
- 🧩 Modular plugin structure — easy to extend or customize

---

## ⚡ Key Bindings

| Action                | Keybinding  | Description                              |
| --------------------- | ----------- | ---------------------------------------- |
| 🎨 Select theme       | `<Space>ut` | Open a menu to choose a theme            |
| 🚨 Toggle diagnostics | `<Space>td` | Enable/disable LSP diagnostics           |
| 🤖 Toggle Codeium     | `<Ctrl>x`   | Enable or disable Codeium AI suggestions |

---

## 📁 Structure

This config is **modular by design**. Each plugin or feature group lives in its own Lua file, which means:

- Easier maintenance
- Easier to debug
- Easier to expand

Want to add a new plugin? Just drop a Lua file in the right folder. Want to remove something? Delete one file. Simple as that.

---

## 🚀 Installation

```bash
git clone https://github.com/<your-username>/<repo-name> ~/.config/nvim
nvim
```
