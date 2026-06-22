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

而这条规则的前提是：**一切评估都是相对的。** 成本和收益不是某个方案自身的属性，而是方案之间差异的属性——同一个结果，跟更差的选项比是收益，跟更好的选项比就是成本。

举个例子：一份月薪 2 万的 offer，本身既不算「收益」也不算「成本」，要看你拿它跟谁比。

- 跟月薪 1.5 万的选项比：它多给你 5 千，这 5 千是**收益**。
- 跟月薪 2.6 万的选项比：选它就放弃了 6 千，这 6 千是它的**机会成本**。
- 跟不找工作比：选它就获得了2万的**收益**，工作学到的能力也是**收益**，但劳累感、失去的时间或者其他机会则是**成本**。

数字没变，变的只是参照的对手。所以单独评价一个方案没有意义，至少要有两个选项（其中之一可以是「维持现状」），每个方案的成本、收益、评分都要锚定在某个基准方案或其他方案上来表达，而不是凭空给一个绝对分数。

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
- **长期资本**：能力、学历、作品、自我成长

---

## 五维框架

生活和职业决策默认使用五个维度。它们分开评分，避免把同一个影响重复计算。

| 维度               | 看什么                                       | 不看什么         |
| ------------------ | -------------------------------------------- | ---------------- |
| **Sustainability** | 健康、睡眠、精力、心理稳定性、长期能否撑住   | 快乐感           |
| **Resources**      | 钱、时间、人脉、空间、现金流压力、不可退未来承诺 | 有钱带来的安全感；已内化的能力（算 Capital） |
| **Capital**        | 技能、能力、学业进度、作品集、自我成长 | 当下舒服不舒服；手里的钱和人脉（算 Resources） |
| **Experience**     | 兴趣、厌恶、居住体验、社交满足、日常幸福感   | 健康和收入本身   |
| **Alignment**      | 价值观、意义感、身份一致性、想成为什么样的人 | 纯粹的短期开心   |

> **Resources 还是 Capital？** 一句话区分：**外界能拿走的算 Resources，长在你身上、带得走的算 Capital。** 钱、时间、人脉是你调动的外部资源（Resources）；技能、能力、作品集、自我成长是内化进你自己、外界拿不走的长期资本（Capital）。

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

把仓库克隆到当前 runtime 配置的 skills 目录中，并确保目标文件夹名为 `decision-analyst`：

```bash
git clone https://github.com/RowanXB/decision-analyst <agent-skills-dir>/decision-analyst
```

不同 runtime 的 skills 目录位置可能不同；以你当前 agent 或 runtime 的文档、配置页面、环境变量为准。

### 方式四：下载 zip 导入 Claude（Cowork / Chat）

不想走命令行、想直接在 Claude（claude.ai）的 Cowork 或对话里用时，用这个方式。

1. 从 GitHub Releases 下载打包好的 `.zip` 文件：
   - 发布页：<https://github.com/RowanXB/decision-analyst/releases/latest>

2. 在 Claude 的 Skills 管理界面，选择「上传 / 导入 skill」，传入这个 zip。
3. zip 内是标准 skill 包：顶层 `decision-analyst/` 目录，含 `SKILL.md`、`references/`、`agents/` 等运行所需文件（已剔除仓库开发文件）。导入并启用后，用 `$decision-analyst` 或中文「用 decision-analyst 帮我…」触发。

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
│   └── method-notes.md           # 完整细节文档：相关成本、沉没成本、五维边界、权重评分方法
├── agents/
│   └── openai.yaml               # agent UI metadata
├── LICENSE
└── README.md
```

---

## 质量验证

这个 skill 已用 Darwin 风格流程做过评估和优化。当前版本的本地校验状态：

| 项目 | 状态 |
| ---- | ---- |
| Skill 格式校验 | pass |
| Runtime 红灯扫描 | pass |
| 测试 prompts | 5 个 |
| 最近评估模式 | dry_run |

测试覆盖五类常见决策：

1. 学位沉没成本与健康取舍
2. 旧机器维修 vs 替换
3. 高薪高压高成长 offer vs 低薪低成长但自由 offer
4. 稀缺机会与 FOMO 区分
5. 创业续做 vs 稳定工作 offer

---

## 许可证

   Copyright 2026 Chengyan Tong

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
   
   <http://www.apache.org/licenses/LICENSE-2.0>
       
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

---

**沉没成本告诉你过去花了什么。**

**Decision Analyst 告诉你，从现在开始什么才算数。**
