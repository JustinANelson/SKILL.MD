---
name: privacy-and-pii
description: Use when collecting, storing, logging, exporting, or sending personal data (names, emails, addresses, health, financial, location, or analytics identifiers) to third parties, to minimize collection and support deletion and export.
metadata:
  category: security-and-privacy
  tagline: 'User emails in logs, analytics, and a vendor you forgot about'
  summary: 'Privacy by default: collect only what is needed, keep PII out of logs and prompts, set retention limits, and support real export and deletion.'
---

# Privacy & Personal Data

- Collect only the personal data the feature needs; ask before adding fields like birth date, phone number, or precise location.
- Keep PII out of logs, error trackers, analytics events, URLs, and LLM prompts. Log user IDs instead of emails or names, and redact sensitive fields in error reports.
- When adding a third-party SDK or API that receives user data, tell the user so it can be disclosed in the privacy policy.
- Design for deletion: removing an account should delete or anonymize the user's data across tables, file storage, search indexes, and caches, not just set a flag.
- Support exporting a user's data in a machine-readable format when the product stores their content or profile.
- Set retention periods for logs, backups, and inactive data instead of keeping everything forever.
- Encrypt highly sensitive data (government IDs, health, financial) at rest and restrict which services and roles can read it.
- Do not claim legal compliance. Flag likely GDPR, CCPA, HIPAA, or COPPA implications to the user instead.
