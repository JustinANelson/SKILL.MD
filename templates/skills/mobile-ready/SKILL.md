---
name: mobile-ready
description: Use when building or editing UI layouts, navigation, modals, and landing pages, to guarantee clean responsiveness on mobile viewports with no horizontal scroll bugs.
---

# Mobile-Ready Responsiveness

- Design and test for small viewports first (375px–430px mobile width) before assuming wide desktop screen real estate.
- Prevent accidental horizontal scrolling: inspect parent wrappers for fixed widths, wide tables, or negative margins that cause `overflow-x` leaks.
- Ensure all interactive touch targets (buttons, links, icon toggles) are at least 44x44px for easy tapping on mobile screens.
- Keep navigation mobile-friendly: collapse wide navigation menus into an accessible mobile drawer or hamburger menu on smaller screens.
- Position modals, sheets, and bottom popups so they fit within mobile viewports without locking the screen or rendering close buttons unreachable.
- Test mobile keyboards: ensure inputs and fixed bottom action bars remain visible and accessible when virtual keyboards open.
