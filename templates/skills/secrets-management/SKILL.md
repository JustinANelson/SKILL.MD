---
name: secrets-management
description: Use when adding or rotating API keys, tokens, credentials, or signing secrets, or when a secret may have been exposed, to keep secrets scoped, out of version control and client bundles, and revoked quickly after a leak.
metadata:
  category: security-and-privacy
  tagline: 'An API key committed to git, "fixed" by deleting the file'
  summary: 'Secret lifecycle discipline: least-privilege keys per environment, nothing in git or client bundles, and immediate rotation when one leaks.'
---

# Secrets Management

- **If a secret is exposed, rotate it immediately.** Deleting it in a new commit does not help; it remains in git history, forks, and caches. Revoke the key at the provider first, then clean history if needed.
- Use separate keys for development, staging, and production, and never use production credentials locally.
- Request the narrowest scopes available (read-only, single project, restricted keys) instead of account-wide admin keys.
- Add `.env` and credential files to `.gitignore` before the first commit, and check `git status` before committing new config files.
- Never expose server secrets through client bundles: variables prefixed `NEXT_PUBLIC_`, `VITE_`, `PUBLIC_`, or `EXPO_PUBLIC_` ship to every browser.
- Load production secrets from the hosting platform's secret store or a secrets manager, not from files baked into images or repositories.
- Verify webhook signatures with the provider's signing secret using a constant-time comparison.
- Never print secrets in logs, error messages, CI output, or chat replies; show only the last few characters when confirming which key is in use.
