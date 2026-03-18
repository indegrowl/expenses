#!/usr/bin/env bash
set -euo pipefail

# Append a single hledger transaction to the appropriate journal file,
# validate with hledger, and revert the file if validation fails.
#
# Usage:
#   ./scripts/add-expense.sh <naman|bhavana> <YYYY-MM-DD> <payee> <amount> [CCY] [from_acct] [to_acct]
#
# Example:
#   ./scripts/add-expense.sh naman 2026-03-18 "Chai" 250 INR assets:cash expenses:food:chai

person="${1:-}"
date="${2:-}"
payee="${3:-}"
amount="${4:-}"
ccy="${5:-INR}"
from_acct="${6:-assets:cash}"
to_acct="${7:-expenses:unknown}"

if [[ -z "$person" || -z "$date" || -z "$payee" || -z "$amount" ]]; then
  echo "Usage: $0 <naman|bhavana> <YYYY-MM-DD> <payee> <amount> [CCY] [from_acct] [to_acct]" >&2
  exit 1
fi

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$repo_root"

if ! command -v hledger >/dev/null 2>&1; then
  echo "ERROR: hledger is not installed or not on PATH. Refusing to write." >&2
  exit 1
fi

main_journal="ledger/${person}/main.journal"
txn_journal="ledger/${person}/2026.journal"

if [[ ! -f "$main_journal" ]]; then
  echo "ERROR: missing $main_journal" >&2
  exit 1
fi
if [[ ! -f "$txn_journal" ]]; then
  echo "ERROR: missing $txn_journal" >&2
  exit 1
fi

backup="${txn_journal}.bak.$(date +%s)"
cp -a "$txn_journal" "$backup"

# Ensure a blank line before appending for readability.
printf "\n%s %s\n    %s    %s %s\n    %s\n" \
  "$date" "$payee" "$to_acct" "$amount" "$ccy" "$from_acct" >> "$txn_journal"

# Validate parse by asking hledger to print a single txn.
if hledger -f "$main_journal" print -n 1 >/dev/null 2>&1; then
  rm -f "$backup"
  echo "OK: added transaction to $txn_journal"
else
  echo "ERROR: hledger validation failed; reverting $txn_journal" >&2
  mv -f "$backup" "$txn_journal"
  exit 1
fi
