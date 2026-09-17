---
name: accessibility-baseline
description: Use when writing or modifying HTML, UI components, forms, and dialogs, to meet WCAG 2.1 AA accessibility standards, semantic markup, and keyboard navigability.
---

# Accessibility Baseline (a11y & Semantic Markup)

- Use native semantic HTML elements (`<button>`, `<nav>`, `<main>`, `<article>`, `<header>`, `<footer>`) instead of styling `<div>` or `<span>` with click handlers.
- Ensure all interactive elements are reachable and operable via keyboard alone (`Tab`, `Shift+Tab`, `Enter`, `Space`, `Escape`).
- Never remove focus outlines without providing an accessible alternative: ensure `:focus-visible` styles clearly highlight focused elements for keyboard users.
- Add descriptive `aria-label` or `aria-labelledby` attributes to icon-only buttons (e.g., close buttons, search icons, theme toggles).
- Provide meaningful `alt` text on images describing visual content; use `alt=""` for purely decorative illustrations.
- Trap focus inside active modal dialogs, close them on `Escape` keypress, and return keyboard focus to the trigger element when closed.
- Ensure form inputs have permanently associated `<label>` tags (via `htmlFor` / `id` or nesting) rather than relying solely on disappearing placeholders.
