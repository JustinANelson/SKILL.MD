---
name: database-safety
description: Use when altering database schemas, migrations, or models, to prevent accidental data loss, table resets, and destructive schema operations.
---

# Database Safety (Preserve Data & Sanity)

- Never execute destructive database wipe commands (e.g., `prisma db push --force-reset`, `drizzle-kit push --force`, `DROP DATABASE`, `TRUNCATE`) without explicit written permission from the user.
- Prefer additive, backward-compatible schema changes:
  - Add new columns as optional/nullable or with safe default values.
  - Avoid renaming or deleting existing columns with data unless a dedicated data migration script is provided.
- Ensure foreign key constraints and cascades do not accidentally delete related user records upon deleting a parent record.
- Keep seed scripts (`seed.ts` / `seed.sql`) idempotent: they should safely insert demo data if missing without crashing or producing duplicate rows on repeated runs.
- Warn the user in advance if a database migration requires manual downtime or backfilling existing rows.
