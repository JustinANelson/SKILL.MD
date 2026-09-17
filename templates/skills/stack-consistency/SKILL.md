---
name: stack-consistency
description: Use when adding UI components, styling, or libraries, to strictly reuse the project's existing framework, styling system, and component library rather than mixing rival paradigms.
---

# Stack Consistency (No Framework Frankenstein)

- Inspect what the project is already using for styles, components, and state before writing new code.
- If the project uses Tailwind CSS, use Tailwind utility classes—do not introduce styled-components, raw CSS-in-JS, or external CSS stylesheets for one component.
- If the project already has a component library installed (e.g., Shadcn UI, Radix, Mantine, MUI), reuse existing component primitives instead of installing an alternative library.
- Reuse existing design tokens: adhere to the project's existing color palette, spacing scale, font choices, and dark mode patterns.
- Stick to the project's established icon set (e.g., Lucide, Heroicons, Phosphor) instead of pulling in an extra icon package.
- Do not introduce a second state management system (e.g., adding Redux when Zustand or React Context is already used).
