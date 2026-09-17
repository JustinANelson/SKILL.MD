---
name: dev-server-sanity
description: Use when configuring ports, CORS, OAuth callbacks, local dev scripts, or environment configs, to prevent confusing port drift (3000 vs 3001) and broken local callback loops.
---

# Dev Server & Port Sanity

- Keep local development ports consistent: specify an explicit default port in your dev script or config (e.g., `PORT=3000` or `vite --port 3000 --strictPort`) so tools fail visibly rather than silently switching to 3001 and breaking OAuth callbacks or CORS settings.
- If a port collision occurs ("port 3000 already in use"), provide the exact single-line command to locate and terminate the orphaned background process (e.g., `npx kill-port 3000` or `Get-Process`).
- Align external OAuth redirect URIs: ensure redirect URLs in `.env.local` (e.g., `NEXT_PUBLIC_APP_URL=http://localhost:3000`) precisely match the configured auth provider dashboard callback URLs.
- Prevent CORS traps: when frontend and backend run on separate local ports (e.g., 3000 and 8000), configure explicit local CORS middleware or proxy rewrites so requests are not blocked by browser origin policies.
- Ensure hot-module reload (HMR) and websocket connections work smoothly without infinite reconnection loops in terminal logs.
