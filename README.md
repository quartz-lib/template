# Quartz Content Template

这是一个 Quartz 内容仓库模板，用于和 [`quartz-lib/factory`](https://github.com/quartz-lib/factory) 中的公共构建逻辑配合使用。

## 目录结构

- `content/`：站点的 Markdown 内容。
- `site.yaml`：站点标题、域名、页脚链接等差异配置。
- `.github/workflows/deploy-pages.yaml`：通过 GitHub Actions 构建并部署到 GitHub Pages。

## 使用方式

1. 使用这个模板创建新的内容仓库。
2. 修改 `site.yaml`：
   - `configuration.pageTitle`：站点标题。
   - `configuration.baseUrl`：站点域名，不要包含 `https://` 或结尾 `/`。例如 `owner.github.io/repo`。
   - `footerLinks.GitHub`：当前内容仓库地址。
3. 在 `content/` 中编写 Markdown 内容。
4. 在仓库 Settings -> Pages 中，将 Source 设置为 GitHub Actions。

推送到 `master` 分支后，workflow 会调用 `quartz-lib/factory` 中的可复用构建流程生成并部署站点。
