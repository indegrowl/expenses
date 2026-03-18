# Case Study: YNAB’s “simple is better” + saving-specific / spending-general (Wish Farm)

## Who / source
YNAB discussion on how many categories you should have.

## The categorization idea
- There’s **no correct number** of categories; different people run anywhere from ~8 to 145+.
- Beginners should start with **fewer categories** and let new categories “earn their way in.”
- A useful pattern:
  - **Save in specific categories** (very motivating)
  - **Spend in general categories** (keeps reports clean)

### Wish Farm (concept)
You create specific saving targets (the “wish seeds”), but when you spend, you record under a broader stable category (e.g., Travel). Afterwards, you can delete the hyper-specific saving category without messing up spending reports.

## Practical takeaways
- If adding a category doesn’t change behavior, it’s clutter.
- Stable spending categories + flexible savings targets reduces taxonomy bloat.

## How this maps to hledger
- Use stable expense accounts (e.g., `Expenses:Travel`).
- Track specific goals separately (could be a separate file, tags, or virtual postings later), without exploding the `Expenses:*` tree.

## Links
- https://www.ynab.com/blog/how-many-ynab-categories
