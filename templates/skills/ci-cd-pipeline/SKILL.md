---
name: ci-cd-pipeline
description: Use when authoring or editing GitHub Actions workflows, CI/CD scripts, or automated pipelines, to ensure reliable, cached, and secure automated checks.
---

# CI/CD Pipeline & GitHub Actions Hygiene

- Keep CI pipelines fast and deterministic: enable dependency caching (e.g., `actions/setup-node` with `cache: 'npm'`, `actions/cache` for build tools).
- Run linting, type-checking, and test suites in parallel matrix jobs to minimize pull request feedback time.
- Restrict workflow permissions following least-privilege principles with top-level `permissions:` blocks (e.g., `contents: read`).
- Pin GitHub Actions versions to full commit SHAs or verified major tags (e.g., `actions/checkout@v4`) to mitigate supply-chain risks.
- Never hardcode tokens or passwords in workflow files; inject credentials exclusively via encrypted repository secrets (`${{ secrets.API_KEY }}`).
- Prevent redundant, billable CI runs on rapid commits using concurrency cancellation groups (`cancel-in-progress: true`).
- Fail builds immediately on failed tests or lint errors rather than continuing subsequent deployment steps (`set -e` or job dependencies).
