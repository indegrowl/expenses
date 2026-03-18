# Case Study: Beancount in a Git repo + lightweight automation

## Who / source
Alex Watt — “Beancount for Personal Finance”.

## The categorization idea
This case study is about treating personal finance tracking like a software project:
- Keep all transactions in plain text.
- Version control the repo.
- Use a small set of scripts/commands to:
  - validate (`bean-check` in Beancount)
  - extract/import drafts from source files
  - format
  - run reports

He highlights that hierarchical accounts let you choose the granularity that’s useful, and you can split a single merchant transaction into multiple expense categories when needed.

## Practical takeaways
- A repo with scripts + validation makes the system maintainable.
- Categorization evolves: start simple, add detail only when useful.

## How this maps to hledger
- Replace `bean-check` with `hledger print`/`hledger bal` validations.
- Keep scripts in-repo for repeatable workflows (import drafts, validation, summaries).

## Links
- https://alexcwatt.com/beancount/
