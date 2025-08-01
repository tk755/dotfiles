---
allowed-tools: Bash(git status:*), Bash(git commit:*)
description: Create a git commit
---

## Context

- Current git status: !`git status`
- Current git diff (staged changes): !`git diff --cached`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -15`

## Your task

Create a concise git commit message based on the changes made in the repository. Focus on what the user will experience or what functionality was added/improved, not implementation details like "refactor" or internal code organization. Follow the style of recent commit messages in this repository.

Do not add any co-author attribution or generated-with tags to the commit message.