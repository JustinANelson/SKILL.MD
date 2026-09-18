---
name: container-hygiene
description: Use when writing or modifying Dockerfiles, container configs, docker-compose files, or containerized deployments, to ensure secure, lightweight, and fast image builds.
metadata:
  category: architecture-and-devops
  tagline: 'Docker & Containers'
  summary: 'Production container best practices: multi-stage Dockerfiles, non-root users, .dockerignore, and layer caching.'
---

# Container & Docker Hygiene

- Use multi-stage builds: compile dependencies and assets in a builder stage, then copy only runtime binaries or static artifacts into a minimal final production image.
- Choose minimal, security-patched base images (e.g., `alpine`, `slim`, or `distroless`) to shrink attack surface and reduce download times.
- **Never run containers as root in production**: create and switch to an unprivileged system user (`USER appuser` or `USER node`).
- Order Dockerfile instructions to maximize layer caching: copy package manifests (`package*.json`, `requirements.txt`, `go.mod`) and install dependencies *before* copying application source code.
- Always include a `.dockerignore` file excluding `.git`, `node_modules`, `dist`, `.env`, and local caches from the build context.
- Define an explicit `HEALTHCHECK` command so orchestrators (Docker, Kubernetes, AWS ECS) can monitor container responsiveness.
- Avoid pinning `:latest` tag on production base images: use explicit version tags (e.g., `node:20-alpine`) for reproducible builds.
