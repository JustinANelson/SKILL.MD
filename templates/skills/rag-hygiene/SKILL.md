---
name: rag-hygiene
description: Use when building retrieval-augmented generation, embeddings, vector search, or chat-with-your-docs features, to keep retrieval accurate, cited, fresh, and limited to what each user is allowed to see.
metadata:
  category: ai-llm-engineering
  tagline: 'The chatbot quotes a document the user should never see'
  summary: 'Trustworthy retrieval: structure-aware chunking, per-user access filters at query time, source citations, and re-indexing when content changes.'
---

# RAG Hygiene

- **Enforce access control at retrieval time.** Filter vector search by tenant, user, or permission metadata in the query itself; never retrieve everything and rely on the prompt to hide it.
- Chunk by document structure (headings, paragraphs, functions) with modest overlap, and store source ID, title, path or URL, and updated-at with every chunk.
- Return citations with answers so users can verify claims, and instruct the model to say it does not know when the retrieved context lacks the answer.
- Re-embed or delete chunks when source documents change or are removed; stale and orphaned chunks produce confident wrong answers.
- Record which embedding model built the index. Switching models requires a full re-embed, never a mix of vectors.
- Use hybrid search (keyword + vector) when users search for exact identifiers, error codes, or names that embeddings match poorly.
- Log the retrieved chunk IDs per query so a bad answer can be traced to bad retrieval or bad generation.
