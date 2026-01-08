# Fish Shell 配置

这个仓库包含我个人的 fish shell 配置文件。Fish（Friendly Interactive Shell）是一个智能且用户友好的命令行 shell。

## 目录结构

```
~/.config/fish/
├── config.fish          # 主配置文件
├── fish_plugins         # 已安装插件列表
├── fish_variables       # 环境变量
├── completions/         # 自定义命令补全
├── conf.d/              # 配置片段
└── functions/           # 自定义函数
```

## 安装

1. 备份当前的 fish 配置：
   ```bash
   mv ~/.config/fish ~/.config/fish-backup
   ```

2. 克隆或复制此配置到 `~/.config/fish/`

3. 重启 shell 或运行 `source ~/.config/fish/config.fish`

## 主要特性

- **提示符**: 自定义提示符，集成 Git 状态
- **别名**: 常用的别名以提高效率
- **函数**: 用于常见任务的自定义函数
- **补全**: 增强的命令补全功能
- **环境**: 优化的环境变量

## 插件

此配置使用以下插件（通过 Fisher 管理）：

- [插件列表将根据 fish_plugins 文件填充]

## 自定义函数

包含的一些有用函数：

- [函数列表将根据 functions/ 目录填充]

## 配置片段

`conf.d/` 目录包含各种配置片段，用于：

- Android 开发
- Docker 和 Docker Compose
- Git 工作流
- Node.js
- Python
- 以及更多...

## 贡献

欢迎 fork 并根据您的需要调整此配置。如果您有建议或改进，请开启 issue 或提交 pull request。