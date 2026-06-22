# Method Notes

## Relevant-Cost Foundation

Treat a factor as decision-relevant only when it passes all of these tests:

- Future-facing: the consequence has not already been irreversibly incurred.
- Difference-making: the consequence differs between at least two options.
- Causal: the user's choice can plausibly affect whether, when, or how much it occurs.
- Material: the consequence is large enough to affect the conclusion or the user's peace of mind.

Relevant items commonly include avoidable costs, incremental revenue, incremental time, opportunity costs, scarce future opportunities, resale value, option value, and risk exposure. Irrelevant items commonly include sunk costs, committed costs that cannot be changed, non-cash accounting allocations, future costs that occur under every option, and scarcity cues without material future impact.

## Sunk-Cost Handling

Exclude sunk costs even when they feel emotionally salient. The correct question is not "How do I justify what I already spent?" but "From here, which option creates the best future outcome?"

Do not dismiss emotions mechanically. Past effort can create future-relevant consequences, but only the future part counts. Examples:

- "I already spent two years on this degree" is sunk.
- "Leaving now may require explaining the gap to employers" can be relevant.
- "I paid for the ticket" is sunk.
- "Going will cost three hours and make me exhausted tomorrow" is relevant.
- "I invested years in this relationship" is sunk.
- "Leaving or staying will affect future wellbeing, housing, finances, or family obligations" is relevant.

## Opportunity Cost

Include the value of the best forgone alternative when choosing one option consumes time, capital, attention, or social capacity that could be used elsewhere. In life decisions, opportunity cost often appears as lost recovery, lost family time, delayed learning, or reduced optionality.

When opportunity cost depends on scarcity, check three sources of value:

- Expiry value: the opportunity has a clear expiration time, application deadline, one-time window, or sequencing constraint.
- Irreplaceability: after missing it, the user cannot easily find an alternative of similar quality, access, timing, or fit.
- Option value: the opportunity opens future choices, relationships, credentials, information, or paths that would otherwise be unavailable.

Count the scarce opportunity only when at least one source is material, future-facing, causal, and different between options. Map the effect into existing dimensions, usually Capital, Resources, Alignment, or Experience. Do not create a separate scarcity score unless the user explicitly asks to customize the framework.

Do not count FOMO as opportunity cost. "Limited seats," "looks elite," "people say it is rare," or "it feels wasteful not to go" are not relevant unless they point to a real future consequence.

## Default Life-Decision Dimensions

Use these five dimensions for life and personal decisions. Keep them separate to avoid double counting.

### 1. Sustainability

Measure whether the choice can be maintained long term.

Include health, sleep, energy, psychological stability, stress level, and whether the life rhythm is sustainable.

Core question: will this choice make the user more stable, or more likely to break down?

Do not evaluate happiness here. This dimension only evaluates whether the body and system can hold up.

### 2. Resources

Measure the choice's effect on practical resources.

Include money, time, space, equipment, living costs, cash-flow pressure, and non-refundable future commitments.

Core question: will this choice consume or increase the user's real-world resources?

Do not evaluate the emotional safety produced by money here. Only score the resource increase or decrease itself.

### 3. Capital

Measure whether the choice accumulates durable future capital.

Include skills, degree progress, grades, research experience, portfolio, network, reputation, career credibility, and entrepreneurial experience.

Core question: will this choice make the user stronger and more competitive in the future?

Use this dimension to merge ability compounding, academic capital, and career capital. Do not split them into separate dimensions unless the user explicitly asks.

### 4. Experience

Measure the choice's effect on everyday subjective life.

Include joy, interest, aversion, housing comfort, social satisfaction, autonomy, and everyday happiness.

Core question: will the user's actual daily life feel better or worse?

This is not health, resources, or ideals. It is the lived quality of daily experience.

### 5. Alignment

Measure whether the choice matches the user's long-term values and life direction.

Include ideals, meaning, social impact, educational fairness, identity, moral consistency, and whether the user is becoming the kind of person they want to become.

Core question: does this choice move the user closer to the path they truly want?

Put ideals and meaning here. Do not mix them into happiness, credentials, or income.

Ask the user to edit the five dimensions only if they explicitly want a custom framework. Otherwise, use these five as the default scoring table.

## Dimension-Level Cost-Benefit Analysis

For each option, analyze all five dimensions before scoring. Each option-dimension cell should explain:

- Benefits: future gains, avoided harms, preserved options, or upside within that dimension.
- Costs: future burdens, risks, lost options, opportunity costs, or downside within that dimension.
- Net assessment: net positive, net negative, mixed, or no material difference.
- Key uncertainty: the missing fact most likely to change that dimension's assessment, when one exists.

Do not force false symmetry. If a dimension has benefits but no material costs, or costs but no material benefits, say that directly. If the option does not materially affect a dimension, write "no material difference" and avoid padding.

Compression applies only to presentation, not to the analytical process. For simple low-stakes decisions, one compact line per option-dimension cell is enough in the final answer, but the agent must still evaluate every option-dimension cell, exclusions, scarcity checks, uncertainty, and weight rules. Expand the visible reasoning when stakes, uncertainty, or emotional load justify it.

Use this dimension-level cost-benefit analysis to justify the -5 to +5 impact score. The score should compress the analysis, not replace it.

## Weight Elicitation

Prefer simple elicitation over complex pairwise methods unless the user asks for rigor.

Use one of these approaches:

- Direct weights: ask the user to allocate 100 points across dimensions.
- Ranking first: ask the user to rank dimensions, then propose a provisional weight split for confirmation.
- Swing weighting for careful decisions: ask which dimension's move from worst plausible outcome to best plausible outcome matters most, then scale other dimensions relative to that swing.

Persist only stable weights across the five default dimensions. Situational weights, such as "for this month, Resources matters more than Capital," should be kept in the current decision unless the user explicitly says they reflect durable priorities.

Default disk persistence path: `user-values.json` in the skill root directory, the same directory that contains `SKILL.md`. Read it before asking the user for weights or scoring. If it exists and is valid, explicitly show the discovered weights in the response and ask whether to use them as-is or adjust them for the current decision. If it is missing, ask the user for weights. If it exists but the five weights do not sum to 100 or required dimensions are missing, say the saved weights are invalid and ask whether to normalize or revise them.

## Scoring

Use a -5 to +5 impact score for each option and dimension:

- -5 = severe future harm
- -3 = meaningful downside
- 0 = no meaningful difference
- +3 = meaningful benefit
- +5 = exceptional benefit

Calculate:

`weighted contribution = dimension weight * impact score`

`total score = sum(weighted contributions)`

Scores are decision aids, not moral truth. Explain the recommendation in natural language and include the decisive tradeoffs.

For monetary-only decisions, use incremental net benefit:

`incremental net benefit = incremental future benefits - incremental future costs - opportunity costs`

Use expected value when probabilities are credible:

`expected value = sum(probability * outcome value)`

Use scenario ranges when probabilities are unknown or too speculative.

## Uncertainty and Sensitivity

Before concluding, check:

- Which missing fact has the highest value of information?
- Would the recommendation change if the top two weights moved by 10-20 points?
- Would the recommendation change under pessimistic, base, and optimistic scenarios?
- Is the top option irreversible or does it preserve future options?
- Does a claimed scarce opportunity have expiry value, irreplaceability, or option value, or is it only FOMO?
- Is the top option best by expected value but unacceptable by downside risk?

When uncertainty is high, recommend an information-gathering step, pilot, reversible trial, or decision checkpoint if available.

## Source Pointers

- AccountingTools, "Relevant cost definition": https://www.accountingtools.com/articles/what-is-a-relevant-cost.html
- AccountingTools, "Irrelevant cost definition": https://www.accountingtools.com/articles/what-is-an-irrelevant-cost.html
- Wikipedia, "Relevant cost": https://en.wikipedia.org/wiki/Relevant_cost
- Wikipedia, "Sunk cost": https://en.wikipedia.org/wiki/Sunk_cost
- Wikipedia, "Multiple-criteria decision analysis": https://en.wikipedia.org/wiki/Multiple-criteria_decision_analysis
- Wikipedia, "Weighted sum model": https://en.wikipedia.org/wiki/Weighted_sum_model
