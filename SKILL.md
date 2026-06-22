---
name: decision-analyst
description: Use this skill for decision analysis using relevant-cost thinking, sunk-cost exclusion, scarcity-aware opportunity cost, substitutability checks, dimension-by-dimension cost-benefit analysis, incremental benefits, ability-capital value for user-facing outcomes, and weighted scoring across Sustainability, Resources, Capital, Experience, and Alignment. Explicitly trigger when the user mentions $decision-analyst, decision-analyst, 决策分析 skill, or asks to use this skill. Also implicitly trigger when the user asks for help choosing, comparing options, deciding whether to continue or quit, evaluating tradeoffs, ignoring sunk costs, clarifying opportunity costs, distinguishing real option value from FOMO, comparing learning paths or career-capital investments, or making a values-based life or business decision in Chinese or English.
---

# Decision Analyst

## Overview

Use relevant-cost analysis to clarify the user's stated alternatives, ignore sunk and non-changing factors, identify future consequences that differ by option, elicit the user's values, and produce a transparent weighted recommendation.

For life or personal decisions, default to five dimensions: Sustainability, Resources, Capital, Experience, and Alignment. The complete details document is `references/method-notes.md`; read it in full before applying the five-dimension framework, scarcity tests, score inference, or compressed output rules.

## Core Rule

Analyze only future consequences that can change because the user chooses one option instead of another. Exclude past, unrecoverable costs and any cost or benefit that is the same across all options. Include opportunity costs, avoidable costs, incremental benefits, risks, and future psychological or relational consequences only when they differ by option.

Every evaluation is relative. Cost and benefit exist only as differences between options, so no option can be evaluated on its own. Judging a single option in isolation is meaningless: the same outcome is a benefit against a worse alternative and a cost against a better one, and a number assigned to one option in a vacuum carries no information. Anchor every consequence, score, and recommendation to an explicit comparison — to a named baseline option or directly to the other options — and never score an option except as a difference from something else. Require at least two options before any evaluation. If the user supplies only one option, there is no decision yet; ask what alternative (including the status-quo or do-nothing path) it is being weighed against before analyzing.

## Mental Models

Use these operating lenses throughout the analysis:

- From-here-forward: the decision starts now. Past spending, effort, history, and identity commitments matter only when they create future consequences that differ by option.
- Relative-only evaluation: every cost, benefit, and score is a comparison between options, never a standalone property of one option. A value assigned to an option in isolation has no meaning; it becomes meaningful only against a baseline option or the other alternatives. With only one option there is nothing to evaluate. This is the comparative core of relevant-cost thinking, and it is the lens that makes "difference-making only" enforceable.
- Difference-making only: include a factor only when at least one option changes it and the change is material enough to affect the recommendation or the user's peace of mind.
- Opportunity cost: choosing one option consumes time, capital, attention, or social capacity that could have gone to the best forgone alternative.
- Scarcity-aware opportunity cost: count a forgone opportunity only when choosing another option loses a future opportunity that is hard to replace, time-limited, or expands future options. Do not count mere "limited seats," prestige, or "it would be a pity not to go" unless they create material future consequences.
- Substitutability-aware scarcity: compare a scarce opportunity against the user's best realistic substitute, not an idealized alternative. If the substitute can create similar access, feedback, accountability, credentials, or learning outcomes and the user can realistically execute it, reduce the scarcity value. If the substitute exists only in theory or lacks the live conditions that make the opportunity valuable, scarcity may remain relevant.
- Ability value: when options build different skills, judge Capital by the skill's future value to the user or the people the user serves, the user's current gap, the option's learning efficiency, transferability, and evidence strength. Do not treat all skills as equally valuable just because they are skills.
- Full analysis, compressed presentation: simple decisions may receive a compact answer, but the analysis process must still cover exclusions, every option-dimension cost-benefit cell, scarcity checks, uncertainty, and weight rules.
- Expected value versus survivability: separate the option with the best expected score from the option with the safest downside when risk could harm health, finances, relationships, or irreversible life direction.
- Values are weights, not vibes: values must affect the analysis through explicit weights, rankings, or stated priorities, not vague language that hides the tradeoff.

## Workflow

### 1. Frame the Decision

Clarify the decision object before analyzing:

- Restate the decision in one sentence.
- Extract only the options the user explicitly provides. You may restate vague option wording for clarity, but do not add new options.
- Do not propose compromise, hybrid, middle-ground, "do both", "try for a limited time", or status quo options unless the user explicitly provides them or asks you to generate additional options.
- Ask for missing options when the option set is unclear or when the user asks you to help generate options.
- Identify hard constraints, decision horizon, reversibility, and the deadline for choosing.

CHECKPOINT / STOP: Do not start scoring while the options are vague. Ask the single highest-value clarification question needed to define the option set.

### 2. Exclude Irrelevant Factors

Create an "Excluded from analysis" list before the scoring table:

- Sunk costs: money, time, effort, tuition, relationship history, reputation already spent, or prior work that cannot be recovered.
- Common costs or benefits: future items that occur under every option.
- Accounting allocations: depreciation, book value, allocated overhead, or labels that do not change future cash flow or lived outcome.
- Guilt, waste, or "I already came this far" unless the future feeling, relationship effect, or reputational consequence differs by option.
- FOMO signals: "limited seats," "looks premium," "everyone says it is rare," or "not going feels wasteful" when there is no concrete future impact.

Briefly explain why each excluded item is not decision-relevant.

### 3. List Relevant Costs and Benefits

State every consequence comparatively. Pick one option as the reference baseline — the status quo if the user provided it, otherwise the lowest-commitment option — and describe each other option's costs and benefits as differences from that baseline, or compare options directly against one another. Never describe an option in absolute terms as if it had standalone worth; a consequence only earns a place in the table when it differs across the options being compared.

For each option, list only incremental future consequences. For life or personal decisions, use the five default dimensions below and avoid extra dimensions unless the user explicitly asks:

| Dimension | Count here | Do not count here |
|---|---|---|
| Sustainability | health, sleep, energy, psychological stability, long-term maintainability | happiness |
| Resources | money, time, network and contacts, space, equipment, cash-flow pressure, non-refundable future commitments | emotional safety from money; internalized skills (those are Capital) |
| Capital | skills, abilities, degree progress, grades, portfolio, self-growth | daily comfort; money or network you merely hold (those are Resources) |
| Experience | joy, interest, aversion, housing comfort, social satisfaction, autonomy | health, income, ideals |
| Alignment | values, meaning, identity, moral consistency, long-term direction | short-term happiness alone |

For every option-dimension cell, complete the `Benefits / Costs / Net assessment / Key uncertainty` analysis before assigning or inferring an impact score. Compression changes only how much of that analysis is shown to the user. For simple decisions, summarize each completed cell compactly; for high-stakes or ambiguous decisions, show the reasoning in more detail. If a dimension has no material cost or benefit, say so instead of inventing one. Use the net assessment to justify the later -5 to +5 impact score.

For scarce opportunity claims, apply the `expiry value / irreplaceability / option value / substitutability` test. Include scarcity only when it creates a material, causal future consequence after comparing the opportunity with realistic substitutes; map it into the existing dimensions. If scarcity is only limited seats, prestige, social proof, or anticipated regret, label it as FOMO and exclude it.

For learning, career, product-building, or capability-investment decisions, analyze Capital with an ability-value lens before scoring. Ask whether each option builds abilities that create future user/customer/stakeholder value, closes a real personal skill gap, is hard to learn through substitutes, transfers to the user's long-term direction, and leaves evidence such as a portfolio, case study, credential, network, or validated feedback.

For business or monetary-only decisions, calculate incremental financial consequences before asking for values or mapping non-financial effects into the five dimensions. Use this template:

- Choose a baseline option, usually the lowest-commitment or current-path option.
- List incremental future costs, incremental future benefits or savings, opportunity costs, resale or salvage value, and timing differences.
- Calculate `incremental net benefit = incremental future benefits - incremental future costs - opportunity costs`.
- Use present value when timing, discount rate, or risk materially changes the comparison.
- Show the break-even point or the assumption that would reverse the answer when the conclusion depends on one number.

If the decision is purely monetary and there are no material non-financial tradeoffs, give a relevant-cost recommendation from incremental net benefit without requiring five-dimension weights. If non-financial tradeoffs remain material, show the financial result first, then continue into the five-dimension framework.

### 4. Load or Ask for Values and Unknowns

Ask concise questions whenever the answer affects the recommendation:

- Before asking for weights, check for `user-values.json` in the skill root directory.
- If `user-values.json` exists and contains valid weights for Sustainability, Resources, Capital, Experience, and Alignment that sum to 100, state this in the response and display the discovered weights. Ask whether to use them as-is or adjust them for the current decision.
- If `user-values.json` is missing, ask the user to assign weights across Sustainability, Resources, Capital, Experience, and Alignment that sum to 100, or rank these five dimensions first if exact weights feel hard. Do not create temporary, provisional, assumed, or default weights.
- If `user-values.json` exists but is invalid, state that saved weights were found but cannot be used, briefly name the issue, and ask the user to revise or normalize them.
- Ask the user to rate each option's impact on each dimension, preferably on a -5 to +5 scale where 0 means no meaningful difference from the baseline.
- Ask for probabilities or scenario ranges when outcomes are uncertain.
- Ask expiry, irreplaceability, option-value, and substitutability questions when a claimed opportunity cost depends on scarcity.
- When different options build different abilities, ask concise questions about the user's current level, bottleneck skill gaps, long-term value of each ability, concrete plan for each option, realistic substitutes, and likely evidence of learning. Useful prompts include: "Which ability is currently limiting your outcomes most?", "Who benefits if you improve this ability, and how?", "What exactly would you do instead, week by week?", "Could the substitute create comparable real-world feedback, accountability, and access?", and "What artifact, relationship, or validated result would prove the ability improved?"
- Ask for missing facts that could change the top-ranked option.

If no valid saved or user-provided weights are available, stop before weighted scoring and ask for weights. You may provide an unweighted comparison of relevant consequences and a clearly labeled non-weighted lean when one option is dominated, risk-protective, or materially stronger on the user's stated priorities. Do not produce weighted totals, a weighted winner, or a weighted recommendation until the user provides weights.

When enough facts are available, infer initial impact scores from the stated facts and label each score with confidence. Do not force the user to score every option-dimension cell manually. Ask the user to confirm or revise only the 1-3 cells most likely to change the recommendation.

CHECKPOINT / STOP: Before weighted scoring, show the weights, inferred impact scores, and the highest-impact assumptions. Ask for confirmation when any score is low-confidence, emotionally loaded, financially material, or likely to reverse the recommendation.

### 5. Persist User Value Weights

When the user gives stable, reusable value weights or long-term preferences:

- Ask whether the weights are durable long-term values or decision-specific weights. Persist only durable values.
- Ask for explicit permission before writing durable weights to disk. If the user agrees, save them at `user-values.json` in the skill root directory, the same directory that contains this `SKILL.md`. If this skill has been installed or copied elsewhere, use that installed skill directory.
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

CHECKPOINT / STOP: Never write `user-values.json` unless the user has confirmed both that the weights are durable and that disk persistence is allowed.

### 6. Score and Stress-Test

Use a transparent weighted score only after valid saved or user-provided weights are available:

`option score = sum(dimension weight * option impact score)`

Normalize weights to sum to 100. Use the same scoring direction across all dimensions: positive means the option improves that dimension relative to the baseline, negative means it worsens it. Anchor the scores to the reference baseline option, which scores 0 on every dimension by definition; each other option's impact score is its difference from that baseline, never an absolute rating of the option in isolation. The recommendation is therefore always a statement about which option is best relative to the others, not which option is "good" on its own.

For financial or business decisions, calculate incremental net benefit first. Use present value when timing materially differs across options. If money is the only material dimension, recommend the higher net-benefit option and show the sensitivity check. Then combine financial results with non-financial dimensions only after converting them into comparable impact scores or treating finance as its own weighted dimension.

Run at least one sensitivity check:

- Identify the assumption or weight that would need to change to reverse the recommendation.
- Flag dominated options: an option is dominated when another option is at least as good on every relevant dimension and better on at least one.
- Separate "best expected score" from "safest option" when downside risk matters.
- Test whether any scarcity-based opportunity cost survives the expiry, irreplaceability, option-value, and substitutability checks; remove it if it is only FOMO or if a realistic substitute preserves the same future value.
- For ability-building decisions, test whether the recommendation changes when the user's biggest bottleneck skill, the user/customer value of each ability, or the feasibility of the substitute plan is revised.

### 7. Output Format

Use this structure unless the user asks for another format:

1. Decision frame: one sentence plus options.
2. Excluded factors: sunk/common/non-changing items and why excluded.
3. Relevant consequences: dimension-by-dimension cost-benefit analysis for every option across Sustainability, Resources, Capital, Experience, and Alignment, stated as differences against the named baseline option or directly between options, never as standalone descriptions. For ability-building decisions, the Capital analysis must explicitly name the user's binding bottleneck ability, give each option's best-realistic-substitute verdict, and rank the options by user-facing ability value rather than skill quantity or prestige, so the ability-capital reasoning is visible rather than implied.
4. Weights and assumptions: show whether weights were discovered from skill-root `user-values.json` or provided by the user. For ability-building decisions, also show the inferred ability-value assumptions and substitute plan assumptions. If no valid weights are available, ask for weights and stop before scoring.
5. Scoring table: dimensions, weights, option impact scores, weighted totals. Include this only after valid weights are available.
6. Recommendation: top option, why it wins, confidence level, and what could change the answer. If weights are missing, provide only a non-weighted lean or a pure financial relevant-cost recommendation, explicitly labeled as such.
7. Next question or action: only the highest-value missing information or next step.

Keep the conclusion candid. If scores are close, say so and explain the tradeoff instead of forcing certainty.

## Failure Modes and Fallbacks

| Trigger | First response | If still unresolved |
|---|---|---|
| Options are missing or vague | Ask one clarification question to identify the real alternatives | Provide only a decision-frame draft and stop before scoring |
| User asks for more options | Generate options separately before analysis, then ask which options to score | Analyze only the selected option set |
| No valid weights are available | Provide an unweighted relevant-consequence comparison and ask for weights or rankings | Stop before weighted totals and recommendation |
| Saved weights exist but do not sum to 100 | Show the issue and offer a normalized version for confirmation | Use no saved weights until the user confirms or revises them |
| User refuses weights but wants a recommendation | Explain that only an unweighted tradeoff summary is possible | Give a conditional recommendation based on stated priorities, not weighted totals |
| One option is dominated without weights | Label the conclusion as a non-weighted lean and explain the domination | Ask for weights only if the user wants a weighted score or the tradeoff is close |
| Decision is purely monetary | Calculate incremental net benefit and sensitivity before asking for values | Recommend the higher net-benefit option if non-financial tradeoffs are immaterial |
| Scarcity claim may be FOMO | Ask whether the opportunity has expiry value, irreplaceability, option value, and weak substitutability | Exclude it if scarcity, prestige, or regret is the only evidence, or if a realistic substitute preserves the same value |
| Options build different abilities | Ask about current level, bottleneck gap, user/customer value, learning efficiency, transferability, concrete plan, substitutes, and evidence | Score Capital through the ability-value lens; do not assume technical, social, analytical, or leadership skills have equal value in context |
| Impact scores are uncertain | Use ranges, confidence labels, and the value of information | Recommend the missing fact or reversible test that most improves the decision |
| Top expected-score option has serious downside risk | Separate best expected score from safest option | Ask whether downside protection or upside maximization should dominate |
| Skill root is not writable | Do not write `user-values.json`; keep weights in the conversation | Ask for a writable path only if the user still wants persistence |
| Decision has legal, medical, immigration, tax, or regulated financial stakes | Use the framework for structure only and flag need for qualified professional advice | Do not present the result as professional advice |

## Anti-Patterns

Do not do these:

- Do not evaluate or score any option in isolation; every cost, benefit, and score must express a difference relative to a named baseline or the other options, because a single option has no standalone value.
- Do not analyze or recommend when only one option exists; ask for the alternative it is being compared against first.
- Do not repackage sunk costs as "experience value" unless they create future consequences that differ by option.
- Do not double-count the same effect across Resources, Experience, Capital, or Alignment.
- Do not replace dimension-level cost-benefit analysis with bare scores or one-line labels.
- Do not count scarcity as opportunity cost merely because an option has limited seats, elite branding, social proof, or anticipated regret.
- Do not count an allegedly rare opportunity unless its expiry value, irreplaceability, or option value changes the user's future options or outcomes.
- Do not treat a scarce opportunity as valuable without comparing it to the user's best realistic substitute.
- Do not score skill-building options by raw skill quantity; consider the ability's user-facing value, current bottleneck gap, learning efficiency, transferability, and evidence.
- Do not output weighted totals, a weighted winner, or a weighted recommendation without valid weights.
- Do not withhold a clearly labeled non-weighted lean when one option is dominated, risk-protective, or strongly aligned with priorities the user has already stated.
- Do not ask for five-dimension weights before giving the relevant-cost answer to a purely monetary decision with no material non-financial tradeoff.
- Do not treat the highest expected score as the safest option when downside risk matters.
- Do not save private decision details, relationship history, health facts, one-off scores, or tactical context in `user-values.json`.
- Do not invent default weights, durable values, probabilities, or missing facts.
- Do not add compromise, hybrid, "try both," or status quo options unless the user asks for option generation or explicitly provides them.
- Do not force certainty when scores are close; name the tradeoff and the fact or value shift that would change the answer.
