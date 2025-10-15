---
description: Generates a Pull Request description based on the diff with the specified branch
argument-hint: <branch_name>
allowed-tools:
  - Bash
---

# Pull Request Description Generator

First, run a `git diff` between the current local branch and `$1`:

```bash
git diff $1
```

Then, create a Pull Request description for the differences between the current branch and `$1`, following this template (in pt‑BR):

---

## O que é
[Business‑oriented description – explain the value and impact of the change]

## O que foi feito
[Technical description of the modifications – list the main implemented changes]

## Débito técnico
[List technical debts introduced or resolved, if any. If none, indicate “Nenhum débito técnico identificado”]

---

Analyze the diff carefully and provide a clear and complete description in each section.