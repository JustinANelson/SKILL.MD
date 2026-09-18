---
name: rate-limiting-and-abuse
description: Use when building login, signup, password reset, contact forms, public APIs, AI endpoints, or anything that sends email or SMS, to add rate limits and abuse protection before bots find it.
metadata:
  category: security-and-privacy
  tagline: 'Bots brute-force logins and burn the SMS budget overnight'
  summary: 'Abuse-resistant endpoints: per-IP and per-account limits, backoff on failures, bot checks on public forms, and quotas on costly operations.'
---

# Rate Limiting & Abuse Prevention

- Rate-limit authentication endpoints (login, signup, password reset, OTP verification) per IP **and** per account, with increasing backoff after repeated failures.
- Put strict per-user and global quotas on endpoints that cost money or send messages: email, SMS, AI generation, file processing.
- Keep counters in a shared store (Redis, database, platform KV) when running multiple instances or serverless functions; in-memory counters reset per instance.
- Return `429 Too Many Requests` with a `Retry-After` header and show users a clear message rather than a generic error.
- Add bot protection (CAPTCHA, Turnstile, honeypot fields) to public unauthenticated forms such as signup and contact.
- Make login and password-reset responses identical whether or not the account exists, to prevent account enumeration.
- Cap request body sizes, page sizes, and query complexity so a single request cannot exhaust the server.
