# Case Study: hledger + scripts with shared expenses (Splitwise-style)

## Who / source
Devansh Agarwal — “Managing my finances with hledger”.

## The categorization problem
Shared expenses distort categories:
- If you pay ₹3000 for group dinner, the whole thing shows as **your** food expense.
- Later settlement/refund might be categorized weirdly.

## The approach
He argues categorization can’t be fully automated (UPI to “Rahul” could be many things).
His setup uses:
- a Git-backed folder with `main.journal`, `opening.journal`, `prices.journal`
- scripts that transform bank/CC exports into draft transactions
- a rule for shared expenses:
  - **Only banks and credit cards move money. Splitwise does not.**
  - Splitwise creates obligations using receivable/payable accounts.

So you record:
1) The original payment as normal (bank/cc ↔ expense)
2) A separate transaction that moves the reimbursable part into a receivable (so your net expense category isn’t inflated)

## Practical takeaways
- For shared spending, you need a *clearing layer* (receivables/payables) to keep category totals meaningful.
- Scripts should prompt the human for context rather than guessing.

## How this maps to your repo
You already have a relationship-clearing bucket concept (`Expenses:Relationship:*`).
A future refinement could model this as a proper receivable/payable instead of an expense bucket.

## Links
- https://devanshag.com/blog/finances-hledger
