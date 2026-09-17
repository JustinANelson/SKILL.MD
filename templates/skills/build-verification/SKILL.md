---
name: build-verification
description: Use before marking any feature or bug fix complete, to ensure the production build, TypeScript types, and bundler compile without deployment-blocking errors.
---

# Build Verification (Zero Deployment Surprises)

- Run the project's production build command before finishing (e.g., `npm run build`, `pnpm build`, `vite build`, `next build`, or `tsc --noEmit`).
- Do not ignore TypeScript errors (`@ts-ignore` or `any`) simply to force a build to pass—resolve the type mismatch or missing interface accurately.
- Verify that dynamic imports, route parameters, and server/client component boundaries (`"use client"` vs `"use server"`) are placed correctly.
- Ensure all imported assets (images, icons, styles, utils) actually exist on disk and paths use case-sensitive naming to avoid Linux/CI build failures.
- If the build fails, diagnose and fix the root compilation failure before claiming the task is done.
