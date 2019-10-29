---
date: 2019-08-07
title: 基本设置

toc: true  # Show table of contents? true/false
type: docs  # Do not modify.
weight: 100
menu:
    learning-vscode:
keywords: [vscode,设置]
desciption: vscode 的一些基本设置
---

在设置里添加一些自定义设置

## 1. user setting.json
```json
{
    "editor.fontSize": 16,
    "workbench.colorTheme": "One Dark Pro Bold",
    "editor.suggestSelection": "first",
    "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
    "python.jediEnabled": false,
    "editor.fontWeight": "400",
    "editor.lineHeight": 24,
    "editor.letterSpacing": 0.3,
    "terminal.integrated.fontFamily": "'monospace'",
    "editor.fontFamily": "'Consolas','Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'",
    "python.dataScience.askForKernelRestart": false,
    "explorer.confirmDelete": false,
    "editor.renderControlCharacters": false,
    "editor.rulers": [80],
    "editor.acceptSuggestionOnEnter": "smart",
    "editor.detectIndentation": false,
    "window.zoomLevel": 0
}
```