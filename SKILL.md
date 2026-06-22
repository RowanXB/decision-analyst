---
name: decision-analyst
description: Use this skill for decision analysis using relevant-cost thinking, sunk-cost exclusion, opportunity cost, incremental benefits, and weighted scoring across Sustainability, Resources, Capital, Experience, and Alignment. Explicitly trigger when the user mentions $decision-analyst, decision-analyst, 决策分析 skill, or asks to use this skill. Also implicitly trigger when the user asks for help choosing, comparing options, deciding whether to continue or quit, evaluating tradeoffs, ignoring sunk costs, clarifying relevant costs, or making a values-based life or business decision in Chinese or English.
---

# Decision Analyst

## Overview

Use relevant-cost analysis to clarify the user's stated alternatives, ignore sunk and non-changing factors, identify future consequences that differ by option, elicit the user's values, and produce a transparent weighted recommendation.

For life or personal decisions, default to five dimensions: Sustainability, Resources, Capital, Experience, and Alignment. For method details, edge cases, and source-backed definitions, read `references/method-notes.md` when the decision has meaningful financial stakes, uncertainty, or ambiguous sunk-cost claims.

## Core Rule

Analyze only future consequences that can change because the user chooses one option instead of another. Exclude past, unrecoverable costs and any cost or benefit that is the same across all options. Include opportunity costs, avoidable costs, incremental benefits, risks, and future psychological or relational consequences only when they differ by option.

## Workflow

### 1. Frame the Decision

Clarify the decision object before analyzing:

- Restate the decision in one sentence.
- Extract only the options the user explicitly provides. You may restate vague option wording for clarity, but do not add new options.
- Do not propose compromise, hybrid, middle-ground, "do both", "try for a limited time", or status quo options unless the user explicitly provides them or asks you to generate additional options.
- Ask for missing options when the option set is unclear or when the user asks you to help generate options.
- Identify hard constraints, decision horizon, reversibility, and the deadline for choosing.

Do not start scoring while the options are vague.

### 2. Exclude Irrelevant Factors

Create an "Excluded from analysis" list before the scoring table:

- Sunk costs: money, time, effort, tuition, relationship history, reputation already spent, or prior work that cannot be recovered.
- Common costs or benefits: future items that occur under every option.
- Accounting allocations: depreciation, book value, allocated overhead, or labels that do not change future cash flow or lived outcome.
- Guilt, waste, or "I already came this far" unless the future feeling, relationship effect, or reputational consequence differs by option.

Briefly explain why each excluded item is not decision-relevant.

### 3. List Relevant Costs and Benefits

For each option, list only incremental future consequences. For life or personal decisions, use these five default dimensions and avoid creating extra dimensions unless the user explicitly asks:

- Sustainability: whether the choice can be maintained long term. Include health, sleep, energy, psychological stability, stress level, and whether the life rhythm is sustainable. Core question: will this choice make the user more stable or more likely to break down? Do not score happiness here.
- Resources: the choice's effect on real-world resources. Include money, time, space, equipment, living costs, cash-flow pressure, and non-refundable future commitments. Core question: will this choice consume or increase practical resources? Do not score the feeling of financial safety here.
- Capital: whether the choice accumulates durable future capital. Include skills, degree progress, grades, research experience, portfolio, network, reputation, career credibility, and entrepreneurial experience. Core question: will this choice make the user stronger and more competitive in the future?
- Experience: the choice's effect on day-to-day subjective life. Include joy, interest, aversion, housing comfort, social satisfaction, autonomy, and everyday happiness. Core question: will daily life actually feel better or worse?
- Alignment: whether the choice matches long-term values and life direction. Include ideals, meaning, social impact, educational fairness, identity, moral consistency, and becoming the kind of person the user wants to become. Core question: does this choice move the user closer to the path they truly want?

For business or monetary-only decisions, calculate incremental financial consequences separately before mapping non-financial effects into the five dimensions when relevant.

### 4. Load or Ask for Values and Unknowns

Ask concise questions whenever the answer affects the recommendation:

- Before asking for weights, check for `user-values.json` in the skill root directory.
- If `user-values.json` exists and contains valid weights for Sustainability, Resources, Capital, Experience, and Alignment that sum to 100, state this in the response and display the discovered weights. Ask whether to use them as-is or adjust them for the current decision.
- If `user-values.json` is missing, ask the user to assign weights across Sustainability, Resources, Capital, Experience, and Alignment that sum to 100, or rank these five dimensions first if exact weights feel hard. Do not create temporary, provisional, assumed, or default weights.
- If `user-values.json` exists but is invalid, state that saved weights were found but cannot be used, briefly name the issue, and ask the user to revise or normalize them.
- Ask the user to rate each option's impact on each dimension, preferably on a -5 to +5 scale where 0 means no meaningful difference from the baseline.
- Ask for probabilities or scenario ranges when outcomes are uncertain.
- Ask for missing facts that could change the top-ranked option.

If no valid saved or user-provided weights are available, stop before weighted scoring and ask for weights. You may provide an unweighted comparison of relevant consequences, but you must not produce weighted totals or a weighted recommendation until the user provides weights.

### 5. Persist User Value Weights

When the user gives stable, reusable value weights or long-term preferences:

- Save them to disk by default at `user-values.json` in the skill root directory, the same directory that contains this `SKILL.md`. If this skill has been installed or copied elsewhere, use that installed skill directory.
- Use this JSON shape:

```json
{
  "version": 1,
  "updated_at": "YYYY-MM-DD",
  "weights": {
    "Sustainability": 25,
    "Resources": 20,
    "Capital": 25,
    "Experience": 15,
    "Alignment": 15
  },
  "notes": "Stable long-term value weights for decision analysis."
}
```

- Distinguish durable values from decision-specific weights. Persist only durable values, not one-off tactical weights.
- On future decisions, read the skill-root `user-values.json` first when available, reuse saved weights as defaults, show the discovered weights in the response, and ask whether to adjust them for the current context.
- If the skill root directory is unavailable or not writable, ask the user for a writable path before persisting. Until then, reuse the weights within the conversation and say they have not been written to disk.
- Do not store sensitive decision details, private life history, or one-off scores in the weights file unless the user explicitly asks.

Never invent durable user weights or pretend a file was written when it was not.

### 6. Score and Stress-Test

Use a transparent weighted score only after valid saved or user-provided weights are available:

`option score = sum(dimension weight * option impact score)`

Normalize weights to sum to 100. Use the same scoring direction across all dimensions: positive means the option improves that dimension relative to the baseline, negative means it worsens it.

For financial or business decisions, calculate incremental net benefit first. Use present value when timing materially differs across options. Then combine financial results with non-financial dimensions only after converting them into comparable impact scores or treating finance as its own weighted dimension.

Run at least one sensitivity check:

- Identify the assumption or weight that would need to change to reverse the recommendation.
- Flag dominated options: an option is dominated when another option is at least as good on every relevant dimension and better on at least one.
- Separate "best expected score" from "safest option" when downside risk matters.

### 7. Output Format

Use this structure unless the user asks for another format:

1. Decision frame: one sentence plus options.
2. Excluded factors: sunk/common/non-changing items and why excluded.
3. Relevant consequences: concise table by option.
4. Weights and assumptions: show whether weights were discovered from skill-root `user-values.json` or provided by the user. If no valid weights are available, ask for weights and stop before scoring.
5. Scoring table: dimensions, weights, option impact scores, weighted totals.
6. Recommendation: top option, why it wins, confidence level, and what could change the answer.
7. Next question or action: only the highest-value missing information or next step.

Keep the conclusion candid. If scores are close, say so and explain the tradeoff instead of forcing certainty.
