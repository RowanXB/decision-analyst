# Decision Analyst Skill

Decision Analyst 是一个用于决策分析的 agent skill。它基于金融学里的相关成本分析方法：排除沉没成本，只分析未来会因选择而改变的成本、收益和机会成本，并用五个维度做加权评分。

默认五个维度：

- Sustainability：可持续性
- Resources：资源净效应
- Capital：长期资本
- Experience：生活体验
- Alignment：价值一致性

## 安装

如果你使用 Codex，可以把这个仓库直接克隆到本地 skills 目录：

```bash
git clone <repo-url> ~/.codex/skills/decision-analyst
```

如果你的 agent 会扫描通用 Agent Skills 目录，也可以安装到：

```bash
git clone <repo-url> ~/.agents/skills/decision-analyst
```

这个仓库的根目录就是 skill 根目录。安装后，`SKILL.md` 应该直接位于 `decision-analyst` 目录下。

## 使用

显式触发：

```text
Use $decision-analyst to compare these options...
```

当你询问如何选择、比较方案、是否继续或放弃、如何权衡利弊、如何排除沉没成本，或请求进行基于价值观的人生/商业决策时，这个 skill 也应该自动触发。

## 用户权重

当你提供稳定、长期可复用的五维权重时，skill 会把它们存到：

```text
user-values.json
```

这个文件位于 skill 根目录，也就是和 `SKILL.md` 同一层。它默认被 Git 忽略。之后再做决策时，agent 应先读取这个文件，在输出中展示已发现的权重，并询问是否沿用或根据当前决策调整。

## 项目结构

```text
decision-analyst/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   └── method-notes.md
└── README.md
```

## 校验

如果你本地有 skill creator 的校验脚本，可以运行：

```bash
python3 /path/to/skill-creator/scripts/quick_validate.py .
```
