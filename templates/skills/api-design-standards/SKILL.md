---
name: api-design-standards
description: Use when creating or modifying REST/HTTP API endpoints, route handlers, or RPC interfaces, to enforce clean RESTful naming, HTTP status codes, and standard response envelopes.
metadata:
  category: architecture-and-devops
  tagline: 'REST & API Conventions'
  summary: 'Clean RESTful endpoints: plural nouns, HTTP verb semantics, standard status codes, and uniform response envelopes.'
---

# API Design Standards (REST & Route Conventions)

- Use consistent, plural nouns for resource collection endpoints (e.g., `/api/v1/projects`, `/api/v1/projects/:id/tasks`).
- Match HTTP verbs accurately to actions:
  - `GET`: Safe, idempotent resource retrieval (no side-effects).
  - `POST`: Create a new resource.
  - `PATCH`: Partial update of an existing resource.
  - `PUT`: Full replacement of an existing resource.
  - `DELETE`: Remove a resource.
- Return standard, semantic HTTP status codes:
  - `200 OK` for successful queries and updates.
  - `201 Created` for newly created entities (with location header if appropriate).
  - `204 No Content` for successful deletions with no response body.
  - `400 Bad Request` for malformed syntax.
  - `401 Unauthorized` for unauthenticated requests.
  - `403 Forbidden` for authenticated users lacking permissions.
  - `404 Not Found` for nonexistent resources.
  - `409 Conflict` for duplicate unique fields (e.g., existing email).
  - `422 Unprocessable Entity` for validation failures.
- Standardize response payload envelopes: wrap responses predictably (e.g., `{ "data": ... }` on success, `{ "error": { "code": "...", "message": "..." } }` on failure).
- Support standardized pagination on collections via `limit` / `offset` or cursor tokens (`cursor`, `next_cursor`), and include `total` or `has_more` in metadata.
- Version APIs in the URL path (`/api/v1/`) to preserve backward compatibility for mobile apps and external consumers.
