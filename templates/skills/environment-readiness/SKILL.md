---
name: environment-readiness
description: Use whenever adding external APIs, auth providers, or environment variables, to keep .env.example synchronized and provide foolproof setup guidance.
---

# Environment Readiness (Zero Deploy Amnesia)

- Whenever introducing a new environment variable (`process.env.*`, `import.meta.env.*`, etc.), immediately update `.env.example` with descriptive placeholder values.
- Never hardcode live secrets, private keys, or webhook secrets in sample files or code.
- Add clear comments in `.env.example` explaining where the user can obtain the key (e.g., `# Get your key from https://dashboard.stripe.com/test/apikeys`).
- Provide friendly, actionable runtime fallback messages if an environment variable is missing (e.g., `Error: Missing OPENAI_API_KEY. Add it to your .env file to enable AI summary features.`) instead of unhandled runtime crashes (`TypeError: Cannot read properties of undefined`).
- Notify the user at the end of the task if they need to copy a key into their production hosting dashboard (Vercel, Netlify, Railway, etc.).
