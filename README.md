# 决策.skill

> _「像CFO一样进行决策」_

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-yellow.svg)](LICENSE)
[![Agent Skills](https://img.shields.io/badge/Agent%20Skills-Standard-green)](https://agentskills.io)
[![skills.sh](https://img.shields.io/badge/skills.sh-Compatible-blue)](https://skills.sh)
[![Multi-Runtime](https://img.shields.io/badge/Runtime-Claude%20Code%20·%20Codex%20·%20Cursor%20·%20OpenClaw%20·%20Hermes-blueviolet)](#安装)

**Decision Analyst 帮你用相关成本思维做选择。** 它会排除沉没成本，只看从现在开始会因选择而改变的成本、收益、机会成本、风险和长期价值。

不是情绪化地列优缺点，也不是为了已经花掉的钱找理由。它把决定拆成可比较的未来后果，再用五个维度做透明权衡。

```bash
npx skills add RowanXB/decision-analyst
```

[安装](#安装) · [使用](#使用) · [它怎么判断](#它怎么判断) · [五维框架](#五维框架) · [仓库结构](#仓库结构)

---

## 效果示例

```text
用户      ❯ 我已经读了两年这个学位，也花了很多学费，但我很痛苦，
            健康也越来越差。我要继续还是退出？

Decision  ❯ 已花的两年和学费是沉没成本，不进入评分。
Analyst      从今天开始，真正相关的是：

            - 继续：可能保留学历资本，但继续消耗健康、时间和生活质量
            - 退出：可能损失未来学历资本，但释放恢复、转向和重新配置资源的空间

            在没有权重前，我不会给加权总分。
            但如果健康恶化是持续且严重的，非加权判断会先把
            Sustainability 放到红灯区，再问你是否愿意为了 Capital 承担这个代价。
```

```text
用户      ❯ 旧机器账面价值 5000。维修要 1800，换新要 4200。
            新机器每年省 900，能省四年。怎么办？

Decision  ❯ 账面价值 5000 是会计数字，不改变未来现金流，排除。
Analyst
            用维修作为基准：
            - 换新的额外成本：4200 - 1800 = 2400
            - 四年节省：900 × 4 = 3600
            - 增量净收益：3600 - 2400 = 1200

            如果没有其他非财务差异，相关成本结论是：换新。
            反转条件：年节省低于 600 时，换新不再占优。
```

---

## 它怎么判断

Decision Analyst 的核心规则只有一句：

> 只分析未来会因为选择不同而改变的后果。

它会主动排除：

- **沉没成本**：已经花掉的钱、时间、努力、关系历史
- **共同成本**：无论选什么都会发生的未来成本或收益
- **会计分摊**：账面价值、折旧、已分摊 overhead
- **伪相关情绪**：「都走到这一步了」「不想浪费」这类过去导向的压力

它会主动纳入：

- **增量成本和收益**：从现在开始多花或多赚什么
- **机会成本**：选 A 会牺牲哪个最好的 B
- **可避免成本**：现在改选可以避免什么
- **风险和可逆性**：最坏情况能不能承受，能不能回头
- **长期资本**：能力、学历、声誉、作品、网络、职业可信度

---

## 五维框架

生活和职业决策默认使用五个维度。它们分开评分，避免把同一个影响重复计算。

| 维度               | 看什么                                       | 不看什么         |
| ------------------ | -------------------------------------------- | ---------------- |
| **Sustainability** | 健康、睡眠、精力、心理稳定性、长期能否撑住   | 快乐感           |
| **Resources**      | 钱、时间、空间、现金流压力、不可退未来承诺   | 有钱带来的安全感 |
| **Capital**        | 技能、学历进度、成绩、作品集、网络、职业信誉 | 当下舒服不舒服   |
| **Experience**     | 兴趣、厌恶、居住体验、社交满足、日常幸福感   | 健康和收入本身   |
| **Alignment**      | 价值观、意义感、身份一致性、想成为什么样的人 | 纯粹的短期开心   |

没有权重时，它不会伪造加权总分。它可以给出明确标注的非加权倾向，但只有在你提供权重后，才会输出加权评分和加权推荐。

---

## 安装

Decision Analyst 基于开放的 Agent Skills 形态，可在任何 skills-compatible 的 AI agent runtime 中使用。

### 方式一：让当前 agent 安装

把这句话发给你正在用的 agent：

```text
帮我安装这个 skill：https://github.com/RowanXB/decision-analyst
```

### 方式二：一行命令

```bash
npx skills add RowanXB/decision-analyst
```

### 方式三：手动安装

| Runtime     | 安装路径                             |
| ----------- | ------------------------------------ |
| Claude Code | `~/.claude/skills/decision-analyst/` |
| Codex CLI   | `~/.agents/skills/decision-analyst/` |
| Cursor      | `~/.cursor/skills/decision-analyst/` |
| Hermes      | `~/.hermes/skills/decision-analyst/` |

```bash
git clone https://github.com/RowanXB/decision-analyst <上面对应的路径>
```

即使 runtime 不支持自动加载 skills，也可以直接把 `SKILL.md` 的内容作为参考资料粘贴进对话。

---

## 使用

装好后，直接说：

```text
Use $decision-analyst to compare these options...
```

或用中文触发：

```text
用 decision-analyst 帮我判断要不要继续这个项目
帮我排除沉没成本，比较这两个选择
我有两个 offer，帮我按五维框架分析
```

当你给出稳定、长期可复用的五维权重时，skill 会先询问这些权重是否属于 durable values，以及是否允许写入 `user-values.json`。它不会在没有许可时写入本地文件。

---

## 仓库结构

```text
decision-analyst/
├── SKILL.md                      # skill 主体
├── test-prompts.json             # Darwin 评估用测试 prompts
├── references/
│   └── method-notes.md           # 相关成本、沉没成本、权重评分方法说明
├── agents/
│   └── openai.yaml               # agent UI metadata
├── LICENSE
└── README.md
```

---

## 质量验证

这个 skill 已用 Darwin 风格流程做过一轮评估和优化：

| 阶段   |       分数 | 模式    |
| ------ | ---------: | ------- |
| 基线   | 83.8 / 100 | dry_run |
| 优化后 | 89.2 / 100 | dry_run |
| 提升   |       +5.4 | keep    |

测试覆盖三类常见决策：

1. 学位沉没成本与健康取舍
2. 旧机器维修 vs 替换
3. 高薪高压高成长 offer vs 低薪低成长但自由 offer

---

## 许可证

   Copyright 2026 RowanXB

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

---

**沉没成本告诉你过去花了什么。**

**Decision Analyst 告诉你，从现在开始什么才算数。**
