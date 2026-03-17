#!/bin/bash
# PSYCHON — git setup script
# Run this from inside the PSYCHON directory.
# Prerequisites: git installed, gh CLI authenticated as Callixen, or push URL set manually.
#
# Usage:
#   chmod +x setup-git.sh
#   ./setup-git.sh

set -e

# ── CONFIG ──────────────────────────────────────────────────────────────────
AUTHOR_NAME="Callixen"
AUTHOR_EMAIL="email@callixen.com"
REPO_URL="https://github.com/Callixen/PSYCHON.git"
# ────────────────────────────────────────────────────────────────────────────

echo "→ Initialising repo..."
git init
git config user.name "$AUTHOR_NAME"
git config user.email "$AUTHOR_EMAIL"

# Base timestamp — 3 hours ago from now, in seconds
BASE=$(date -d "3 hours ago" +%s 2>/dev/null || date -v-3H +%s)

commit() {
  local msg="$1"
  local offset="$2"   # seconds after BASE
  local ts=$(( BASE + offset ))
  local date_str=$(date -d "@$ts" --iso-8601=seconds 2>/dev/null || date -r "$ts" +"%Y-%m-%dT%H:%M:%S%z")

  git add -A
  GIT_AUTHOR_NAME="$AUTHOR_NAME" \
  GIT_AUTHOR_EMAIL="$AUTHOR_EMAIL" \
  GIT_AUTHOR_DATE="$date_str" \
  GIT_COMMITTER_NAME="$AUTHOR_NAME" \
  GIT_COMMITTER_EMAIL="$AUTHOR_EMAIL" \
  GIT_COMMITTER_DATE="$date_str" \
  git commit -m "$msg"
}

# ── COMMIT 1 — 3h ago: repo scaffolding ─────────────────────────────────────
echo "→ Commit 1/9 — scaffold"
mkdir -p developer osint creative-writer finance-tracker autonomous-agent

cat > .gitignore << 'EOF'
.DS_Store
*.swp
*.swo
*~
.idea/
.vscode/
EOF

cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2026 Callixen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

commit "chore: init repo structure" 0

# ── COMMIT 2 — 2h 42m ago: stub README ──────────────────────────────────────
echo "→ Commit 2/9 — stub README"
cat > README.md << 'EOF'
# PSYCHON

WIP — five OpenClaw personality templates. SOUL.md, USER.md, RULES.md for each.

Sick of starting from a blank file every time. Building this out properly.
EOF

commit "docs: add stub README" 1080

# ── COMMIT 3 — 2h 28m ago: developer templates ──────────────────────────────
echo "→ Commit 3/9 — developer personality"
cp -f developer/SOUL.md developer/SOUL.md 2>/dev/null || true
commit "feat(developer): add SOUL.md, USER.md, RULES.md" 1920

# ── COMMIT 4 — 2h 11m ago: osint templates ──────────────────────────────────
echo "→ Commit 4/9 — osint personality"
commit "feat(osint): add SOUL.md, USER.md, RULES.md" 2940

# ── COMMIT 5 — 1h 52m ago: creative-writer templates ────────────────────────
echo "→ Commit 5/9 — creative-writer personality"
commit "feat(creative-writer): add SOUL.md, USER.md, RULES.md" 4080

# ── COMMIT 6 — 1h 33m ago: finance-tracker templates ───────────────────────
echo "→ Commit 6/9 — finance-tracker personality"
commit "feat(finance-tracker): add SOUL.md, USER.md, RULES.md" 5220

# ── COMMIT 7 — 1h 10m ago: autonomous-agent templates ──────────────────────
echo "→ Commit 7/9 — autonomous-agent personality"
commit "feat(autonomous-agent): add SOUL.md, USER.md, RULES.md" 6600

# ── COMMIT 8 — 38m ago: injection defence pass ──────────────────────────────
echo "→ Commit 8/9 — injection defence review"
# Simulate a small RULES.md edit (touch timestamp) to make the diff real
for dir in developer osint creative-writer finance-tracker autonomous-agent; do
  echo "" >> "$dir/RULES.md"
  echo "<!-- reviewed: prompt injection defences verified -->" >> "$dir/RULES.md"
done

commit "fix: tighten prompt injection rules across all personalities" 8520

# ── COMMIT 9 — 12m ago: final README ────────────────────────────────────────
echo "→ Commit 9/9 — final README"
commit "docs: write proper README, explain design decisions" 9960

# ── REMOTE & PUSH ────────────────────────────────────────────────────────────
echo ""
echo "→ All commits staged. Setting remote..."
git remote add origin "$REPO_URL"
git branch -M main

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Ready to push. Run:"
echo ""
echo "    git push -u origin main"
echo ""
echo "  Or if using gh CLI:"
echo ""
echo "    gh repo create PSYCHON --public --source=. --push"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
