# Case Study: Ramit Sethi’s Conscious Spending Plan (CSP)

## Who / source
Ramit Sethi (I Will Teach You To Be Rich) — “Conscious Spending Plan”.

## The categorization idea
Instead of tracking dozens of micro-categories, CSP uses **four big buckets**:
1) **Fixed costs** (essentials) — target ~50–60%
2) **Investments** (future you / retirement) — ~10%
3) **Savings** (goals + emergency fund) — ~5–10%
4) **Guilt-free spending** (fun, intentionally) — ~20–35%

The point is intentional spending rather than restriction.

## Practical takeaways
- Your system is about *trade-offs*, not “don’t spend”.
- If fixed costs are too high, everything else collapses (stress signal).
- Automation matters: split money into buckets early (payday), then spending is easier.

## How this maps to hledger
- You can keep detailed `Expenses:*` accounts, but also maintain a high-level rollup:
  - Fixed costs
  - Savings
  - Investing
  - Guilt-free

In hledger, that could be done via naming conventions (e.g., `Expenses:Fixed:*`, `Expenses:GuiltFree:*`) or reports that group existing categories.

## Links
- https://www.iwillteachyoutoberich.com/conscious-spending-basics/
