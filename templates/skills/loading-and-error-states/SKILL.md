---
name: loading-and-error-states
description: Use when building asynchronous actions, data fetches, button submissions, or list views, to ensure clear UI loading feedback, error toasts, and engaging empty states.
metadata:
  category: vibe-coder-essentials
  tagline: 'White screen freeze or multi-click duplicates'
  summary: 'Zero white screens: adds skeleton loaders, disables buttons while submitting, shows error toasts, and designs helpful empty states.'
---

# Loading, Error & Empty States

- Never leave the user wondering if a click worked: immediately show an inline spinner or change the button text to "Saving..." / "Generating..." upon triggering an async action.
- Disable submit buttons during pending requests to prevent accidental duplicate submissions and double credit charges.
- Use skeleton loaders or subtle pulse placeholders for data tables, card grids, and dashboard metrics instead of flashing blank white screens during page load.
- Catch API fetch failures gracefully: display an informative, friendly toast notification or banner (e.g., "Failed to load projects. Please retry.") instead of crashing the UI.
- Provide a helpful "Retry" button when network requests or backend operations fail.
- Build intentional empty states: when lists or search results contain zero items, display a helpful card with an illustration/icon and a clear call-to-action button (e.g., "No projects found. Create your first project").
