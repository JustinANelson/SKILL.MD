---
name: protect-existing-features
description: Use when modifying existing code or adding new features, to guarantee that previously working functionality, routes, and UI flows do not silently break.
---

# Protect Existing Features (No Regressions)

- Before touching existing code, identify the key user flows and functions that depend on it.
- Never modify or remove existing exported functions, component props, or API route shapes without checking every place they are called.
- When adding a feature to an existing page or component, preserve the layout, styling, and interactivity of adjacent elements.
- Verify the critical user journey after changes: verify that the new feature works AND that the previous core flow still works.
- If a change requires altering an existing behavior or data format, explain the trade-off explicitly before proceeding.
- When refactoring, keep input/output contracts identical so parent components and consumers continue working seamlessly.
