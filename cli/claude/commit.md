---
description: Generates a one-line commit message based on the current changes
allowed-tools:
  - Bash
---

# Commit Message Generator

Run `git diff` to view the changes:

```bash
git diff
```

Create a single‑line commit message based on the diff above.

The message should:
- Be concise and descriptive
- Start with an imperative verb (e.g., Add, Fix, Update, Remove, Refactor)
- Be no longer than 72 characters
- Summarize the main change clearly

Provide only the commit message, with no additional explanations.