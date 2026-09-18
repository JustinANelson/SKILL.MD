---
name: auth-flow-guard
description: Use when implementing or altering authentication (Clerk, Supabase, NextAuth, Firebase, Auth0), protected routes, or user session state, to avoid flashes of private content and null-user crashes.
metadata:
  category: vibe-coder-essentials
  tagline: 'Flash of private dashboard UI & null user errors'
  summary: 'Rock-solid auth flows: stops flashes of protected content, safely handles null users, and cleans up state on logout.'
---

# Auth Flow Guard

- Guard against "flash of protected content": display a clean centered loading spinner while the auth session is resolving, instead of temporarily rendering private dashboard UI and then redirecting.
- Handle null users safely: never access `user.id`, `user.email`, or `user.metadata` without defensive optional chaining (`user?.id`) or checking `if (!user) return <Redirect />` first.
- Ensure route middleware or server layouts properly verify tokens on server-side requests rather than relying solely on client-side redirect hooks.
- Keep login/logout redirects intuitive: redirect unauthenticated users to `/login?redirect=/intended-page`, and send them back to their requested page once authenticated.
- Clear user-specific state and cached queries in local state or browser storage upon logging out so subsequent guests cannot view previous session data.
