---
name: no-dead-ends
description: Use when building UI features, pages, buttons, or routes, to ensure all interactive elements work end-to-end and placeholder mocks are never silently abandoned.
metadata:
  category: vibe-coder-essentials
  tagline: 'Buttons that do nothing and silent mock data'
  summary: 'Honest completion: eliminates fake "dummy" buttons that do nothing, wires forms end-to-end, and flags mock data clearly.'
---

# No Dead Ends (Honest UI & Complete Features)

- Never ship non-functional "dummy" buttons or links that do nothing when clicked without clear disabled styling or a tooltip explaining why.
- Wire every form submission to an actual handler with loading states and user feedback (success toast, error alert).
- If a feature is temporarily backed by mock data during early development:
  - Add a visible banner or badge indicating "Demo / Mock Mode".
  - Leave clear instructions on where to connect the live API route or database query.
  - Never pretend a feature is working end-to-end if it is still returning hardcoded mock arrays.
- Test empty states, zero items, and missing search results so pages don't look broken when there's no data.
- Ensure 404 and error boundaries catch unknown routes gracefully with a button to navigate back to the home page.
