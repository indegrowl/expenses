# Account Descriptions (hledger)

This file is a **human layer** over the hledger account tree.
It exists so the expense-tracker skill can pick the right accounts consistently.

Conventions:
- Accounts are case-sensitive and use `:` separators.
- Expense accounts are positive; payments/asset decreases show as negative on the asset side.
- For relationship reimbursements, we currently use `Expenses:Relationship:*` as a clearing bucket in the journals (positive = you paid for them; negative = they paid/returned to you).

See also: `CATEGORY_REVIEW.md` (a blunt critique + suggested improvements, with references to `case-studies/`).

---

## Naman ledger (`ledger/naman/*`)

### Assets

- **Assets:Bank:SBI** — Naman’s SBI bank account (primary spend account in 2026 journal).
  - Seen for: subscriptions (YouTube/Audible/Hostinger), food, commute, office rent, etc.

- **Assets:Bank:HDFC** — Naman’s HDFC bank account.
  - Seen for: bank charges, Adobe subscription.

- **Assets:Bank:ICICI / Axis / Kotak / YesBank / Federal / IndusInd** — Other bank accounts (declared; may be unused so far in 2026 journal).
  - Use when the payment actually happened from that bank.

- **Assets:Cash** — Physical cash on hand (declared; not used in 2026 journal yet).

- **Assets:Cash:Wallet** — Cash-in-wallet bucket used in opening balances.
  - Note: this exists in transactions but is **not** declared in `accounts.journal` yet.

- **Assets:Wallet:GPay / Paytm / PhonePe / CRED / AmazonPay** — Wallet/UPI balances (declared; use when money sits inside these apps rather than directly in a bank account).

- **Assets:FD / Assets:FD:HDFC / Assets:FD:SBI** — Fixed deposits (declared; may be legacy/alternate structure).

- **Assets:Investments:FixedDeposit:HDFC** — FD investment bucket used in opening balances.

- **Assets:Investments:Stocks** — Stocks portfolio bucket (declared; high level).

- **Assets:Investments:Stocks:ICICIBANK:Lot-20250307 / Lot-20250320 / Lot-20250803** — Specific ICICIBANK lots (opening balances use stock units + cost).

- **Assets:Investments:MF / PPF / EPF / NPS / Crypto / Gold** — Investment buckets (declared; not used yet in 2026 journal).

- **Assets:Receivable:GharKharch** — Money Naman should receive back from “home groceries/household” pool.
  - Seen for: groceries/house items that are reimbursed later.

- **Assets:Receivable:Pooja / Taskeer** — Loans/IOUs where those people owe Naman (cleared on repayment).

- **Assets:Receivable:Mecha** — Work reimbursement receivable (e.g., shipping/parcel reimbursement).

### Liabilities

- **Liabilities:CreditCard:HDFC / SBI / ICICI / Axis** — Credit card liabilities (declared, but the 2026 journal also uses more specific subaccounts).

- **Liabilities:CreditCard:SBI:Flipkart** — SBI Flipkart card liability used in opening balances.
  - Note: exists in transactions but is not declared in `accounts.journal` yet.

- **Liabilities:CreditCard:Federal** — Federal credit card liability used for a book purchase.
  - Note: exists in transactions but is not declared in `accounts.journal` yet.

- **Liabilities:Loan:* (HDFC/SBI/Car/Home)** — Loan liabilities (declared; high level).

- **Liabilities:Loans:Dad / Liabilities:Loans:Mom** — Specific loan buckets used in opening balances.
  - Note: naming differs from declared `Liabilities:Loan:*`.

- **Liabilities:Payable:SriTanvi** — Money Naman is holding temporarily that must be paid onward.
  - Seen for: receiving from mom → paying intern.

### Income / Equity

- **Income:Salary / Freelance / Dividends / Interest / Rental / CapitalGains:STCG/LTCG** — Declared income categories (not used yet in 2026 journal).

- **Income:Misc:Unknown** — Catch-all income for small unexplained credits.

- **Equity:Opening / Equity:OpeningBalance** — Opening balance equity accounts.
  - Note: both forms appear (declared vs used).

### Expenses

- **Expenses:Entertainment:Subscriptions:YouTube** — YouTube Premium subscription.

- **Expenses:Books:Audible** — Audible subscription.

- **Expenses:Books:Learning** — Learning/books bought (e.g., “Bayesian Statistics the Fun Way”).

- **Expenses:Cloud:Services** — SaaS/services (Hostinger VPS, Claude Code, Microsoft 365, etc.).

- **Expenses:Photography:InstaXFilm** — Consumables for instant camera.

- **Expenses:Photography:Software** — Adobe Lightroom/Photoshop subscription.

- **Expenses:Transport:Fuel** — Fuel/petrol.

- **Expenses:Transport:Cab** — Cab rides.

- **Expenses:Transport:Auto** — Auto-rickshaw rides.

- **Expenses:Office:Rent** — Coworking / shutter-office rent.

- **Expenses:Food:Treats** — Snacks/sweets/impulse treats.

- **Expenses:Food:Dining** — Restaurant / ordering meals.

- **Expenses:Food:Groceries** — Grocery purchases.

- **Expenses:Finance:BankCharges** — Fees/charges from banks.

- **Expenses:Waste** — Money spent due to mistakes/waste (bad journal quality, forgetting ID leading to extra commute, etc.).

- **Expenses:Relationship:Bhavana** — Clearing bucket for money spent on/for Bhavana or money received from her.
  - Positive: Naman paid for Bhavana.
  - Negative: Bhavana paid/returned money to Naman.

- **Expenses:SnapStreak** — Snapchat streak restore purchases/refunds.

- **Expenses:Misc** — Small miscellaneous expenses (e.g., printouts).

---

## Bhavana ledger (`ledger/bhavana/*`)

### Assets / Equity

- **Assets:Bank:ICICI** — Bhavana’s ICICI bank account (primary spend account in 2026 journal).

- **Assets:Bank:UBI** — Bhavana’s UBI bank account (present in opening balances; not used in postings yet).

- **Equity:OpeningBalance** — Opening balance equity account.

### Expenses

- **Expenses:Relationship:Naman** — Clearing bucket for Naman-related shared spending and reimbursements.
  - Positive: Bhavana paid for Naman.
  - Negative: Naman paid/returned money to Bhavana.
  - Seen for: InstaX film for Naman, meals/groceries for Naman, refunds from Naman.

- **Expenses:Food:Treats** — Snacks/treats/quick food (lemon soda, Zepto cafe, etc.).

- **Expenses:Food:Groceries** — Grocery items (e.g., flour grinding).

- **Expenses:Transport:Commute** — Commute/transport rides and tickets (Rapido/Metro).

- **Expenses:Waste** — Wasteful/unplanned losses (e.g., extra ride because of forgotten ID).

---

## Gaps / TODO (intentionally tracked)

These accounts appear in transactions but are not declared in the current `accounts.journal` files:
- Naman: `Assets:Cash:Wallet`, `Liabilities:CreditCard:SBI:Flipkart`, `Liabilities:CreditCard:Federal`, `Liabilities:Loans:Dad`, `Liabilities:Loans:Mom`, `Income:Misc:Unknown`, `Assets:Investments:FixedDeposit:HDFC`

We can either:
1) add `account` declarations for them, or
2) rename/normalize to match the declared structure.
