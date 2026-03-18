---
name: expense-tracker
description: Track personal expenses in a Git-backed hledger journal repo. Use when Naman messages an expense to record (e.g., "spent 250 on chai", "Bhavana 450 Swiggy"), asks to add/log/record an expense or income, wants hledger commands for reports, or wants to update the ledger files under ledger/naman or ledger/bhavana.
---

# Expense Tracker (hledger)

Keep this simple and safe. The repo is the source of truth.

## Repo layout

- `ledger/naman/*.journal`
- `ledger/bhavana/*.journal`
- Entry points: `ledger/<person>/main.journal` includes the others.

## Safety / git rules

- Do **not** commit to `main` directly.
- Work on a feature branch, commit changes, and push the branch for Naman to review/merge.
- Journal-only updates to `main` must be done via `scripts/push-journals-to-main.sh` (when Naman chooses to use it).

## Adding an expense (chat workflow)

When Naman gives an expense in natural language, extract:
- Who: `naman` or `bhavana`
- Date/time (default: today in IST)
- Amount + currency (default: INR if unspecified)
- Merchant/payee + short note
- Payment source (cash / UPI / card / bank / etc.)
- Category (hledger expense account)

If any of the following are missing, ask **one** clarifying question at a time:
- Who (naman vs bhavana)
- Amount
- Payment source account
- Expense category account

### Where to write

Append transactions to:
- `ledger/naman/2026.journal` or
- `ledger/bhavana/2026.journal`

Keep the format compatible with hledger.

### Draft-first, then write

Prefer to show the proposed hledger transaction first. After confirmation, apply it.

## Useful hledger commands (reference)

Run commands from the repo root.

- Validate parse:
  - `hledger -f ledger/naman/main.journal print -n 1`
  - `hledger -f ledger/bhavana/main.journal print -n 1`
- Monthly summary:
  - `hledger -f ledger/naman/main.journal bal expenses -M`
- Recent transactions:
  - `hledger -f ledger/naman/main.journal reg -n 20`

(Expand this list over time as Naman shares the exact commands he uses.)
