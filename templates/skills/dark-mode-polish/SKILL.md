---
name: dark-mode-polish
description: Use when writing or styling UI components, dropdowns, popups, form inputs, or typography, to ensure clean contrast and prevent unreadable white-on-white or dark-on-dark rendering in both themes.
metadata:
  category: vibe-coder-essentials
  tagline: 'Unreadable dark-on-dark or white-on-white text'
  summary: 'High-contrast themes: ensures modals, inputs, and dropdowns adapt cleanly without unreadable white-on-white or dark-on-dark bugs.'
---

# Dark Mode & Contrast Polish

- Avoid hardcoded color values (`bg-white`, `text-black`) unless explicitly paired with reciprocal dark variants (`dark:bg-zinc-900`, `dark:text-zinc-100`).
- Always check form input fields: ensure text, placeholder text, borders, and input backgrounds are easily legible and contrast cleanly in both light and dark modes.
- Inspect floating UI elements: tooltips, popovers, dropdown menus, and modal dialogs must inherit theme backgrounds and borders so they don't blend invisibly into the page background.
- Maintain accessible text contrast (WCAG AA standard): avoid low-contrast gray text on dark backgrounds or light gray text on white backgrounds.
- Ensure icons and SVG illustrations adapt their fill/stroke colors with `currentColor` or theme tokens instead of remaining invisible dark-on-dark icons.
