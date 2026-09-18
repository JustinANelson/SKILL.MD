---
name: authorization-checks
description: Use when writing API routes, server actions, resolvers, or database queries that read or change user-owned data, to enforce object-level permission checks so users cannot access other users' records.
metadata:
  category: security-and-privacy
  tagline: 'Change the ID in the URL, see someone else''s invoice'
  summary: 'Server-side ownership checks on every read and write: scoped queries, row-level security, and never trusting IDs or roles sent by the client.'
---

# Authorization Checks (Object-Level Access Control)

- Authentication answers "who is this"; authorization answers "may they touch *this record*". Check both on every server-side read and write.
- Scope queries by the authenticated user or tenant (`WHERE id = ? AND owner_id = ?`) instead of fetching by ID and checking afterwards, or forgetting to check.
- Derive user ID, tenant ID, and role from the verified session or token on the server, never from request bodies, query params, or hidden form fields.
- Protect every entry point, not just the UI: API routes, server actions, GraphQL resolvers, file download URLs, and background jobs. Hiding a button is not access control.
- Return `404` rather than `403` for records the user cannot access when revealing that they exist would leak information.
- Centralize permission logic in a policy helper or middleware instead of scattering ad-hoc `if (user.isAdmin)` checks.
- When the database is exposed to clients (e.g., Supabase or Firebase), enable row-level security on every table and write policies tied to the authenticated user; never ship `using (true)` or open read rules.
- For each new resource, add a test proving user A cannot read, update, or delete user B's record.
