# Quartz 即用模板

基于 [Quartz v5](https://quartz.jzhao.xyz/) 的静态站点模板，开箱即可搭建个人博客或数字花园。已预置常用插件、主题与 [GitHub Pages](https://pages.github.com/) 自动部署，无需从零配置 Quartz。

## 特性

- **Quartz v5**：使用社区插件体系（`quartz-community/*`）
- **Obsidian 友好**：支持 Obsidian 风格 Markdown、双向链接、图谱、搜索等
- **即用配置**：`quartz.config.yaml` 已包含常用插件与布局
- **全宽表格**：已预装 [full-width-tables](https://github.com/quartz-lib/full-width-tables)，宽表格可突破正文栏宽度
- **一键部署**：推送到 `master` 分支即通过 GitHub Actions 构建并发布到 Pages

## 快速开始

### 1. 使用本模板创建仓库

在 GitHub 点击 **Use this template** 创建新仓库，或 Fork 本仓库。

### 2. 修改站点配置

编辑 [`quartz.config.yaml`](./quartz.config.yaml)，至少修改以下项：

| 配置项 | 说明 |
|--------|------|
| `configuration.pageTitle` | 站点标题 |
| `configuration.baseUrl` | 站点域名（不含 `https://`，用于 RSS、站点地图等） |
| `configuration.locale` | 界面语言，如 `zh-CN`、`en-US` |
| `configuration.analytics` | 分析服务（当前为 Plausible，可按需调整） |

### 3. 编写内容

在 [`content/`](./content/) 目录下添加 Markdown 笔记，结构与 Obsidian 仓库类似。首页为 [`content/index.md`](./content/index.md)。

草稿、私有内容可放在名为 `private` 的目录中（已在 `ignorePatterns` 中忽略）。

### 4. 启用 GitHub Pages

1. 进入仓库 **Settings → Pages**
2. **Source** 选择 **GitHub Actions**
3. 将代码推送到 `master` 分支，工作流 [`.github/workflows/deploy-pages.yaml`](./.github/workflows/deploy-pages.yaml) 会自动构建并部署

首次部署后，在 Actions 运行记录中可查看站点 URL。

## 本地开发

需要 [Node.js](https://nodejs.org/) ≥ 22（见 [`.node-version`](./.node-version)）。

```bash
# 安装依赖
npm ci

# 安装 Quartz 社区插件
npx quartz plugin install

# 本地预览（默认监听 content 变更）
npx quartz build --serve
```

浏览器打开终端提示的地址（通常为 `http://localhost:8080`）即可预览。

生产构建：

```bash
npx quartz build
```

输出目录为 `public/`。

## 目录结构

```
.
├── content/              # 你的 Markdown 内容
├── quartz.config.yaml    # 站点与插件配置
├── quartz.lock.json      # 已锁定插件版本
├── .github/workflows/    # GitHub Pages 部署
└── quartz/               # Quartz 核心（一般无需修改）
```

## 预装扩展

本模板已添加第三方插件 **full-width-tables**（配置见 `quartz.config.yaml`，版本锁定于 `quartz.lock.json`）。安装命令为：

```bash
npx quartz plugin add github:quartz-lib/full-width-tables
```

克隆或 Fork 后无需重复执行；`npx quartz plugin install` 会按 lock 文件拉取该插件。若从零搭建同类站点，可手动运行上述命令添加。

## 自定义

- **插件**：在 `quartz.config.yaml` 的 `plugins` 中启用/禁用，或运行 `npx quartz plugin add <source>` 添加新插件
- **主题**：修改 `configuration.theme` 中的字体与配色
- **布局**：调整各插件的 `layout.position` 与 `layout.priority`
- **自定义域名**：启用 `cname` 插件后，在仓库根目录添加 `CNAME` 文件

更详细的配置说明见 [Quartz 官方文档](https://quartz.jzhao.xyz/)。

## 上游项目

本模板基于 [jackyzha0/quartz](https://github.com/jackyzha0/quartz)。升级 Quartz 版本或排查问题时，可参考上游文档与 [Discord 社区](https://discord.gg/cRFFHYye7t)。

## 许可证

[MIT](./LICENSE.txt)
