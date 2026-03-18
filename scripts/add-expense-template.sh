#!/usr/bin/env bash
set -euo pipefail

# Minimal helper: prints a skeleton hledger transaction you can paste.
# Usage:
#   ./scripts/add-expense-template.sh naman 2026-03-18 "Chai" 250 INR "assets:cash" "expenses:food:chai"

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

cat <<EOF
${date} ${payee}
    ${to_acct}    ${amount} ${ccy}
    ${from_acct}
EOF
