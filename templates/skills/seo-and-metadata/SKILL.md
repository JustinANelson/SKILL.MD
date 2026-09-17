---
name: seo-and-metadata
description: Use when creating or updating pages, layouts, landing pages, or public web routes, to configure essential Open Graph tags, dynamic page titles, and search metadata.
---

# SEO & Social Metadata

- Provide unique, descriptive `<title>` tags for every distinct page or route (e.g., `Dashboard | BrandName` or `Feature Name — BrandName`).
- Include accurate `<meta name="description">` tags (under 160 characters) clearly summarizing the page purpose.
- Add complete Open Graph tags (`og:title`, `og:description`, `og:image`, `og:url`, `og:type`) and Twitter card tags (`twitter:card`, `twitter:title`, `twitter:description`, `twitter:image`) so shared links render rich preview cards on Slack, X/Twitter, iMessage, and Discord.
- Ensure social preview images (`og:image`) use absolute URLs (e.g., `https://example.com/og.png`) and standard dimensions (1200x630px recommended).
- Include standard `<meta name="viewport" content="width=device-width, initial-scale=1.0">` on root HTML documents.
- Provide standard `robots.txt` and `sitemap.xml` endpoints or generators for discoverable public routes.
- Use canonical URL link tags (`<link rel="canonical" href="...">`) to prevent duplicate content indexing penalties across search engines.
