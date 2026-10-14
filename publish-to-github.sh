#!/usr/bin/env bash
set -Eeuo pipefail

REMOTE='git@github.com:Wilson-Nhlanhla-Radebe/corp-lab-active-directory-infrastructure.git'
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

fail() { printf 'ERROR: %s\n' "$*" >&2; exit 1; }

command -v git >/dev/null 2>&1 || fail 'Git is not installed. Install Git, then run this script again.'

printf 'Target repository: %s\n' "$REMOTE"
printf 'Local project path: %s\n\n' "$ROOT"

# Test the caller's own SSH identity; no key or token is copied into this package.
if ! git ls-remote "$REMOTE" >/dev/null 2>&1; then
  cat >&2 <<'EOF'
SSH access to the target repository failed from this computer.
Check your own SSH setup with:
  ssh -T git@github.com
Then confirm the public SSH key is added to the intended GitHub account and rerun this script.
Do not paste a private key, passphrase, or personal access token into chat.
EOF
  exit 1
fi

if [[ ! -d "$ROOT/.git" ]]; then
  REMOTE_REFS="$(git ls-remote "$REMOTE")"
  [[ -z "$REMOTE_REFS" ]] || fail 'The remote already has commits. Refusing to overwrite or merge automatically; clone it and review the existing content first.'
  git -C "$ROOT" init --initial-branch=main
  git -C "$ROOT" remote add origin "$REMOTE"
else
  CURRENT_REMOTE="$(git -C "$ROOT" remote get-url origin 2>/dev/null || true)"
  if [[ -z "$CURRENT_REMOTE" ]]; then
    git -C "$ROOT" remote add origin "$REMOTE"
  elif [[ "$CURRENT_REMOTE" != "$REMOTE" ]]; then
    fail "This folder's origin is '$CURRENT_REMOTE', not the target repository. No push was performed."
  fi
  CURRENT_BRANCH="$(git -C "$ROOT" branch --show-current)"
  if [[ "$CURRENT_BRANCH" != 'main' ]]; then
    if git -C "$ROOT" show-ref --verify --quiet refs/heads/main; then
      git -C "$ROOT" switch main
    else
      git -C "$ROOT" branch -M main
    fi
  fi
fi

# Use the account's standard GitHub noreply address only if this local repo has no author configured.
if [[ -z "$(git -C "$ROOT" config user.name || true)" ]]; then
  git -C "$ROOT" config user.name 'Wilson Nhlanhla Radebe'
fi
if [[ -z "$(git -C "$ROOT" config user.email || true)" ]]; then
  git -C "$ROOT" config user.email '172423311+Wilson-Nhlanhla-Radebe@users.noreply.github.com'
fi

# Guard against accidental archives/backups/secrets before staging.
if find "$ROOT" -type f \( -name '*.pem' -o -name '*.key' -o -name '*.ppk' -o -name 'oci.config' -o -name '.env' -o -name '*.zip' -o -name '*.sql.gz' \) -not -path "$ROOT/.git/*" -print -quit | grep -q .; then
  fail 'A file matching a sensitive-key/config/archive pattern was found. Remove it before publishing.'
fi

cd "$ROOT"
git add --all
if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  git commit -m 'Publish Corp Lab infrastructure portfolio'
elif ! git diff --cached --quiet; then
  git commit -m 'Update Corp Lab infrastructure portfolio'
else
  printf 'No staged content changes detected; attempting to push the existing main branch.\n'
fi

git push --set-upstream origin main
printf '\nPublished repository: https://github.com/Wilson-Nhlanhla-Radebe/corp-lab-active-directory-infrastructure\n'
