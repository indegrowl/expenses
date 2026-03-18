# Case Study: Monzo — categories + “pots” (digital piggybanking)

## Who / source
Monzo’s budgeting guide.

## The categorization idea
Monzo frames budgeting as:
1) track spending
2) **categorise** it
3) allocate money to categories and goals

It explicitly mentions two approaches:
- **50/30/20 rule** (needs / wants / savings+debt)
- **Piggy banking** using “Pots” (separate buckets for bills, groceries, eating out, etc.)

The key here is not only categorizing past spend, but also *partitioning future money* into buckets.

## Practical takeaways
- Buckets are a behavior tool (make overspending harder).
- You can keep categories relatively simple and let “pots/buckets” do the control.

## How this maps to hledger
- Use `Assets:*` sub-accounts as “pots” (even if it’s the same real bank account) if you want envelope-style constraints later.
- Or keep it purely reporting-based (no envelope), just categories.

## Links
- https://monzo.com/learn/money-today/how-to-budget
