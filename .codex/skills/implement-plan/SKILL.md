---
name: implement-plan
description: Delegate an approved implementation plan to one worker while the main agent coordinates and reviews the result.
---

# Implement Plan

Use the supplied plan or the approved plan in the conversation. Save it before delegation, capturing consequential decisions and acceptance criteria. Follow AGENTS.md and repository planning conventions, including PLANS.md and master-plan updates where required.

Spawn one worker to implement the approved scope through completion. Give it the plan path, workspace, and relevant constraints. The worker owns code changes, validation, and implementation progress records. Request concise results with validation evidence and remaining work. Avoid concurrent edits to its files.

Keep the main chat responsible until implementation finishes; do not end immediately after delegation. While waiting, answer user messages, relay relevant changes to the worker, and resume coordination. Keep implementation running unless the user requests a stop or changes its scope.

Keep the worker running while we converse. When implementation finishes, notify me that it is ready for review. Review the diff and validation evidence when I request it.
