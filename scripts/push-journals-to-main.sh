#!/usr/bin/env bash
set -euo pipefail

# Push ONLY *.journal changes to origin/main.
# Safety checks:
# - Refuse if any changed file (vs origin/main) is not a .journal
# - Refuse if origin/main is not an ancestor of HEAD (prevents non-FF pushes)

cd "$(git rev-parse --show-toplevel 2>/dev/null)"

git fetch origin main --quiet

if ! git merge-base --is-ancestor origin/main HEAD; then
  echo "ERROR: origin/main is not an ancestor of your current HEAD."
  echo "Rebase/merge origin/main into your branch first, then try again."
  exit 1
fi

changed_files=$(git diff --name-only origin/main..HEAD)

if [[ -z "${changed_files}" ]]; then
  echo "Nothing to push (no changes vs origin/main)."
  exit 0
fi

bad_files=$(echo "${changed_files}" | grep -vE '\.journal$' || true)

if [[ -n "${bad_files}" ]]; then
  echo "ERROR: Refusing to push. Non-journal files changed vs origin/main:" >&2
  echo "${bad_files}" >&2
  exit 1
fi

echo "Pushing journal-only changes to origin/main..."
# Fast-forward push (since origin/main is an ancestor of HEAD)
git push origin HEAD:main

echo "Done."
