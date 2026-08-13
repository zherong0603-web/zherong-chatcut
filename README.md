# zherong-chatcut

一个面向 Codex 的开源 ChatCut 对话短视频 Skill。它把 5–10 分钟真人—AI 或双人对话，整理为小红书、抖音和视频号可继续编辑的短视频时间线，并提供选题、字幕、音频、封面、发布文案和验收流程。

这是唯一最新版入口：`skills/zherong-chatcut/`。

## 能做什么

- 先刷新 ChatCut 实时项目、素材和时间线，再开始工作。
- 保护原时间线；不同剪法一律新建或复制时间线。
- 从真实对话里寻找冲突、反应、纠正和关系变化，而不是堆砌 AI 功能。
- 默认产出约 90–110 秒主版和 45–60 秒短版；素材不支持时不强凑时长。
- 完成字幕、脏话硬消音、克制音效、封面和三平台发布包。
- 读取内置的小红书低粉高互动选题雷达；需要最新趋势时再用 Agent Reach 只读刷新。
- 全程用中文向用户说明进度、风险和结果。

## 任意电脑首次安装

在 Codex 中直接说：

```text
使用 $skill-installer 从公开 GitHub 仓库 zherong0603-web/zherong-chatcut 的 skills/zherong-chatcut 路径安装 zherong-chatcut。安装完成后告诉我是否需要重启或新开任务；全程用中文。
```

也可以使用 Skills CLI：

```bash
npx skills add zherong0603-web/zherong-chatcut --skill zherong-chatcut --full-depth -g -a codex -y
```

安装完成后重启 Codex 或新开任务，使 Skill 清单刷新。

## 日常调用

完整调用：

```text
$zherong-chatcut 继续处理我的 ChatCut 人机对话短视频。全程用中文。先刷新实时项目、素材和时间线状态；任何新剪辑都新建时间线，不得覆盖旧版本。若需要选题，先读取内置最新选题雷达，必要时再只读刷新小红书证据。
```

简短调用：

```text
调用 zherong-chatcut，全程中文，先刷新 ChatCut 实时状态，不覆盖旧时间线。
```

注意：全新电脑第一次仍需安装一次。公开仓库可以免去私库权限，但不能自动迁移 ChatCut 登录、工作区权限、云端素材、Chrome 扩展或平台登录态。

## 新电脑续接验收

1. Skill 清单中能看到 `zherong-chatcut`。
2. ChatCut 插件已安装，并授权到拥有目标项目的工作区。
3. 先列出实时项目、素材、全部时间线和当前活动时间线。
4. 发现旧版本时只读报告；试剪或重剪必须创建新时间线。
5. 如需小红书搜索，在当前电脑安装 Agent Reach 和 OpenCLI 扩展，并仅使用搜索、笔记、评论、作者、信息流等读取命令。

## 目录

- `skills/zherong-chatcut/SKILL.md`：唯一 Skill 入口。
- `skills/zherong-chatcut/references/`：剪辑、选题、音频、包装和验收规范。
- `skills/zherong-chatcut/assets/templates/`：可复用的中文工作模板。
- `research/xhs-low-follower-radar/`：公开样本的研究说明和精选来源。
- `scripts/`：跨电脑安装后只读能力检查。

## 隐私边界

本仓库不包含真实 ChatCut 项目 ID、编辑器私有链接、时间线/素材 ID、后台截图、自有账号精确数据、私聊、Cookie、Token、浏览器资料、原始音视频或含真人脸部的封面素材。

个人项目交接应放在本地私有文件中，使用 `assets/templates/continuation-manifest.md` 记录；不要提交到公开仓库。

## 开源协议

[MIT License](LICENSE)
