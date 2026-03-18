# Case Study: hledger habit design (daily capture + weekly reconciliation)

## Who / source
Marcel Kapfer — “hledger for personal finances: two months in”.

## The categorization idea
This is less about fancy categories and more about **making the system stick**:
- He started by entering opening balances and tracking from a fixed start date.
- Every day: check for new expenses and add them.
- Weekly: re-check balances for accounts (bank + cash).

The benefit he reports:
- Clear view of (1) how much spent this month and (2) what it was spent on.

## Practical takeaways
- The best category system is the one you can maintain.
- Rituals (daily/weekly) matter more than taxonomy perfection.

## How this maps to hledger
- A simple `Expenses:Food`, `Expenses:Transport`, `Expenses:Subscriptions` tree is already enough to answer “where did it go?”.
- Add granularity only when it changes decisions.

## Links
- https://mmk2410.org/2022/03/05/hledger-for-personal-finances-two-months-in
