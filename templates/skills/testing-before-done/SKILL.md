---
name: testing-before-done
description: Use before reporting any coding task as complete, to verify the change actually works rather than assuming it does.
---

# Testing Before Done

- Run the project's existing test suite, linter, or type checker before calling a change done.
- Add a test for new logic when the project has a test suite, following its existing test style.
- For UI changes, run the app and exercise the change plus one edge case before reporting success.
- If a change cannot be verified in this environment, say so explicitly instead of claiming it works.
- Prefer fixing the root cause of a failing check over disabling or skipping the check.
