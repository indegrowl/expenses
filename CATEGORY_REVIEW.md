# Category review (brutal + practical)

This is a **human critique** of the current account/category taxonomy in this repo, with **concrete improvements**.
The goal is not “perfect accounting”; it’s: _fast capture, low friction, good visibility, and fewer category regrets_.

Sources / inspiration are summarized in `case-studies/` (YNAB, Ramit Sethi, zero-based budgeting, Monzo “pots”, hledger habits, Splitwise-style receivables, Beancount repo automation).

---

## TL;DR recommendations

1) **Stop expanding categories unless it changes decisions** (case studies 01, 06).
2) **Normalize naming + declare the accounts you already use** so the tree isn’t half-spec / half-wild-west (this repo already tracks gaps in `ACCOUNT_DESCRIPTIONS.md`).
3) Split the world into 3 layers:
   - **Payments** (assets/liabilities): what did you pay with?
   - **What it was for** (expenses): what did you buy?
   - **Who it was really for / who owes who** (receivable/payable): reimbursements and shared spending.
4) Consider a “**True Expenses**” / non-monthly bucket (case study 01) *but keep it light*.

---

## What’s good already

- The core expense tree is small and understandable:
  - `Expenses:Food:*`, `Expenses:Transport:*`, `Expenses:Office:Rent`, `Expenses:Entertainment:Subscriptions:*`, `Expenses:Books:*`, `Expenses:Cloud:*`
- You already have a concept of “don’t overfit the taxonomy”: the case studies point toward maintainability.
- Tracking “Waste” explicitly is psychologically useful (some people love this; more on it below).

---

## The current problems (brutal)

### 1) The tree is slightly “truthy” (declared vs used don’t match)
In `ACCOUNT_DESCRIPTIONS.md` you already note accounts that appear in transactions but are not declared.
This creates two bad outcomes:
- The assistant has no reliable source of truth for account selection.
- You eventually stop trusting reports because you’re never sure what’s “real taxonomy” vs “historical accidents”.

**Fix:** pick one strategy and do it consistently:
- **A)** declare everything you use (fastest), or
- **B)** rename/normalize postings to match the declared structure (cleanest long-term, more work).

### 2) Naming inconsistency leaks into decision fatigue
Examples (already visible in the repo):
- `Liabilities:Loan:*` vs `Liabilities:Loans:*`
- `Equity:Opening` vs `Equity:OpeningBalance`
- `Assets:Investments:FixedDeposit:HDFC` vs `Assets:FD:HDFC`

This matters because the tool (and you) will hesitate: “which one is the ‘real’ bucket?”.

**Fix:** choose a canonical naming set and keep aliases only temporarily.

### 3) Relationship reimbursements are modeled as expenses (clearing bucket)
Current approach:
- `Expenses:Relationship:Bhavana` and `Expenses:Relationship:Naman` used as a clearing bucket.

This works mechanically, but semantically it’s weird:
- If you pay for Bhavana, it’s not “an expense you consumed” — it’s often a **receivable**.
- If she pays you back, you’re posting **negative expense**, which makes reports confusing.

**Better default model** (case study 07):
- Track shared-spend as `Assets:Receivable:<Person>` (or `Liabilities:Payable:<Person>` depending on direction)
- Only book an actual expense when it’s truly yours.

You can still keep “relationship” as a tag or note; you don’t need it as the primary category.

### 4) Some categories are “emotion categories”, not decision categories
- `Expenses:Waste` is powerful if it changes behavior.
- But if it turns into “misc but guilt”, it becomes a dumping ground.

**Rule of thumb:** keep `Waste` only if you actively review it monthly. Otherwise merge it into `Expenses:Misc` and use a tag like `;waste:` for occasional analysis.

---

## Suggested category design (minimal but future-proof)

### A) Expenses: keep it boring
Aim for ~10–20 leaf categories you can recognize instantly.

**Proposed baseline:**
- `Expenses:Food:Groceries`
- `Expenses:Food:Dining`
- `Expenses:Food:Treats`
- `Expenses:Transport:Cab`
- `Expenses:Transport:Auto`
- `Expenses:Transport:Fuel`
- `Expenses:Office:Rent`
- `Expenses:Subscriptions:Media` (or keep `YouTube` if you care)
- `Expenses:Subscriptions:Books` (Audible)
- `Expenses:Cloud:Services`
- `Expenses:Photography:*` (fine to keep if you actually review photography spend)
- `Expenses:Finance:BankCharges`
- `Expenses:Misc`

**Why this works:** it matches the YNAB “Mandatory vs Optional / themed” idea (case study 01) without exploding the tree.

### B) Non-monthly / true expenses: only if it reduces surprises
If you regularly get surprised by annual-ish costs, create a simple bucket:
- `Expenses:TrueExpenses:AnnualSubscriptions`
- `Expenses:TrueExpenses:Travel`
- `Expenses:TrueExpenses:Health`

If you don’t actually set aside money, you can still track it here so reports show it separately.

### C) Shared spending: make it receivable/payable
Instead of negative expenses, make who-owes-who explicit:
- If Naman pays for Bhavana: `Assets:Receivable:Bhavana`
- If Bhavana pays for Naman: `Assets:Receivable:Naman` (in Bhavana ledger)

This lines up with Splitwise-style thinking (case study 07) and makes reports far cleaner.

---

## Practical migration plan (no journal edits required today)

1) **Pick canonical names** for the inconsistent families:
   - Loans: `Liabilities:Loan:*` OR `Liabilities:Loans:*` (choose one)
   - Opening balances: `Equity:OpeningBalance` (recommend)
   - FD naming: pick either `Assets:FD:*` or `Assets:Investments:FixedDeposit:*`

2) **Declare the accounts you already use** (quick win):
   - Add missing `account` declarations for the “Gaps / TODO” list in `ACCOUNT_DESCRIPTIONS.md`.

3) (Optional) **Switch reimbursements to Receivable/Payable** going forward.
   - No need to rewrite history unless reports are painful.

4) Add a short monthly review ritual:
   - `hledger bal expenses -M` + skim top categories
   - Review `Waste` (if kept)

This mirrors the “daily capture + weekly reconciliation” habit design (case study 06) without turning your life into accounting.

---

## Where this should live in the skill

If you like this direction, the skill should do:
- Prefer expense categories from the “boring baseline”.
- Default shared-spend to `Assets:Receivable:<Person>` model (with one clarifying question when ambiguous).
- Treat `Expenses:Misc` as a safe fallback.

