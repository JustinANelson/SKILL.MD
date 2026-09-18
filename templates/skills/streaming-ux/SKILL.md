---
name: streaming-ux
description: Use when displaying LLM or other long-running generated responses in a UI, to stream output smoothly, support real cancellation, and recover from mid-stream failures.
metadata:
  category: ai-llm-engineering
  tagline: 'A 30-second spinner, then a wall of text (or nothing)'
  summary: 'Responsive AI interfaces: token streaming, Stop buttons that actually cancel upstream, and clean recovery when a stream fails halfway.'
---

# Streaming UX

- Stream responses (SSE or streaming fetch) for anything that takes more than a couple of seconds, and show a thinking indicator until the first token arrives.
- Provide a Stop button that cancels end-to-end: `AbortController` on the client **and** cancellation of the upstream model request on the server so it stops generating and billing.
- On a mid-stream error, keep the partial text, mark it as incomplete, and offer Retry instead of silently dropping it.
- Block resubmission while a response is streaming so rapid clicks cannot start duplicate streams.
- Auto-scroll only while the user is already at the bottom; stop when they scroll up to read.
- Render streaming markdown incrementally so unclosed code fences or lists do not break the layout, and avoid re-rendering the whole conversation on every token.
- Confirm the hosting platform does not buffer streamed responses, and set function timeouts above the longest expected generation.
